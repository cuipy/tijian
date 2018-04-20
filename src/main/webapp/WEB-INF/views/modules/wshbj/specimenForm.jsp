<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查标本类型管理</title>
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
		<li><a href="${ctx}/wshbj/specimen/list">检查标本类型列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/specimen/form?id=${specimen.id}">检查标本类型<shiro:hasPermission name="wshbj:specimen:edit">${not empty specimen.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:specimen:edit">查看</shiro:lacksPermission></a></li>
		<!--li><a href="${ctx}/wshbj/specimen/list4Pull">快速添加</a></li-->
	</ul><br/>

	<div class="row">
	<form:form id="inputForm" modelAttribute="specimen" action="${ctx}/wshbj/specimen/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="45" class="input-large required"/>
				<span class="help-inline"> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><font color="red">*</font>名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-large required"/>
				<span class="help-inline"> </span>
			</div>
		</div>
		<div class="control-group">
            <label class="control-label">样本编号的前缀：</label>
            <div class="controls">
                <form:input path="prefix" htmlEscape="false" maxlength="16" class="input-large required"/>
            </div>
        </div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-large "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:specimen:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
    </div>

	<div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 标本类型默认包括：<span class="help-inline">血样和便样</span> 两项<br>
      2. 操作人可以增加标本类型<br>

    </div>

</body>
</html>