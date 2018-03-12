<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检结果字典管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationResultDict/">体检结果字典列表</a></li>
		<shiro:hasPermission name="wshbj:examinationResultDict:edit"><li><a href="${ctx}/wshbj/examinationResultDict/form">体检结果字典添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationResultDict" action="${ctx}/wshbj/examinationResultDict/" method="post" class="breadcrumb form-search">
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
				<th>体检项目</th>
				<th>具体描述</th>
				<shiro:hasPermission name="wshbj:examinationResultDict:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationResultDict">
			<tr>
				<td><a href="${ctx}/wshbj/examinationResultDict/form?id=${examinationResultDict.id}">
					${examinationResultDict.name}
				</a></td>
				<td>
						${examinationResultDict.itemId}
				</td>
				<td>
					${examinationResultDict.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationResultDict:edit"><td>
    				<a href="${ctx}/wshbj/examinationResultDict/form?id=${examinationResultDict.id}">修改</a>
					<a href="${ctx}/wshbj/examinationResultDict/delete?id=${examinationResultDict.id}" onclick="return confirmx('确认要删除该体检结果字典吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>