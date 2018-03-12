<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查项目管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationItem/listByCenter">检查项目列表</a></li>
		<shiro:hasPermission name="wshbj:examinationItem:editByCenter"><li><a href="${ctx}/wshbj/examinationItem/formByCenter">检查项目添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationItem" action="${ctx}/wshbj/examinationItem/listByCenter" method="post" class="breadcrumb form-search">
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
				<th>单位</th>
				<th>价格</th>
				<th>最小值</th>
				<th>最大值</th>
				<shiro:hasPermission name="wshbj:examinationItem:editByCenter"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationItem">
			<tr>
				<td><a href="${ctx}/wshbj/examinationItem/formByCenter?id=${examinationItem.id}">
					${examinationItem.code}
				</a></td>
				<td>
					${examinationItem.name}
				</td>
				<td>
					${examinationItem.unit}
				</td>
				<td>
					${examinationItem.price}
				</td>
				<td>
					${examinationItem.rangeMin}
				</td>
				<td>
						${examinationItem.rangeMax}
				</td>
				<shiro:hasPermission name="wshbj:examinationItem:editByCenter"><td>
    				<a href="${ctx}/wshbj/examinationItem/formByCenter?id=${examinationItem.id}">修改</a>
					<a href="${ctx}/wshbj/examinationItem/deleteByCenter?id=${examinationItem.id}" onclick="return confirmx('确认要删除该检查项目吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>