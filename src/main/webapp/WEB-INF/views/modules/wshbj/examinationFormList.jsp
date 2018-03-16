<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检流程表模板管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationForm/">体检流程表模板列表</a></li>
		<shiro:hasPermission name="wshbj:examinationForm:edit"><li><a href="${ctx}/wshbj/examinationForm/form">体检流程表模板添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationForm" action="${ctx}/wshbj/examinationForm/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
			
			
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>路径</th>
				<th>备注</th>
				<shiro:hasPermission name="wshbj:examinationForm:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationForm">
			<tr>
				<td>
				<a href="${ctx}/wshbj/examinationForm/view?id=${examinationForm.id}">
					${examinationForm.name}
				</a></td>
				<td>

						${examinationForm.templatePath}
				</td>
				<td>
				
					${examinationForm.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationForm:edit"><td>
    				<a href="${ctx}/wshbj/examinationForm/form?id=${examinationForm.id}">修改</a>
					<a href="${ctx}/wshbj/examinationForm/delete?id=${examinationForm.id}" onclick="return confirmx('确认要删除该体检流程表模板吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>