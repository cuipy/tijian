<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>序列编号定义管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/sequenceDefine/">序列编号定义列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="sequenceDefine" action="${ctx}/sys/sequenceDefine/" method="post" class="breadcrumb form-search">
		<label>类名：</label><form:input id="className" path="className" htmlEscape="false" maxlength="50"  class="input-medium"/>
		&nbsp;&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>描述</th><th>类 - 方法</th><th>注解表达式</th><th>自定义表达式</th><shiro:hasPermission name="sys:sequenceDefine:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${list}" var="sequenceDefine">
			<tr>
				<td>${sequenceDefine.annDescribe}</td>
				<td><a href="${ctx}/sys/sequenceDefine/form?<c:if test="${sequenceDefine.id != null}">id=${sequenceDefine.id}</c:if><c:if test="${sequenceDefine.id == null}">className=${sequenceDefine.className}&methodName=${sequenceDefine.methodName}</c:if>">${sequenceDefine.className} - ${sequenceDefine.methodName} </a></td>
				<td>${sequenceDefine.annExpress}</td>
				<td>${sequenceDefine.customExpress}</td>
				<shiro:hasPermission name="sys:sequenceDefine:edit"><td>

    				<a href="${ctx}/sys/sequenceDefine/form?<c:if test="${sequenceDefine.id != null}">id=${sequenceDefine.id}</c:if><c:if test="${sequenceDefine.id == null}">className=${sequenceDefine.className}&methodName=${sequenceDefine.methodName}</c:if>">修改</a>
					<c:if test="${sequenceDefine.id != null}"><a href="${ctx}/sys/sequenceDefine/delete?id=${sequenceDefine.id}" onclick="return confirmx('确认要删除该字典吗？', this.href)">删除</a></c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>