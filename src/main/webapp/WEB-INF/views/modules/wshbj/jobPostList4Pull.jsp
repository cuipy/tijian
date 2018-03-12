<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工作岗位管理管理</title>
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

        function changeJobPost(jobj) {
            $('[name=jobPostId]').attr('checked',$(jobj).is(":checked"))
        }

        function addList(){
            var jobjs = $.find('input[name=jobPostId]:checked');
            if (jobjs.length<1){
                showTip('请选择需要拉取的岗位','error');
                return;
            }

            var jobPostIds = '';
            $.each(jobjs,function (index,jobj) {
                if(index>0){
                    jobPostIds += ',';
                }
                jobPostIds += $(jobj).val();
            });
            confirmx('确认要拉取选中的岗位吗？',function () {
                loading("正在保存……");
                $.post('${ctx}/wshbj/jobPost/saveByPull',{jobPostIds:jobPostIds},function (data) {
                    if(data.state==1){
                        location.href = '${ctx}/wshbj/jobPost/list';
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
		<li><a href="${ctx}/wshbj/jobPost/list">工作岗位管理列表</a></li>
		<shiro:hasPermission name="wshbj:jobPost:edit">
			<li><a href="${ctx}/wshbj/jobPost/form">工作岗位管理添加</a></li>
			<li  class="active"><a href="${ctx}/wshbj/jobPost/list4Pull">快速添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="jobPost" action="${ctx}/wshbj/jobPost/list4Pull" method="post" class="breadcrumb form-search">
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
			<shiro:hasPermission name="wshbj:jobPost:edit">
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
				<th width="50"><input type="checkbox"  onchange="changeJobPost(this);"/></th>
				<th>编号</th>
				<th>名称</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="jobPost">
			<tr>
				<td>
					<input type="checkbox" value="${jobPost.id}" name="jobPostId" />
				</td>
				<td><a href="${ctx}/wshbj/jobPost/form?id=${jobPost.id}">
					${jobPost.code}
				</a></td>
				<td>
					${jobPost.name}
				</td>
				<td>
					${jobPost.remarks}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>