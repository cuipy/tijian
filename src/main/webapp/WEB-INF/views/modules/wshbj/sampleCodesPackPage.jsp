<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>样本编号包浏览</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {


		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/sampleCodesPack/">样本编号包列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/sampleCodesPack/view?id=${sampleCodesPack.id}">样本编号包
		<shiro:lacksPermission name="wshbj:sampleCodes:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="sampleCodesPack" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">样本类型ID：</label>
			<div class="controls">
				${sampleCodesPack.specimenId}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样本类型名称：</label>
			<div class="controls">
				${sampleCodesPack.specimenName}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样本编号数量：</label>
			<div class="controls">
				${sampleCodesPack.codeCount}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">auth_id：</label>
			<div class="controls">
				${sampleCodesPack.authId}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">作者：</label>
			<div class="controls">
				${sampleCodesPack.authName}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				${sampleCodesPack.remarks}

			</div>
		</div>
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>