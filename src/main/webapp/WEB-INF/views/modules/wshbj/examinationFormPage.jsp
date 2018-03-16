<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检流程表模板浏览</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#btnPrint").click(function(){
                $("#inputForm").print({noPrintSelector:'.no-print',iframe:false});
            });

		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/examinationForm/">体检流程表模板列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationForm/view?id=${examinationForm.id}">体检流程表模板
		<shiro:lacksPermission name="wshbj:examinationForm:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="examinationForm" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">编号：</label>
			<div class="controls">
				${examinationForm.code}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				${examinationForm.name}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				${examinationForm.remarks}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">参考标识：0-否，1-是：</label>
			<div class="controls">
				${examinationForm.referenceFlag}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属体检中心：</label>
			<div class="controls">
				${examinationForm.owner}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">模板路径：</label>
			<div class="controls">
				${examinationForm.templatePath}

			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationForm:view"><input id="btnPrint" class="btn btn-info" type="button" value="打 印"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>