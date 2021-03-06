<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>样本编号包管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/sampleCodesPack/">样本编号包列表</a></li>
		<shiro:hasPermission name="wshbj:sampleCodes:edit"><li><a href="${ctx}/wshbj/sampleCodesPack/form">样本编号包添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sampleCodesPack" action="${ctx}/wshbj/sampleCodesPack/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
			
			
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>创建时间</th>
				<th>样本类型</th>
				<th>编号数量</th>
				<th>备注信息</th>
				<shiro:hasPermission name="wshbj:sampleCodes:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sampleCodesPack">
			<tr>
				<td>
				<a href="${ctx}/wshbj/sampleCodesPack/view?id=${sampleCodesPack.id}">
					<fmt:formatDate value="${sampleCodesPack.createDate}" pattern="yyyy-MM-dd HH:mm"/>
				</a></td>
				<td>

                    ${sampleCodesPack.specimenName}
                </td>
                <td>
                    ${sampleCodesPack.codeCount}
                </td>
				<td>
				
					${sampleCodesPack.remarks}
				</td>
				<shiro:hasPermission name="wshbj:sampleCodes:edit"><td>
					<a href="${ctx}/wshbj/sampleCodesPack/export_excel?id=${sampleCodesPack.id}" onclick="return confirmx('确认要导出该样本编号包吗？', this.href)">导出Excel</a>
					<a href="${ctx}/wshbj/sampleCodesPack/delete?id=${sampleCodesPack.id}" onclick="return confirmx('确认要删除该样本编号包吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>