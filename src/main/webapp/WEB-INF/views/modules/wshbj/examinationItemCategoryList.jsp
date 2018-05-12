<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查小类管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationItemCategory/list">检查小类列表</a></li>
		<shiro:hasPermission name="wshbj:examinationItemCategory:edit">
			<li><a href="${ctx}/wshbj/examinationItemCategory/form">检查小类添加</a></li>
			<!-- li><a href="${ctx}/wshbj/examinationItemCategory/list4Pull">快速添加</a></li -->
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationItemCategory" action="${ctx}/wshbj/examinationItemCategory/list" method="post" class="breadcrumb form-search">
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
				<th>更新时间</th>
				<th>备注</th>
				<th>顺序值</th>
				<shiro:hasPermission name="wshbj:examinationItemCategory:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationItemCategory">
			<tr>
				<td><a href="${ctx}/wshbj/examinationItemCategory/form?id=${examinationItemCategory.id}">
					${examinationItemCategory.code}
				</a></td>
				<td>
					${examinationItemCategory.name}
				</td>
				<td>
					<fmt:formatDate value="${examinationItemCategory.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${examinationItemCategory.remarks}
				</td>  <td> ${examinationItemCategory.orderNumb}</td>
				<shiro:hasPermission name="wshbj:examinationItemCategory:edit"><td>
    				<a href="${ctx}/wshbj/examinationItemCategory/form?id=${examinationItemCategory.id}">修改</a>
					<a href="${ctx}/wshbj/examinationItemCategory/delete?id=${examinationItemCategory.id}" onclick="return confirmx('确认要删除该检查小类吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>

    <div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 检查小类属于项目类型下的分类，非必填项目<br><br>

      <strong>作用：</strong> <br>
      1. 检查小类用于<span class="help-inline">检查小类</span>中<br>
      2. 该属性主要检查小类中做分类筛选<br>
      3. 本属性对应“医院卫生保健管理系统 2.5”中<span class="help-inline">检查项目 - 项目类型 - 分类</span>

    </div>

</body>
</html>