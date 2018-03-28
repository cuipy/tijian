<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
            $("input[name='itemType']:radio").change(function() {
                if($(this).val()=='1'){
                    $('#packageIdDiv').show();
                    $('#itemsDiv').hide();
				}else {
                    $('#packageIdDiv').hide();
                    $('#itemsDiv').show();
				}
            });
            <c:choose>
				<c:when test="${not empty examinationRecord.id}">
					 $("input[name='itemType'][value=${examinationRecord.itemType}]").attr("checked",true);
				</c:when>
				<c:otherwise>
					$("input[name='itemType'][value='1']").attr("checked",true);
				</c:otherwise>
            </c:choose>



            $('#examinationCode').bind('keypress',function(event){
                if(event.keyCode == 13) {
                    var examinationCode = $('#examinationCode').val();
                    var url = '${ctx}/wshbj/examinationRecord/getByCode';
                    $.post(url,{code:examinationCode},function (data) {
                        if(data){
                            $('#userName').val(data.name);
                            $('#sex').val(data.sex);
                            $('#organ').val(data.organId);

                            for (var i=0; i<data.examinationRecordItemList.length; i++){
                                addRow('#examinationRecordItemList', examinationRecordItemRowIdx, examinationRecordItemTpl, data.examinationRecordItemList[i]);
                                examinationRecordItemRowIdx = examinationRecordItemRowIdx + 1;
                            }
                        }
                    });
                    //防止form提交
                    return false;
                }
            });
        });
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}


        //选择用户返回
        function userTreeselectCallBack(v, h, f) {
            if('ok'==v){
                var euserId = $('#userId').val();
                var url = '${ctx}/wshbj/examinationUser/getById';
                $.post(url,{id:euserId},function (data) {
                    if(data){
                        setUserPro(data);
                    }
                },'json');
            }else if('clear'==v){

            }
        }

        function setUserPro(data) {
            $('#userName').val(data.name);
            $('#userId').val(data.id);
            $('#idNumber').val(data.idNumber);
            $('#phoneNumber').val(data.phoneNumber);
            $('#birthday').val(data.birthday);

            $("#sex").attr("value", data.sex);
            $("#sex").trigger('change');

            $("#organId").attr("value", data.organId);
            $("#organId").trigger('change');

            $("#industryId").attr("value", data.industryId);
            $("#industryId").trigger('change');

            $("#postId").attr("value", data.postId);
            $("#postId").trigger('change');
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/collectSamples">样本采集</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">是否初检：</label>
			<div class="controls">
				<input type="radio" id="examinationFlag1" name="examinationFlag" value="1" checked/><label for="examinationFlag1">初检</label>
				<input type="radio" id="examinationFlag2" name="examinationFlag" value="2" /><label for="examinationFlag2">复检</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">采集项目：</label>
			<div class="controls">
				<select id="roleId" class="input-xlarge required">
					<c:forEach items="${itemList}" var="item">
						<shiro:hasPermission name="${item.permission}">
							<option value="${item.id}">${item.name}</option>
						</shiro:hasPermission>
					</c:forEach>
				</select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">编号：</label>
			<div class="controls">
				<input id="examinationCode" name="examinationCode" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样本号：</label>
			<div class="controls">
				<input id="samplesCode" name="sex" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<input id="userName" name="userName" readonly class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
				<input id="sex" name="sex" readonly class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">单位：</label>
			<div class="controls">
				<input id="organ" name="organ" readonly class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">采样人：</label>
			<div class="controls">
				<input id="sysUser" name="sysUser" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">采样日期：</label>
			<div class="controls">
				<form:input path="birthday" htmlEscape="false" maxlength="45" autocomplete="true" readonly="true" class="input-medium Wdate required"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>



		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>