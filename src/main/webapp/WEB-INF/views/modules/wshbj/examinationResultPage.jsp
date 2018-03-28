<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检结果浏览</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {


		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/examinationResult/">体检结果列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationResult/view?id=${examinationResult.id}">体检结果
		<shiro:lacksPermission name="wshbj:examinationResult:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="examinationResult" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">体检编号：</label>
			<div class="controls">
				${examinationResult.examinationCode}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样本编号：</label>
			<div class="controls">
				${examinationResult.sampleCode}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目：</label>
			<div class="controls">
				${examinationResult.itemName}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目id：</label>
			<div class="controls">
				${examinationResult.itemId}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">体检结果：</label>
			<div class="controls">
				${examinationResult.resultDictId}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				${examinationResult.remarks}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属体检中心：</label>
			<div class="controls">
				${examinationResult.owner}

			</div>
		</div>
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>