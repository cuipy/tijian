<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>制卡记录浏览</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {


		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/certRecord/">制卡记录列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/certRecord/view?id=${certRecord.id}">制卡记录
		<shiro:lacksPermission name="wshbj:certRecord:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="certRecord" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">卡号：</label>
			<div class="controls">
				${certRecord.code}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">体检编号：</label>
			<div class="controls">
				${certRecord.examinationCode}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证号：</label>
			<div class="controls">
				${certRecord.idNumber}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				${certRecord.userName}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				${certRecord.remarks}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属体检中心：</label>
			<div class="controls">
				${certRecord.owner}

			</div>
		</div>
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>