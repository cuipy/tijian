<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检结果管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationResult/">体检结果列表</a></li>
		<shiro:hasPermission name="wshbj:examinationResult:edit"><li><a href="${ctx}/wshbj/examinationResult/form">体检结果添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationResult" action="${ctx}/wshbj/examinationResult/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>体检编号：</label>
				<form:input path="examinationCode" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>样本编号：</label>
				<form:input path="sampleCode" htmlEscape="false" maxlength="50" class="input-medium"/>
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
				<th>体检编号</th>
				<th>样本编号</th>
				<th>项目</th>
				<th>体检结果</th>
				<th>创建时间</th>
				<th>备注</th>
				<shiro:hasPermission name="wshbj:examinationResult:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationResult">
			<tr>
				<td>
				<a href="${ctx}/wshbj/examinationResult/view?id=${examinationResult.id}">
					${examinationResult.examinationCode}
				</a></td>
				<td>
				
					${examinationResult.sampleCode}
				</td>
				<td>
				
					${examinationResult.itemName}
				</td>
				<td>
				
					${examinationResult.resultDictId}
				</td>
				<td>
				
					<fmt:formatDate value="${examinationResult.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
				
					${examinationResult.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationResult:edit"><td>
    				<a href="${ctx}/wshbj/examinationResult/form?id=${examinationResult.id}">修改</a>
					<a href="${ctx}/wshbj/examinationResult/delete?id=${examinationResult.id}" onclick="return confirmx('确认要删除该体检结果吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>