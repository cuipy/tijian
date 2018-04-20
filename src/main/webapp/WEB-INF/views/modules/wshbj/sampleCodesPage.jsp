<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>样本编号库浏览</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {


		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/sampleCodes/">样本编号库列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/sampleCodes/view?id=${sampleCodes.id}">样本编号库
		<shiro:lacksPermission name="wshbj:sampleCodes:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="sampleCodes" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">样本类型ID：</label>
			<div class="controls">
				${sampleCodes.specimenId}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样本类型名称：</label>
			<div class="controls">
				${sampleCodes.specimenName}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">批次id：</label>
			<div class="controls">
				${sampleCodes.packId}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样本编号：</label>
			<div class="controls">
				${sampleCodes.sampleCode}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否使用，0未使用 1已使用：</label>
			<div class="controls">
				${sampleCodes.isUsed}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">auth_id：</label>
			<div class="controls">
				${sampleCodes.authId}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">作者：</label>
			<div class="controls">
				${sampleCodes.authName}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				${sampleCodes.remarks}

			</div>
		</div>
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>