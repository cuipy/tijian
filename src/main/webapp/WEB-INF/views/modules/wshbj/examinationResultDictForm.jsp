<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检结果字典管理</title>
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
		<li><a href="${ctx}/wshbj/examinationResultDict/">体检结果字典列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationResultDict/form?id=${examinationResultDict.id}">体检结果字典<shiro:hasPermission name="wshbj:examinationResultDict:edit">${not empty examinationResultDict.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationResultDict:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="examinationResultDict" action="${ctx}/wshbj/examinationResultDict/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">检查项目：</label>
			<div class="controls">
				<form:select path="itemId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${examinationItemList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否合格：</label>
			<div class="controls">
				<form:select path="flag" class="input-xlarge required">
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否默认：</label>
			<div class="controls">
				<form:select path="defaultFlag" class="input-xlarge required">
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">具体描述：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationResultDict:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

	<div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 项目结果准确的解释为：<span class="help-inline">检查项目的结果选项</span><br>
      2. 项目结果是针对检查结果定义的属性，可以理解为结果选项字典<br>
      3. 项目结果只有两种选项：合格和不合格<br

    </div>

</body>
</html>