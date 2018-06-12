<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>制证数管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/zhizhengAddRecord/list">制证数管理列表</a></li>
		<shiro:hasPermission name="wshbj:zhizhengAddRecord:edit">
			<li><a href="${ctx}/wshbj/zhizhengAddRecord/add">增加制证数</a></li>
		</shiro:hasPermission>
	</ul>

	<div class="box1">
	<form:form id="searchForm" modelAttribute="zhizhengAddRecord" action="${ctx}/wshbj/zhizhengAddRecord/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="addCode" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>编号</th>

				<th>增加数量</th>
				<th>最新数量</th>

				<th>更新时间</th>
				<th>类型</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="vo" varStatus="idx">
			<tr>
				<td> ${idx.count} </td>
				<td>${vo.addCode}</td><td>${vo.addCount}</td> <td> ${vo.resultCount} </td>
				<td> ${vo.updateTime} </td>  <td> ${vo.updateType} </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>

    </div>

</body>
</html>