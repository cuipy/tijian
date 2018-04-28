<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查大类管理</title>
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
		<li><a href="${ctx}/wshbj/examinationCategory/list">检查大类列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationCategory/form?id=${examinationCategory.id}">检查大类<shiro:hasPermission name="wshbj:examinationCategory:edit">${not empty examinationCategory.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationCategory:edit">查看</shiro:lacksPermission></a></li>
		<!-- li><a href="${ctx}/wshbj/examinationCategory/list4Pull">快速添加</a></li -->
	</ul><br/>
	<div class="row">
	<form:form id="inputForm" modelAttribute="examinationCategory" action="${ctx}/wshbj/examinationCategory/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label"><font color="red">*</font>编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="45" class="input-xlarge" readonly="true"/>
				<span class="help-inline"> 自动生成</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><font color="red">*</font> 名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationCategory:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	</div>

	<div class="alert alert-success">
          <strong>帮助：</strong> <br>
          1. 检查大类可以理解为检查项目的<span class="help-inline">大类</span><br>
          2. 检查大类表示何种类型的检查，比如：健康证检查<br>
          3. 默认，检查大类只有一个<span class="help-inline">健康证检查</span>。<br><br>

          <strong>作用：</strong> <br>
          1. 检查大类用于项目分类和项目类型中，设置是用于何种目的而检查的。<br>
          2. 该功能对应“医院卫生保健管理系统 2.5”中<span class="help-inline">检查项目 - 项目类型 - 检查大类</span>
        </div>

</body>
</html>