<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>检查项目管理</title>
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

        function changeItem(jobj) {
            $('[name=examinationItemId]').attr('checked',$(jobj).is(":checked"))
        }

        function addList(){
            var jobjs = $.find('input[name=examinationItemId]:checked');
            if (jobjs.length<1){
                showTip('请选择需要拉取的检查项目','error');
                return;
            }

            var examinationItemIds = '';
            $.each(jobjs,function (index,jobj) {
                if(index>0){
                    examinationItemIds += ',';
                }
                examinationItemIds += $(jobj).val();
            });
            confirmx('确认要拉取选中的检查项目吗？',function () {
                loading("正在保存……");
                $.post('${ctx}/wshbj/examinationItem/saveByPull',{examinationItemIds:examinationItemIds},function (data) {
                    if(data.state==1){
                        location.href = '${ctx}/wshbj/examinationItem/list';
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
		<li><a href="${ctx}/wshbj/examinationItem/list">检查项目列表</a></li>
		<shiro:hasPermission name="wshbj:examinationItem:edit">
			<li><a href="${ctx}/wshbj/examinationItem/form">检查项目添加</a></li>
			<li class="active"><a href="${ctx}/wshbj/examinationItem/list4Pull">快速添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationItem" action="${ctx}/wshbj/examinationItem/list4Pull" method="post" class="breadcrumb form-search">
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
			<shiro:hasPermission name="wshbj:examinationItem:edit">
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
				<th width="50"><input type="checkbox"  onchange="changeItem(this);"/></th>
				<th>编号</th>
				<th>名称</th>
				<th>备注</th>
				<th>单位</th>
				<th>价格</th>
				<th>参考范围最大值</th>
				<th>参考范围最小值</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationItem">
			<tr>
				<td>
					<input type="checkbox" value="${examinationItem.id}" name="examinationItemId" />
				</td>
				<td>
						${examinationItem.code}
				</td>
				<td>
					${examinationItem.name}
				</td>
				<td>
					${examinationItem.remarks}
				</td>
				<td>
					${examinationItem.unit}
				</td>
				<td>
					${examinationItem.price}
				</td>
				<td>
					${examinationItem.rangeMax}
				</td>
				<td>
					${examinationItem.rangeMin}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>