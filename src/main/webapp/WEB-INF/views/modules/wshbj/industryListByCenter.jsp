<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行业管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
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
		<li class="active"><a href="${ctx}/wshbj/industry/listByCenter">行业管理列表</a></li>
		<shiro:hasPermission name="wshbj:industry:editByCenter"><li><a href="${ctx}/wshbj/industry/formByCenter">行业管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="industry" action="${ctx}/wshbj/industry/listByCenter" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>编号：</label>
				<form:input path="code" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>名称</th>
				<th>备注</th>
				<shiro:hasPermission name="wshbj:industry:editByCenter"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="industry">
			<tr>
				<td><a href="${ctx}/wshbj/industry/formByCenter?id=${industry.id}">
					${industry.code}
				</a></td>
				<td>
					${industry.name}
				</td>
				<td>
					${industry.remarks}
				</td>
				<shiro:hasPermission name="wshbj:industry:editByCenter"><td>
    				<a href="${ctx}/wshbj/industry/formByCenter?id=${industry.id}">修改</a>
					<a href="${ctx}/wshbj/industry/deleteByCenter?id=${industry.id}" onclick="return confirmx('确认要删除该行业管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>