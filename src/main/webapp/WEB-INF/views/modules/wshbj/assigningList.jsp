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
		<li><a href="${ctx}/wshbj/examinationItem/assigning">项目授权</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationItem/assigningList">授权列表</a></li>
	</ul>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th width="200">角色</th>
				<th>项目</th>
				<shiro:hasPermission name="wshbj:examinationItem:assigning"><th width="80">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${roleItemList}" var="roleItem">
			<tr>
				<td>
					${roleItem.roleName}
				</td>
				<td>
					<c:forEach items="${roleItem.itemList}" var="item">
						${item.name}&nbsp;&nbsp;
					</c:forEach>
				</td>
				<shiro:hasPermission name="wshbj:examinationItem:assigning"><td>
    				<a href="${ctx}/wshbj/examinationItem/assigning?roleId=${roleItem.roleId}">授权</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>