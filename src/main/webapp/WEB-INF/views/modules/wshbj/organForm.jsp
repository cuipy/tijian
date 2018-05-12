<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检单位管理</title>
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
		<li><a href="${ctx}/wshbj/organ/">体检单位列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/organ/form?id=${organ.id}">体检单位<shiro:hasPermission name="wshbj:organ:edit">${not empty organ.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:organ:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>

	<div class="">
	<form:form id="inputForm" modelAttribute="organ" action="${ctx}/wshbj/organ/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group span6">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group span6">
            <label class="control-label">全拼：</label>
            <div class="controls">
                <form:input path="namePinyin" htmlEscape="false" maxlength="128" class="input-medium"/>
            </div>
        </div>

        <div class="control-group span6">
            <label class="control-label">顺序值：</label>
            <div class="controls">
                <form:input type="number" step="1" path="orderNumb" htmlEscape="false" maxlength="10" class="input-medium "/>
            </div>
        </div>
        <div class="cl"></div>
		<div class="control-group span12">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions span12">
			<shiro:hasPermission name="wshbj:organ:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		<div class="cl"></div>
	</form:form>

	</div>

	    <div class="alert alert-success">
          <strong>帮助：</strong> <br>
          1. 体检单位，每个体检人必须属于一个单位。<br>


        </div>

</body>
</html>