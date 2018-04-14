<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查类别管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationCategory/">检查类别列表</a></li>
		<shiro:hasPermission name="wshbj:examinationCategory:edit">
			<li><a href="${ctx}/wshbj/examinationCategory/form">检查类别添加</a></li>
			<!-- li><a href="${ctx}/wshbj/examinationCategory/list4Pull">快速添加</a></li -->
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationCategory" action="${ctx}/wshbj/examinationCategory/" method="post" class="breadcrumb form-search">
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
				<shiro:hasPermission name="wshbj:examinationCategory:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationCategory">
			<tr>
				<td><a href="${ctx}/wshbj/examinationCategory/form?id=${examinationCategory.id}">
					${examinationCategory.code}
				</a></td>
				<td>
					${examinationCategory.name}
				</td>
				<td>
					<fmt:formatDate value="${examinationCategory.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${examinationCategory.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationCategory:edit"><td>
    				<a href="${ctx}/wshbj/examinationCategory/form?id=${examinationCategory.id}">修改</a>
					<a href="${ctx}/wshbj/examinationCategory/delete?id=${examinationCategory.id}" onclick="return confirmx('确认要删除该检查类别吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>

	<div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 检查类别可以理解为检查项目的<span class="help-inline">大类</span><br>
      2. 检查类别表示何种类型的检查，比如：健康证检查<br>
      3. 默认，检查类别只有一个<span class="help-inline">健康证检查</span>。<br><br>

      <strong>作用：</strong> <br>
      1. 检查类别用于项目分类和项目类型中，设置是用于何种目的而检查的。<br>
      2. 该功能对应“医院卫生保健管理系统 2.5”中<span class="help-inline">检查项目 - 项目类型 - 检查类别</span>
    </div>

</body>
</html>