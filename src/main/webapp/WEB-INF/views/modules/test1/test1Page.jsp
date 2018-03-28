<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>测试1浏览</title>
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
		<li><a href="${ctx}/test1/test1/">测试1列表</a></li>
		<li class="active"><a href="${ctx}/test1/test1/view?id=${test1.id}">测试1
		<shiro:lacksPermission name="test1:test1:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="test1" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">头像：</label>
			<div class="controls">
				<img src="${test1.headImg}" style="width:240px"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				${test1.title}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">文档密码：</label>
			<div class="controls">

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="controls">
				${fns:unescapeHtml(test1.content)}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">作者名：</label>
			<div class="controls">
				${test1.auth.name}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">作者工号：</label>
			<div class="controls">
				${test1.auth.no}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发布单位：</label>
			<div class="controls">
				${test1.danwei}

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				${test1.remarks}

			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="test1:test1:view"><input id="btnPrint" class="btn btn-info" type="button" value="打 印"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>