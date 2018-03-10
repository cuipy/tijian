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

        function changeCategory(jobj) {
			$('[name=examinationCategoryId]').attr('checked',$(jobj).is(":checked"))
        }

        function addList(){
		    var jobjs = $.find('input[name=examinationCategoryId]:checked');
		    if (jobjs.length<1){
                showTip('请选择需要拉取的类别','warning');
		        return;
			}

		    if(confirmx('确认要拉取选中的类别吗？')){

			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li ><a href="${ctx}/wshbj/examinationCategory/">检查类别列表</a></li>
		<shiro:hasPermission name="wshbj:examinationCategory:edit">
			<li><a href="${ctx}/wshbj/examinationCategory/form">检查类别添加</a></li>
			<li class="active"><a href="${ctx}/wshbj/examinationCategory/list4Add">快速添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationCategory" action="${ctx}/wshbj/examinationCategory/list4Add" method="post" class="breadcrumb form-search">
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
			<shiro:hasPermission name="wshbj:examinationCategory:edit">
				<li class="btns">
					<input class="btn btn-primary" type="button" value="保 存" onclick="addList();"/>
				</li>
			</shiro:hasPermission>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th width="50"><input type="checkbox" value="${examinationCategory.id}" onchange="changeCategory(this);"/></th>
				<th>编号</th>
				<th>名称</th>
				<th>更新时间</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationCategory">
			<tr>
				<td>
					<input type="checkbox" value="${examinationCategory.id}" name="examinationCategoryId" />
				</td>
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
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>