<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>序列编号定义管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#value").focus();
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
		<li><a href="${ctx}/sys/sequenceDefine/">序列编号定义列表</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="sequenceDefine" action="${ctx}/sys/sequenceDefine/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">描述:</label>
			<div class="controls">
				${ sequenceDefine.annDescribe}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">类 - 方法:</label>
			<div class="controls">
				${ sequenceDefine.className} - ${ sequenceDefine.methodName}
				<form:hidden path="className"/><form:hidden path="methodName"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">默认表达式:</label>
			<div class="controls">
				${ sequenceDefine.annExpress}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">自定义编号:</label>
			<div class="controls">
				<form:input path="customExpress" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sys:sequenceDefine:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>