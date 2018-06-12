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


	<div class="box1">
	<form:form id="inputForm" modelAttribute="specimen" action="${ctx}/wshbj/specimen/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group span12">
			<label class="control-label">编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="45" class="input-medium" readonly="true"/>
				<span class="help-inline"> </span>
			</div>
		</div>
		<div class="cl"></div>
		<div class="control-group span6">
			<label class="control-label"><font color="red">*</font>名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium required"/>
				<span class="help-inline"> </span>
			</div>
		</div>
		<div class="control-group span6">
            <label class="control-label">全拼：</label>
            <div class="controls">
                <form:input path="namePinyin" htmlEscape="false" maxlength="128" class="input-medium"/>
            </div>
        </div>

        <div class="cl"></div>
        <div class="control-group span12">
            <label class="control-label">采样部门：</label>
            <div class="controls radios-div">
                <form:radiobuttons path="grabDeptId" items="${depts}" itemLabel="name" itemValue="id" htmlEscape="false"/>
            </div>
        </div>

        <div class="cl"></div>
        <div class="control-group span6">
            <label class="control-label">顺序值：</label>
            <div class="controls">
                <form:input type="number" step="1" path="orderNumb" htmlEscape="false" maxlength="10" class="input-medium "/>
            </div>
        </div>

		<div class="control-group span12">
            <label class="control-label">样本编号前缀：</label>
            <div class="controls">
                <form:input path="prefix" htmlEscape="false" maxlength="16" class="input-medium required"/>
            </div>
        </div>
        <div class="cl"></div>
		<div class="control-group  span12">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions span12">
			<shiro:hasPermission name="wshbj:specimen:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		<div class="cl"></div>
	</form:form>
    </div>

<div class="help-div">
	<div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 标本类型默认包括：<span class="help-inline">血样和便样</span> 两项<br>
      2. 操作人可以增加标本类型<br>

    </div></div>
    </div>

</body>
</html>