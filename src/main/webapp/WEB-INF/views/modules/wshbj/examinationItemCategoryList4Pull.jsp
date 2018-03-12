<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查项目分类管理</title>
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
            $('[name=examinationItemCategoryId]').attr('checked',$(jobj).is(":checked"))
        }

        function addList(){
            var jobjs = $.find('input[name=examinationItemCategoryId]:checked');
            if (jobjs.length<1){
                showTip('请选择需要拉取的类别','error');
                return;
            }

            var examinationItemCategoryIds = '';
            $.each(jobjs,function (index,jobj) {
                if(index>0){
                    examinationItemCategoryIds += ',';
                }
                examinationItemCategoryIds += $(jobj).val();
            });
            confirmx('确认要拉取选中的类别吗？',function () {
                loading("正在保存……");
                $.post('${ctx}/wshbj/examinationItemCategory/saveByPull',{examinationItemCategoryIds:examinationItemCategoryIds},function (data) {
                    if(data.state==1){
                        location.href = '${ctx}/wshbj/examinationItemCategory/list';
                    }else{
                        showTip(data.msg,'error');
                    }
                },'json');
            });
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/examinationItemCategory/list">检查项目分类列表</a></li>
		<shiro:hasPermission name="wshbj:examinationItemCategory:edit">
			<li><a href="${ctx}/wshbj/examinationItemCategory/form">检查项目分类添加</a></li>
			<li class="active"><a href="${ctx}/wshbj/examinationItemCategory/list4Pull">快速添加</a></li>
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
			<shiro:hasPermission name="wshbj:examinationItemCategory:edit">
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
				<th width="50"><input type="checkbox" value="${examinationItemCategory.id}" onchange="changeCategory(this);"/></th>
				<th>编号</th>
				<th>名称</th>
				<th>更新时间</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationItemCategory">
			<tr>
				<td>
					<input type="checkbox" value="${examinationItemCategory.id}" name="examinationItemCategoryId" />
				</td>
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
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>