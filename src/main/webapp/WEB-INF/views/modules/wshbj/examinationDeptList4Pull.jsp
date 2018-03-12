<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查部门管理</title>
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


        function changeDept(jobj) {
            $('[name=examinationDeptId]').attr('checked',$(jobj).is(":checked"))
        }

        function addList(){
            var jobjs = $.find('input[name=examinationDeptId]:checked');
            if (jobjs.length<1){
                showTip('请选择需要拉取的类别','error');
                return;
            }

            var examinationDeptIds = '';
            $.each(jobjs,function (index,jobj) {
                if(index>0){
                    examinationDeptIds += ',';
                }
                examinationDeptIds += $(jobj).val();
            });
            confirmx('确认要拉取选中的部门吗？',function () {
                loading("正在保存……");
                $.post('${ctx}/wshbj/examinationDept/saveByPull',{examinationDeptIds:examinationDeptIds},function (data) {
                    if(data.state==1){
                        location.href = '${ctx}/wshbj/examinationDept/list';
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
		<li><a href="${ctx}/wshbj/examinationDept/list">检查部门列表</a></li>
		<shiro:hasPermission name="wshbj:examinationDept:edit">
			<li><a href="${ctx}/wshbj/examinationDept/form">检查部门添加</a></li>
			<li class="active"><a href="${ctx}/wshbj/examinationDept/list4Pull">快速添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationDept" action="${ctx}/wshbj/examinationDept/list4Pull" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<shiro:hasPermission name="wshbj:examinationDept:edit">
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
				<th width="50"><input type="checkbox"  onchange="changeDept(this);"/></th>
				<th>名称</th>
				<th>更新时间</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationDept">
			<tr>
				<td>
					<input type="checkbox" value="${examinationDept.id}" name="examinationDeptId" />
				</td>
				<td><a href="${ctx}/wshbj/examinationDept/form?id=${examinationDept.id}">
					${examinationDept.name}
				</a></td>
				<td>
					<fmt:formatDate value="${examinationDept.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${examinationDept.remarks}
				</td>

			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>