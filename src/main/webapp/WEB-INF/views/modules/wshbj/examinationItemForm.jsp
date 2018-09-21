<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查项目管理</title>
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
		<li><a href="${ctx}/wshbj/examinationItem/list">检查项目列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationItem/form?id=${examinationItem.id}">检查项目<shiro:hasPermission name="wshbj:examinationItem:edit">${not empty examinationItem.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationItem:edit">查看</shiro:lacksPermission></a></li>
		<!--li><a href="${ctx}/wshbj/examinationItem/list4Pull">快速添加</a></li-->
	</ul>

	<div class="box1">
	<div class="max-width:1200px;">
	<form:form id="inputForm" modelAttribute="examinationItem" action="${ctx}/wshbj/examinationItem/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group span12">
			<label class="control-label"><font color="red">*</font> 编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="45" class="input-medium" readonly="true"/>
				<span class="help-inline"> 不需填写，保存时自动生成 </span>
			</div>
		</div>
		<div class="cl"></div>
		<div class="control-group span6">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium required"/>
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

		<div class="control-group span12">
			<label class="control-label">录入结果部门：</label>
			<div class="controls radios-div">
				<form:radiobuttons path="resultDeptId" items="${depts}" itemLabel="name" itemValue="id" htmlEscape="false"/>
			</div>
		</div>
		<!-- div class="control-group span12">
			<label class="control-label">单位：</label>
			<div class="controls">
				<form:input path="unit" htmlEscape="false" maxlength="64" class="input-medium"/>
				<span class="help-inline"> </span>
			</div>
		</div -->
		<div class="control-group span12">
			<label class="control-label">价格：</label>
			<div class="controls">
				<form:input path="price" htmlEscape="false" maxlength="45" class="input-medium "/>
			</div>
		</div>
		<!-- div class="control-group span12">
			<label class="control-label">参考范围：</label>
			<div class="controls">
				<form:input path="rangeMin" htmlEscape="false" maxlength="45" class="input-small"/>
				<span class="help-inline"> - </span>
				<form:input path="rangeMax" htmlEscape="false" maxlength="45" class="input-small"/>
			</div>
		</div -->

		<div class="control-group span12">
			<label class="control-label">所需标本：</label>
			<div class="controls radios-div">
				<span><input id="specimenNo" name="specimenId" type="radio" value="0" <c:if test="${examinationItem.needSamples=='0'}">checked='checked'</c:if> >
				<label for="specimenNo">不需要标本</label></span>
				<form:radiobuttons path="specimenId" items="${specimenList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
			</div>
		</div>
		 <div class="cl"></div>
        <div class="control-group span6">
            <label class="control-label">样本编号前缀：</label>
            <div class="controls">
                <form:input path="prefixSampleCode" htmlEscape="false" maxlength="16" class="input-medium"/>
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
			<label class="control-label">编号样式：</label>
			<div class="controls radios-div">
				<input path="codeType" name="codeType" <c:if test="${examinationItem.codeType=='0'}">checked='checked'</c:if>   type="radio" value="0"/>双位年
				<input path="codeType" name="codeType"  <c:if test="${examinationItem.codeType=='1'}">checked='checked'</c:if>  type="radio" value="1"/>四位年月
				<input path="codeType" name="codeType"  <c:if test="${examinationItem.codeType=='2'}">checked='checked'</c:if>  type="radio" value="2"/>六位年月日

			</div>
		</div>

		<div class="cl"></div>

		<div class="control-group span12">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions span12">
			<shiro:hasPermission name="wshbj:examinationItem:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		<div class="cl"></div>
	</form:form>
	</div>

    <div class="help-div">
    <div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 检查项目属于<span class="help-inline">检查细类</span><br>
      2. 设置检查项目需要定义<span class="help-inline">单位、价格、所属标本类型等</span><br>

      <strong>作用：</strong> <br>
      1. 检查项目属于检查的细类，上承<span class="help-inline">项目类型(小类) - 检查大类(大类)</span><br>

    </div></div>
    </div>
</body>
</html>