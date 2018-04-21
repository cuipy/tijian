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
		<shiro:hasPermission name="wshbj:examinationRecordItem:edit"><li><a href="${ctx}/wshbj/examinationSamples/form">体检样本添加</a></li></shiro:hasPermission>
		<li class="active"><a href="${ctx}/wshbj/examinationRecordItem/list_need_sample">体检样本列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationRecordItem" action="${ctx}/wshbj/examinationRecordItem/list_need_sample" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>体检编号：</label>
				<form:input path="examinationCode" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>样本编号：</label>
				<form:input path="sampleCode" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>体检用户：</label>
				<form:input path="userName" htmlEscape="false" maxlength="64" class="input-medium"/>
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
				<th width="150">样本编号</th>
				<th width="200">体检人</th>
				<th width="80">项目</th>
				<th width="80">状态</th>
				<th width="80">初/复</th>
				<th>备注</th>
				<shiro:hasPermission name="wshbj:examinationRecordItem:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="item">
			<tr>
				<td>
				<a href="${ctx}/wshbj/examinationSamples/view?id=${examinationSamples.id}">
					${item.examinationCode}
				</a></td>
				<td> ${item.sampleCode} </td>
				<td> <c:if test="${not empty examinationSample.recordOrganName }">${item.recordOrganName} - </c:if> ${item.recordUserName}  </td>
				<td>${wshbjfns:getEntityName('ExaminationItem',item.itemId,'')} </td>
				<td>${item.strStatus}</td>
				<td>${item.strExaminationFlag}</td>
				<td> ${item.remarks} </td>
				<shiro:hasPermission name="wshbj:examinationRecordItem:edit"><td>
    				<c:if test="${item.status ==0 }">
    				<a class="label label-important" href="${ctx}/wshbj/examinationRecordItem/form?id=${item.id}">采集</a> </c:if>
    				<c:if test="${item.status ==1  }">
                    <a class="label" href="${ctx}/wshbj/examinationRecordItem/cancel?id=${item.id}">撤销</a> </c:if>

				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>