<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="wshbjfns" uri="/WEB-INF/tlds/wshbjfns.tld" %>
<html>
<head>
	<title>体检样本管理</title>
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
		<shiro:hasPermission name="wshbj:examinationSamples:edit"><li><a href="${ctx}/wshbj/examinationSamples/form">体检样本添加</a></li></shiro:hasPermission>
		<li class="active"><a href="${ctx}/wshbj/examinationSamples/">体检样本列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationSamples" action="${ctx}/wshbj/examinationSamples/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>体检编号：</label>
				<form:input path="examinationCode" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>编号：</label>
				<form:input path="code" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>体检用户：</label>
				<form:input path="userId" htmlEscape="false" maxlength="64" class="input-medium"/>
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
				<th width="150">体检编号</th>
				<th width="150">编号</th>
				<th width="300">项目</th>
				<th width="150">更新时间</th>
				<th>备注</th>
				<shiro:hasPermission name="wshbj:examinationSamples:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationSamples">
			<tr>
				<td>
				<a href="${ctx}/wshbj/examinationSamples/view?id=${examinationSamples.id}">
					${examinationSamples.examinationCode}
				</a></td>
				<td>
				
					${examinationSamples.code}
				</td>
				<td>

							${wshbjfns:getEntityName('ExaminationItem',examinationSamples.itemId,'')}
				</td>
				<td>
				
					<fmt:formatDate value="${examinationSamples.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
				
					${examinationSamples.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationSamples:edit"><td>
    				<a href="${ctx}/wshbj/examinationSamples/form?id=${examinationSamples.id}">修改</a>
					<a href="${ctx}/wshbj/examinationSamples/delete?id=${examinationSamples.id}" onclick="return confirmx('确认要删除该体检样本吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>