<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检样本浏览</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {


		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/examinationSamples/">体检样本列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationSamples/view?id=${examinationSamples.id}">体检样本
		<shiro:lacksPermission name="wshbj:examinationSamples:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="examinationSamples" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">体检编号：</label>
			<div class="controls">
				${examinationSamples.examinationCode}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">编号：</label>
			<div class="controls">
				${examinationSamples.code}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目id：</label>
			<div class="controls">
				${examinationSamples.itemId}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">体检用户：</label>
			<div class="controls">
				${examinationSamples.userId}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				${examinationSamples.remarks}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属体检中心：</label>
			<div class="controls">
				${examinationSamples.owner}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">1-初检，2-复检：</label>
			<div class="controls">
				${examinationSamples.examinationFlag}

			</div>
		</div>
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>