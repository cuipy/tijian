<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查小类管理</title>
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
		<li><a href="${ctx}/wshbj/examinationItemCategory/list">检查小类列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationItemCategory/form?id=${examinationItemCategory.id}">检查小类<shiro:hasPermission name="wshbj:examinationItemCategory:edit">${not empty examinationItemCategory.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationItemCategory:edit">查看</shiro:lacksPermission></a></li>
		<!--li><a href="${ctx}/wshbj/examinationItemCategory/list4Pull">快速添加</a></li-->
	</ul><br/>

	<div class="row">
	<form:form id="inputForm" modelAttribute="examinationItemCategory" action="${ctx}/wshbj/examinationItemCategory/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label"><font color="red">*</font>编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="45" class="input-xlarge" readonly="true"/>
				<span class="help-inline">自动生成 </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><font color="red">*</font>名称：</label>
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
			<shiro:hasPermission name="wshbj:examinationItemCategory:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
    </div>

    <div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 检查小类属于项目类型下的分类，非必填项目<br><br>

      <strong>作用：</strong> <br>
      1. 检查小类用于<span class="help-inline">检查小类</span>中<br>
      2. 该属性主要检查小类中做分类筛选<br>
      3. 本属性对应“医院卫生保健管理系统 2.5”中<span class="help-inline">检查项目 - 项目类型 - 分类</span>

    </div>

</body>
</html>