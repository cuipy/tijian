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
				idx: idx, delBtn: false, row: row
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




	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/inputResult">体检结果</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">编号：</label>
			<div class="controls">
				<input id="examinationCode" name="examinationCode" class="input-xlarge required"/>
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
		<div class="control-group" id="itemsDiv" >
			<label class="control-label">检查项目列表：</label>
			<div class="controls">
				<table id="contentTable" class="table table-striped table-bordered table-condensed">
					<thead>
					<tr>
						<th class="hide"></th>
						<th width="200">检查项目</th>
						<th width="100">结果</th>
						<th>结果备注</th>
					</tr>
					</thead>
					<tbody id="examinationRecordItemList">
					</tbody>
				</table>
				<script type="text/template" id="examinationRecordItemTpl">//<!--
					<tr id="examinationRecordItemList{{idx}}">
						<td class="hide">
							<input id="examinationRecordItemList{{idx}}_id" name="examinationRecordItemList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
							<input id="examinationRecordItemList{{idx}}_delFlag" name="examinationRecordItemList[{{idx}}].delFlag" type="hidden" value="0"/>
						</td>
						<td>
							<input id="examinationRecordItemList{{idx}}_itemId" name="examinationRecordItemList[{{idx}}]._itemId" type="hidden" value="{{row._itemId}}"/>
							<input id="examinationRecordItemList{{idx}}_itemName" name="examinationRecordItemList[{{idx}}]._itemName" type="text" value="{{row.itemId}}"/>

						</td>
						<td>
							<select id="examinationRecordItemList{{idx}}_itemId" name="examinationRecordItemList[{{idx}}].itemId" data-value="{{row.itemId}}" class="input-small required">
									<option value="">请选择</option>
								</select>
						</td>
						<td>
							<input id="examinationRecordItemList{{idx}}_remarks" name="examinationRecordItemList[{{idx}}].remarks" type="text"  class="input-xxlarge ">{{row.remarks}}</textarea>
						</td>

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