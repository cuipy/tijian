<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查项目类型管理</title>
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
		<li><a href="${ctx}/wshbj/examinationItemType/list">检查项目类型列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationItemType/form?id=${examinationItemType.id}">检查项目类型<shiro:hasPermission name="wshbj:examinationItemType:edit">${not empty examinationItemType.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationItemType:edit">查看</shiro:lacksPermission></a></li>
		<!--li><a href="${ctx}/wshbj/examinationItemType/list4Pull">快速添加</a></li-->
	</ul><br/>

	<div class="">
	<form:form id="inputForm" modelAttribute="examinationItemType" action="${ctx}/wshbj/examinationItemType/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group span12">
			<label class="control-label"><font color="red">*</font>编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="45" class="input-medium" readonly="true"/>
				<span class="help-inline"> 自动生成 </span>
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
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group span12">
			<label class="control-label"><font color="red">*</font>检查小类：</label>
			<div class="controls">
				<form:select path="itemCategoryId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${itemCategoryList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group span12">
			<label class="control-label">检查部门：</label>
			<div class="controls">
				<form:select path="examinationDeptId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${deptList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group span12">
			<label class="control-label">提示信息：</label>
			<div class="controls">
				<form:input path="tips" htmlEscape="false"  maxlength="100" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions span12">
			<shiro:hasPermission name="wshbj:examinationItemType:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		<div class="cl"></div>
	</form:form>
	</div>
    <div class="help-div">
    <div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 项目类型可以理解为检查项目的<span class="help-inline">小类</span><br>
      2. 项目类型表示检查的大类，一般可以对应到科室或中心<br>
      3. 默认，项目类型包括<span class="help-inline"> 采血、采便、内科、眼科、放射科 </span>。<br><br>

      <strong>作用：</strong> <br>
      1. 该属性上承<span class="help-inline">检查大类</span>，下接<span class="help-inline">检查项目</span>。<br>
      2. 可以理解为检查细项的大分类。<br>
      3. 对应“医院卫生保健管理系统 2.5”中<span class="help-inline">检查项目 - 项目类型 </span>
    </div>
    </div>


</body>
</html>