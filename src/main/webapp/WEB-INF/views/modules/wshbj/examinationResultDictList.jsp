<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="wshbjfns" uri="/WEB-INF/tlds/wshbjfns.tld" %>
<html>
<head>
	<title>体检结果字典管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationResultDict/">体检结果字典列表</a></li>
		<shiro:hasPermission name="wshbj:examinationResultDict:edit"><li><a href="${ctx}/wshbj/examinationResultDict/form">体检结果字典添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationResultDict" action="${ctx}/wshbj/examinationResultDict/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>体检项目：</label>
				<form:select path="itemId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${examinationItemList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
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
				<th>名称</th>
				<th>体检项目</th>
				<th width="80">是否合格</th>
				<th width="80">是否默认</th>
				<th>具体描述</th>
				<shiro:hasPermission name="wshbj:examinationResultDict:edit"><th width="120">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationResultDict">
			<tr>
				<td><a href="${ctx}/wshbj/examinationResultDict/form?id=${examinationResultDict.id}">
					${examinationResultDict.name}
				</a></td>
				<td>
						${wshbjfns:getEntityName('ExaminationItem',examinationResultDict.itemId,'')}
				</td>
				<td>
						${fns:getDictLabel(examinationResultDict.flag,'yes_no','')}
				</td>
				<td>
						${fns:getDictLabel(examinationResultDict.defaultFlag,'yes_no','')}
				</td>
				<td>
					${examinationResultDict.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationResultDict:edit"><td>
    				<a href="${ctx}/wshbj/examinationResultDict/form?id=${examinationResultDict.id}">修改</a>
					<a href="${ctx}/wshbj/examinationResultDict/delete?id=${examinationResultDict.id}" onclick="return confirmx('确认要删除该体检结果字典吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>

	<div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 项目结果准确的解释为：<span class="help-inline">检查项目的结果选项</span><br>
      2. 项目结果是针对检查结果定义的属性，可以理解为结果选项字典<br>
      3. 项目结果只有两种选项：合格和不合格<br

    </div>

</body>
</html>