<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>样本编号包管理</title>
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
		<li><a href="${ctx}/wshbj/sampleCodesPack/">样本编号包列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/sampleCodesPack/form?id=${sampleCodesPack.id}">样本编号包<shiro:hasPermission name="wshbj:sampleCodes:edit">${not empty sampleCodesPack.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:sampleCodes:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="sampleCodesPack" action="${ctx}/wshbj/sampleCodesPack/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">样本类型：</label>
			<div class="controls">
				<form:select path="specimenId" class="input-medium">
                    <form:option value="">  请选择 </form:option>
                    <form:options items="${specimenList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                </form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样本编号数量：</label>
			<div class="controls">
				<form:input path="codeCount" htmlEscape="false" maxlength="10" class="input-large "/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions span12">
			<shiro:hasPermission name="wshbj:sampleCodes:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>