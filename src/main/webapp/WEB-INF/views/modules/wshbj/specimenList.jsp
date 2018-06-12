<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查标本类型管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/specimen/list">检查标本类型列表</a></li>
		<shiro:hasPermission name="wshbj:specimen:edit">
			<li><a href="${ctx}/wshbj/specimen/form">检查标本类型添加</a></li>
			<!--li><a href="${ctx}/wshbj/specimen/list4Pull">快速添加</a></li-->
		</shiro:hasPermission>
	</ul>

	<div class="box1">
	<form:form id="searchForm" modelAttribute="specimen" action="${ctx}/wshbj/specimen/list" method="post" class="breadcrumb form-search">
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
				<th>编号</th>
				<th>名称</th>
				<th>采样部门</th>
				<th>更新时间</th>
				<th>备注</th>
				<th>顺序值</th>
				<shiro:hasPermission name="wshbj:specimen:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="specimen">
			<tr>
				<td><a href="${ctx}/wshbj/specimen/form?id=${specimen.id}">
					${specimen.code}
				</a></td>
				<td>
					${specimen.name}
				</td>
				<td>
                    ${specimen.grabDeptName}
                </td>
				<td>
					<fmt:formatDate value="${specimen.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${specimen.remarks}
				</td>  <td> ${specimen.orderNumb}</td>
				<shiro:hasPermission name="wshbj:specimen:edit"><td>
    				<a href="${ctx}/wshbj/specimen/form?id=${specimen.id}">修改</a>
					<a href="${ctx}/wshbj/specimen/delete?id=${specimen.id}" onclick="return confirmx('确认要删除该检查标本类型吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>

	<div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 标本类型默认包括：<span class="help-inline">血样和便样</span> 两项<br>
      2. 操作人可以增加标本类型<br>

    </div>
    </div>
</body>
</html>