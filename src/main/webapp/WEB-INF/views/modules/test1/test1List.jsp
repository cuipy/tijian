<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>测试1管理</title>
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
		<li class="active"><a href="${ctx}/test1/test1/">测试1列表</a></li>
		<shiro:hasPermission name="test1:test1:edit"><li><a href="${ctx}/test1/test1/form">测试1添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="test1" action="${ctx}/test1/test1/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<li><label>作者：</label>
				<form:input path="authName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建者：</label>
				<form:input path="createBy.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>标题</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="test1:test1:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="test1">
			<tr>
				<td><a href="${ctx}/test1/test1/form?id=${test1.id}">
					${test1.title}
				</a></td>
				<td>
					<fmt:formatDate value="${test1.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${test1.remarks}
				</td>
				<shiro:hasPermission name="test1:test1:edit"><td>
    				<a href="${ctx}/test1/test1/form?id=${test1.id}">修改</a>
					<a href="${ctx}/test1/test1/delete?id=${test1.id}" onclick="return confirmx('确认要删除该测试1吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>