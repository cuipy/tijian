<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检用户管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationUser/">体检用户列表</a></li>
		<shiro:hasPermission name="wshbj:examinationUser:edit"><li><a href="${ctx}/wshbj/examinationUser/form">体检用户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationUser" action="${ctx}/wshbj/examinationUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>联系电话：</label>
				<form:input path="phoneNumber" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>体检单位：</label>
				<form:select path="organId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${organList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>联系电话</th>
				<th>性别</th>
				<th width="260">单位</th>
				<th>备注</th>
				<shiro:hasPermission name="wshbj:examinationUser:edit"><th width="120">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationUser">
			<tr>
				<td>
					${examinationUser.name}
				</td>
				<td>
					${examinationUser.phoneNumber}
				</td>
				<td>
							${fns:getDictLabel(examinationUser.sex,'sex','')}
				</td>
				<td>
					${examinationUser.organId}
				</td>
				<td>
					${examinationUser.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationUser:edit"><td>
    				<a href="${ctx}/wshbj/examinationUser/form?id=${examinationUser.id}">修改</a>
					<a href="${ctx}/wshbj/examinationUser/delete?id=${examinationUser.id}" onclick="return confirmx('确认要删除该体检用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>