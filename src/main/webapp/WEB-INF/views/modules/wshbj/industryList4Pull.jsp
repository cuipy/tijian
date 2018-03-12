<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行业管理管理</title>
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

        function changeIndustry(jobj) {
            $('[name=specimenId]').attr('checked',$(jobj).is(":checked"))
        }

        function addList(){
            var jobjs = $.find('input[name=industryId]:checked');
            if (jobjs.length<1){
                showTip('请选择需要拉取的行业','error');
                return;
            }

            var industryIds = '';
            $.each(jobjs,function (index,jobj) {
                if(index>0){
                    industryIds += ',';
                }
                industryIds += $(jobj).val();
            });
            confirmx('确认要拉取选中的行业吗？',function () {
                loading("正在保存……");
                $.post('${ctx}/wshbj/industry/saveByPull',{industryIds:industryIds},function (data) {
                    if(data.state==1){
                        location.href = '${ctx}/wshbj/industry/list';
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
		<li><a href="${ctx}/wshbj/industry/list">行业管理列表</a></li>
		<shiro:hasPermission name="wshbj:industry:edit">
			<li><a href="${ctx}/wshbj/industry/form">行业管理添加</a></li>
			<li class="active"><a href="${ctx}/wshbj/industry/list4Pull">快速添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="industry" action="${ctx}/wshbj/industry/" method="post" class="breadcrumb form-search">
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
            <shiro:hasPermission name="wshbj:industry:edit">
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
				<th width="50"><input type="checkbox"  onchange="changeIndustry(this);"/></th>
				<th>编号</th>
				<th>名称</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="industry">
			<tr>
				<td>
					<input type="checkbox" value="${industry.id}" name="industryId" />
				</td>
				<td><a href="${ctx}/wshbj/industry/form?id=${industry.id}">
					${industry.code}
				</a></td>
				<td>
					${industry.name}
				</td>
				<td>
					${industry.remarks}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>