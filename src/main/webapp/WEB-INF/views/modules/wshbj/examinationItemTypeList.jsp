<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查项目类型管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationItemType/list">检查项目类型列表</a></li>
		<shiro:hasPermission name="wshbj:examinationItemType:edit">
			<li><a href="${ctx}/wshbj/examinationItemType/form">检查项目类型添加</a></li>
			<!--li><a href="${ctx}/wshbj/examinationItemType/list4Pull">快速添加</a></li -->
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationItemType" action="${ctx}/wshbj/examinationItemType/list" method="post" class="breadcrumb form-search">
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
				<shiro:hasPermission name="wshbj:examinationItemType:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationItemType">
			<tr>
				<td><a href="${ctx}/wshbj/examinationItemType/form?id=${examinationItemType.id}">
					${examinationItemType.code}
				</a></td>
				<td>
					${examinationItemType.name}
				</td>
				<td>
					<fmt:formatDate value="${examinationItemType.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${examinationItemType.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationItemType:edit"><td>
    				<a href="${ctx}/wshbj/examinationItemType/form?id=${examinationItemType.id}">修改</a>
					<a href="${ctx}/wshbj/examinationItemType/delete?id=${examinationItemType.id}" onclick="return confirmx('确认要删除该检查项目类型吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>

    <div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 项目类型可以理解为检查项目的<span class="help-inline">小类</span><br>
      2. 项目类型表示检查的大类，一般可以对应到科室或中心<br>
      3. 默认，项目类型包括<span class="help-inline"> 采血、采便、内科、眼科、放射科 </span>。<br><br>

      <strong>作用：</strong> <br>
      1. 该属性上承<span class="help-inline">检查类别</span>，下接<span class="help-inline">检查项目</span>。<br>
      2. 可以理解为检查细项的大分类。<br>
      3. 对应“医院卫生保健管理系统 2.5”中<span class="help-inline">检查项目 - 项目类型 </span>
    </div>

</body>
</html>