<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>制卡记录管理</title>
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

		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/certRecord/">制卡记录列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/certRecord/form?id=${certRecord.id}">制卡记录<shiro:hasPermission name="wshbj:certRecord:edit">${not empty certRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:certRecord:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="certRecord" action="${ctx}/wshbj/certRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">卡号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">体检编号：</label>
			<div class="controls">
				<form:input path="examinationCode" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">体检用户：</label>
			<div class="controls">
				<input id="userName" name="userName" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证号：</label>
			<div class="controls">
				<form:input path="idNumber" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="userName" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
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
			<shiro:hasPermission name="wshbj:certRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>