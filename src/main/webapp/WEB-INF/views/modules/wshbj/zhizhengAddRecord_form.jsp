<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新增制证数量编号</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
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
		<li><a href="${ctx}/wshbj/zhizhengAddRecord/list">制证数管理列表</a></li>
		<shiro:hasPermission name="wshbj:zhizhengAddRecord:edit">
			<li  class="active"><a href="${ctx}/wshbj/zhizhengAddRecord/add">增加制证数</a></li>
		</shiro:hasPermission>
	</ul>

	<div class="box1">
	<form:form id="inputForm" modelAttribute="zhizhengAddRecord" action="${ctx}/wshbj/zhizhengAddRecord/do_add" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group span12">
            <label class="control-label">体检中心ID：</label>
            <div class="controls">
                ${ownerId}
                <span class="help-inline"> </span>
            </div>
        </div>
        <div class="cl"></div>
        <div class="control-group span12">
            <label class="control-label">种子编码：</label>
            <div class="controls">
                ${currAddCord}
                <span class="help-inline"> </span>
            </div>
        </div>
        <div class="cl"></div>
        <div class="control-group span12">
            <label class="control-label">剩余制证数量：</label>
            <div class="controls">
                ${currResultCount}
                <span class="help-inline"> </span>
            </div>
        </div>
        <div class="cl"></div>
		<div class="control-group span12">
			<label class="control-label">制证编号：</label>
			<div class="controls">
				<form:input path="add_code" htmlEscape="false" maxlength="45" class="input-xxlarge"  />
				<span class="help-inline"> </span>
			</div>
		</div>

		<div class="form-actions span12">
			<shiro:hasPermission name="wshbj:zhizhengAddRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		<div class="cl"></div>
	</form:form>
    </div>

    </div>

</body>
</html>