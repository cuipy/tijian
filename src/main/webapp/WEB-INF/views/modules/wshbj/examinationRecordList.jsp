<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检记录管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/">体检记录列表</a></li>
		<shiro:hasPermission name="wshbj:examinationRecord:edit"><li><a href="${ctx}/wshbj/examinationRecord/form">体检记录添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>体检单位：</label>
				<form:select path="organId"  name="user.organId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${organList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>体检用户：</label>
				<wshbj:euserTreeSelect id="user" name="user.id" value="${examinationRecord.user.id}" labelName="user.name" labelValue="${examinationRecord.user.name}"
					title="用户" url="/wshbj/organ/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>编号：</label>
				<form:input path="code" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>联系电话：</label>
				<form:input path="phoneNumber" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>体检套餐：</label>
				<form:select path="packageId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${packageList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
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
				<th>编号</th>
				<th>姓名</th>
				<th>联系电话</th>
				<th>性别</th>
				<th>单位</th>
				<th>更新时间</th>
				<th>体检套餐</th>
				<th>套餐价格</th>
				<shiro:hasPermission name="wshbj:examinationRecord:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationRecord">
			<tr>
				<td><a href="${ctx}/wshbj/examinationRecord/form?id=${examinationRecord.id}">
					${examinationRecord.code}
				</a></td>
				<td>
					${examinationRecord.name}
				</td>
				<td>
					${examinationRecord.phoneNumber}
				</td>
				<td>
					${examinationRecord.sex}
				</td>
				<td>
					${examinationRecord.organId}
				</td>
				<td>
					<fmt:formatDate value="${examinationRecord.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${examinationRecord.packageId}
				</td>
				<td>
					${examinationRecord.packagePrice}
				</td>
				<shiro:hasPermission name="wshbj:examinationRecord:edit"><td>
    				<a href="${ctx}/wshbj/examinationRecord/form?id=${examinationRecord.id}">修改</a>
					<a href="${ctx}/wshbj/examinationRecord/delete?id=${examinationRecord.id}" onclick="return confirmx('确认要删除该体检记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>