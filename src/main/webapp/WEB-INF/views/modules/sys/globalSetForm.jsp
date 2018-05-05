<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>全局参数配置管理</title>
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
			$("#btnPrint").click(function(){
                $("#inputForm").print({noPrintSelector:'.no-print',iframe:false});
            });

		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/globalSet/form?id=${globalSet.id}">全局参数配置</a>	</li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="globalSet" action="${ctx}/sys/globalSet/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		

		<div class="control-group">
			<label class="control-label">当前体检中心编号前缀：</label>
			<div class="controls">
				<form:input path="codePre" htmlEscape="false" maxlength="16" class="input-xlarge "/>
				<span class="help-inline">该前缀将加在系统各种编号前</span>
			</div>
		</div>
		<div class="control-group">
            <label class="control-label">当前体检中心token：</label>
            <div class="controls">
                <form:input path="token" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                <span class="help-inline">token是在体检管理中心验证的编码，每个体检中心有唯一的编码，该编码验证体检中心与体检管理中心的交互</span>
            </div>
        </div>
		<div class="control-group">
            <label class="control-label">体检中心ID：</label>
            <div class="controls">
                <c:if test="${globalSet.owner == ''}"> 未创建体检中心，请在<a href="${ctx}/sys/office/">机构管理</a> - 体检中心节点下创建类型为公司的结构。作为您的体检中心机构</c:if>
                <c:if test="${globalSet.owner != ''}"> ${globalSet.owner}</c:if>
                <span class="help-inline">该ID需要在体检管理中心注册，系统部署后必须创建体检中心ID</span>
            </div>
        </div>
		<div class="control-group">
			<label class="control-label">体检中心名称：</label>
			<div class="controls">
				 <c:if test="${globalSet.centerName == ''}"> 未创建体检中心，请在<a href="${ctx}/sys/office/">机构管理</a> - 体检中心节点下创建类型为公司的结构。作为您的体检中心机构</c:if>
                 <c:if test="${globalSet.centerName != ''}"> ${globalSet.centerName}</c:if>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sys:globalSet:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>