<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查部门管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationDept/listByCenter">检查部门列表</a></li>
		<shiro:hasPermission name="wshbj:examinationDept:editByCenter"><li><a href="${ctx}/wshbj/examinationDept/formByCenter">检查部门添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationDept" action="${ctx}/wshbj/examinationDept/listByCenter" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
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
				<th>名称</th>
				<th>更新时间</th>
				<th>备注</th>
				<shiro:hasPermission name="wshbj:examinationDept:editByCenter"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationDept">
			<tr>
				<td><a href="${ctx}/wshbj/examinationDept/formByCenter?id=${examinationDept.id}">
					${examinationDept.name}
				</a></td>
				<td>
					<fmt:formatDate value="${examinationDept.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${examinationDept.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationDept:editByCenter"><td>
    				<a href="${ctx}/wshbj/examinationDept/formByCenter?id=${examinationDept.id}">修改</a>
					<a href="${ctx}/wshbj/examinationDept/deleteByCenter?id=${examinationDept.id}" onclick="return confirmx('确认要删除该检查部门吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>