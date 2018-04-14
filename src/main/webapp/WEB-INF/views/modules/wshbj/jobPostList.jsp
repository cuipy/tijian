<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工作岗位管理管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/jobPost/list">工作岗位管理列表</a></li>
		<shiro:hasPermission name="wshbj:jobPost:edit">
			<li><a href="${ctx}/wshbj/jobPost/form">工作岗位管理添加</a></li>
			<!--li><a href="${ctx}/wshbj/jobPost/list4Pull">快速添加</a></li-->
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="jobPost" action="${ctx}/wshbj/jobPost/list" method="post" class="breadcrumb form-search">
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
				<shiro:hasPermission name="wshbj:jobPost:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="jobPost">
			<tr>
				<td><a href="${ctx}/wshbj/jobPost/form?id=${jobPost.id}">
					${jobPost.code}
				</a></td>
				<td>
					${jobPost.name}
				</td>
				<td>
					${jobPost.remarks}
				</td>
				<shiro:hasPermission name="wshbj:jobPost:edit"><td>
    				<a href="${ctx}/wshbj/jobPost/form?id=${jobPost.id}">修改</a>
					<a href="${ctx}/wshbj/jobPost/delete?id=${jobPost.id}" onclick="return confirmx('确认要删除该工作岗位管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>

	<div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 岗位管理属于岗位的字典列表<br>
      2. 岗位用于体检人，每个体检人必定属于某种岗位<br>
      3. 不同岗位体检人的检查项目和健康证可以选择不同的设置

    </div>

</body>
</html>