<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>制卡记录管理</title>
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
		<li class="active"><a href="${ctx}/wshbj/certRecord/">制卡记录列表</a></li>
		<shiro:hasPermission name="wshbj:certRecord:edit"><li><a href="${ctx}/wshbj/certRecord/form">制卡记录添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="certRecord" action="${ctx}/wshbj/certRecord/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>卡号：</label>
				<form:input path="code" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>体检编号：</label>
				<form:input path="examinationCode" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idNumber" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>姓名：</label>
				<form:input path="userName" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${certRecord.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>

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
				<th>卡号</th>
				<th>体检编号</th>
				<th>身份证号</th>
				<th>姓名</th>
				<th>创建时间</th>
				<th>备注</th>
				<shiro:hasPermission name="wshbj:certRecord:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="certRecord">
			<tr>
				<td>
				<a href="${ctx}/wshbj/certRecord/view?id=${certRecord.id}">
					${certRecord.code}
				</a></td>
				<td>
				
					${certRecord.examinationCode}
				</td>
				<td>
				
					${certRecord.idNumber}
				</td>
				<td>
				
					${certRecord.userName}
				</td>
				<td>
				
					<fmt:formatDate value="${certRecord.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
				
					${certRecord.remarks}
				</td>
				<shiro:hasPermission name="wshbj:certRecord:edit"><td>
    				<a href="${ctx}/wshbj/certRecord/form?id=${certRecord.id}">修改</a>
					<a href="${ctx}/wshbj/certRecord/delete?id=${certRecord.id}" onclick="return confirmx('确认要删除该制卡记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>