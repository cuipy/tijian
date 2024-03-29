<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行业管理管理</title>
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
		<li><a href="${ctx}/wshbj/industry/list">行业管理列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/industry/form?id=${industry.id}">行业管理<shiro:hasPermission name="wshbj:industry:edit">${not empty industry.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:industry:edit">查看</shiro:lacksPermission></a></li>
		<!--li><a href="${ctx}/wshbj/industry/list4Pull">快速添加</a></li-->
	</ul><br/>

	<div class="box1">
	<form:form id="inputForm" modelAttribute="industry" action="${ctx}/wshbj/industry/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group span6">
			<label class="control-label">编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="45" class="input-xlarge" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">全拼：</label>
			<div class="controls">
				<form:input path="namePinyin" htmlEscape="false" maxlength="128" class="input-medium"/>
			</div>
		</div>
		<div class="cl"></div>
		<div class="control-group span6">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">默认套餐：</label>
			<div class="controls">
				<form:select path="defaultPackageId" class="input-medium">
					<form:option value="">
						请选择体检套餐
					</form:option>
					<form:options items="${examinationPackages}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
        <div class="cl"></div>
        <div class="control-group span6">
            <label class="control-label">顺序值：</label>
            <div class="controls">
                <form:input type="number" step="1" path="orderNumb" htmlEscape="false" maxlength="10" class="input-medium "/>
            </div>
        </div>
		<div class="control-group span6">
			<label class="control-label">健康证：</label>
			<div class="controls">
				<form:select path="defaultJkz" class="input-medium">
					<form:option value="">
						请选择健康证格式
					</form:option>
					<form:options items="${jkzStyle}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>

         <div class="cl"></div>
        <div class="control-group span6">
            <label class="control-label">体检编号前缀：</label>
            <div class="controls">
                <form:input path="prefixExamCode" htmlEscape="false" maxlength="30" class="input-medium "/>
                <span class="help-inline"> </span>
            </div>
        </div>
		<div class="control-group span6">
			<label class="control-label">体检表：</label>
			<div class="controls">
				<form:select path="defaultHealth" class="input-medium">
					<form:option value="">
						请选择体检表格式
					</form:option>
					<form:options items="${healthStyle}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>

        <div class="cl"></div>
		<div class="control-group span6">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>

		<div class="form-actions span12">
			<shiro:hasPermission name="wshbj:industry:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		<div class="cl"></div>
	</form:form>
	</div>
<div class="help-div">
	<div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 行业管理可以增删改行业列表，例如：餐饮、医疗等<br>
      2. 在体检人注册的时候，必须选择体检人所属行业<br>
      3. 不同的行业可能健康证模板不同，通过设置不同行业的健康证打印模板<br>

    </div></div>
    </div>


</body>
</html>