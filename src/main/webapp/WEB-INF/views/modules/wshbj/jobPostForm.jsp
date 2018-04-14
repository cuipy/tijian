<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工作岗位管理管理</title>
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
		<li><a href="${ctx}/wshbj/jobPost/list">工作岗位管理列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/jobPost/form?id=${jobPost.id}">工作岗位管理<shiro:hasPermission name="wshbj:jobPost:edit">${not empty jobPost.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:jobPost:edit">查看</shiro:lacksPermission></a></li>
		<!--li><a href="${ctx}/wshbj/jobPost/list4Pull">快速添加</a></li-->
	</ul><br/>
	<form:form id="inputForm" modelAttribute="jobPost" action="${ctx}/wshbj/jobPost/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="45" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:jobPost:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

	<div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 岗位管理属于岗位的字典列表<br>
      2. 岗位用于体检人，每个体检人必定属于某种岗位<br>
      3. 不同岗位体检人的检查项目和健康证可以选择不同的设置

    </div>


</body>
</html>