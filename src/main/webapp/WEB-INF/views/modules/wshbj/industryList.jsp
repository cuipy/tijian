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
		<li class="active"><a href="${ctx}/wshbj/industry/list">行业管理列表</a></li>
		<shiro:hasPermission name="wshbj:industry:edit">
			<li><a href="${ctx}/wshbj/industry/form">行业管理添加</a></li>
			<!--li><a href="${ctx}/wshbj/industry/list4Pull">快速添加</a></li-->
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="industry" action="${ctx}/wshbj/industry/list" method="post" class="breadcrumb form-search">
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
				<shiro:hasPermission name="wshbj:industry:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="industry">
			<tr>
				<td><a href="${ctx}/wshbj/industry/form?id=${industry.id}">
					${industry.code}
				</a></td>
				<td>
					${industry.name}
				</td>
				<td>
					${industry.remarks}
				</td>
				<shiro:hasPermission name="wshbj:industry:edit"><td>
    				<a href="${ctx}/wshbj/industry/form?id=${industry.id}">修改</a>
					<a href="${ctx}/wshbj/industry/delete?id=${industry.id}" onclick="return confirmx('确认要删除该行业管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>

	<div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 行业管理可以增删改行业列表，例如：餐饮、医疗等<br>
      2. 在体检人注册的时候，必须选择体检人所属行业<br>
      3. 不同的行业可能健康证模板不同，通过设置不同行业的健康证打印模板<br>

    </div>

</body>
</html>