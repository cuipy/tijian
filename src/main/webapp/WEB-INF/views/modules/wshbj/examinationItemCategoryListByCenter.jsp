<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查小类管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationItemCategory/listByCenter">检查小类列表</a></li>
		<shiro:hasPermission name="wshbj:examinationItemCategory:editByCenter"><li><a href="${ctx}/wshbj/examinationItemCategory/formByCenter">检查小类添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationItemCategory" action="${ctx}/wshbj/examinationItemCategory/listByCenter" method="post" class="breadcrumb form-search">
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
				<th>更新时间</th>
				<th>备注</th>
				<shiro:hasPermission name="wshbj:examinationItemCategory:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationItemCategory">
			<tr>
				<td><a href="${ctx}/wshbj/examinationItemCategory/form?id=${examinationItemCategory.id}">
					${examinationItemCategory.code}
				</a></td>
				<td>
					${examinationItemCategory.name}
				</td>
				<td>
					<fmt:formatDate value="${examinationItemCategory.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${examinationItemCategory.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationItemCategory:editByCenter"><td>
    				<a href="${ctx}/wshbj/examinationItemCategory/formByCenter?id=${examinationItemCategory.id}">修改</a>
					<a href="${ctx}/wshbj/examinationItemCategory/deleteByCenter?id=${examinationItemCategory.id}" onclick="return confirmx('确认要删除该检查小类吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>