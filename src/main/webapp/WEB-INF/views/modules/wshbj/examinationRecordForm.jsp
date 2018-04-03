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



            $('#idNumber').bind('keypress',function(event){
                if(event.keyCode == 13) {
                    var idNumber = $('#idNumber').val();
                    var url = '${ctx}/wshbj/examinationUser/getByIdNumber';
                    $.post(url,{idNumber:idNumber},function (data) {
                        if(data){
                            setUserPro(data);
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

        function test() {

        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/form?id=${examinationRecord.id}">体检记录<shiro:hasPermission name="wshbj:examinationRecord:edit">${not empty examinationRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationRecord:edit">查看</shiro:lacksPermission></a></li>
        <li><a href="${ctx}/wshbj/examinationRecord/">体检记录列表</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="45" ondblclick="test();" readonly="true" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">体检用户：</label>
			<div class="controls">
				<wshbj:euserTreeSelect id="user" name="user.id" value="${examinationRecord.user.id}" labelName="user.name" labelValue="${examinationRecord.user.name}"
									   title="用户" url="/wshbj/organ/treeData" allowInput="true" dataMsgRequired="必填信息"
									   cssClass="input-xlarge required" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证号：</label>
			<div class="controls">
				<form:input path="idNumber" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="phoneNumber" htmlEscape="false" maxlength="45" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
				<form:select path="sex" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
	<div class="control-group">
		<label class="control-label">行业：</label>
		<div class="controls">
			<form:select path="industryId"  class="input-xlarge">
				<form:option value="">
					请选择
				</form:option>
				<form:options items="${industryList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
			</form:select>
		</div>
	</div>
		<div class="control-group" >
			<label class="control-label">单位：</label>
			<div class="controls">
				<form:select  path="organId"  class="input-xlarge">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${organList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
	<div class="control-group">
		<label class="control-label">岗位：</label>
		<div class="controls">
			<form:select path="postId" class="input-xlarge">
				<form:option value="">
					请选择
				</form:option>
				<form:options items="${postList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
			</form:select>
		</div>
	</div>

		<div class="control-group">
			<label class="control-label">出生日期：</label>
			<div class="controls">
				<form:input path="birthday" htmlEscape="false" maxlength="45" autocomplete="true" readonly="true" class="input-medium Wdate required"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>


		<div class="control-group">
			<label class="control-label">价格：</label>
			<div class="controls">
				<form:input path="packagePrice" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group-100">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">体检项目方式：</label>
			<div class="controls">
				<input type="radio" id="itemType1" name="itemType" value="1" /><label for="itemType1">体检套餐</label>
				<input type="radio" id="itemType2" name="itemType" value="2" /><label for="itemType2">自由选择</label>
			</div>
		</div>
		<div class="control-group" id="packageIdDiv" style="<c:if test="${examinationRecord.itemType eq 2}">display: none;</c:if>">
			<label class="control-label">体检套餐：</label>
			<div class="controls">
				<form:select path="packageId" class="input-xlarge">
					<form:options items="${packageList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group" id="itemsDiv" style="<c:if test="${empty examinationRecord.itemType or examinationRecord.itemType eq 1}">display: none;</c:if>">
			<label class="control-label">检查项目列表：</label>
			<div class="controls">
				<table id="contentTable" class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th class="hide"></th>
							<th>检查项目</th>
							<th>体检结果</th>
							<th>结果备注</th>
							<shiro:hasPermission name="wshbj:examinationRecord:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody id="examinationRecordItemList">
					</tbody>
					<shiro:hasPermission name="wshbj:examinationRecord:edit"><tfoot>
						<tr><td colspan="6"><a href="javascript:" onclick="addRow('#examinationRecordItemList', examinationRecordItemRowIdx, examinationRecordItemTpl);examinationRecordItemRowIdx = examinationRecordItemRowIdx + 1;" class="btn">新增</a></td></tr>
					</tfoot></shiro:hasPermission>
				</table>
				<script type="text/template" id="examinationRecordItemTpl">//<!--
					<tr id="examinationRecordItemList{{idx}}">
						<td class="hide">
							<input id="examinationRecordItemList{{idx}}_id" name="examinationRecordItemList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
							<input id="examinationRecordItemList{{idx}}_delFlag" name="examinationRecordItemList[{{idx}}].delFlag" type="hidden" value="0"/>
						</td>
						<td>
							<select id="examinationRecordItemList{{idx}}_itemId" name="examinationRecordItemList[{{idx}}].itemId" data-value="{{row.itemId}}" class="input-small required">
									<option value="">请选择</option>
									<c:forEach items="${examinationItemList}" var="examinationItem">
										<option value="${examinationItem.id}">${examinationItem.name}</option>
									</c:forEach>
								</select>
						</td>
						<td>
							<input id="examinationRecordItemList{{idx}}_resultDictId" name="examinationRecordItemList[{{idx}}].resultDictId" type="text" value="{{row.resultDictId}}" maxlength="64" class="input-small"/>
						</td>
						<td>
							<input id="examinationRecordItemList{{idx}}_remarks" name="examinationRecordItemList[{{idx}}].remarks" type="text"  class="input-xxlarge ">{{row.remarks}}</textarea>
						</td>
						<shiro:hasPermission name="wshbj:examinationRecord:edit"><td class="text-center" width="10">
							{{#delBtn}}<span class="close" onclick="delRow(this, '#examinationRecordItemList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
						</td></shiro:hasPermission>
					</tr>//-->
				</script>
				<script type="text/javascript">
					var examinationRecordItemRowIdx = 0, examinationRecordItemTpl = $("#examinationRecordItemTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
					$(document).ready(function() {
						var data = ${fns:toJson(examinationRecord.examinationRecordItemList)};
						for (var i=0; i<data.length; i++){
							addRow('#examinationRecordItemList', examinationRecordItemRowIdx, examinationRecordItemTpl, data[i]);
							examinationRecordItemRowIdx = examinationRecordItemRowIdx + 1;
						}
					});
				</script>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>