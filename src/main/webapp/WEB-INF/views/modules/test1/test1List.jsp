<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>测试1管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出测试1数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/test1/test1/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true},
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
			});
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
	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/test1/test1/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
			<a href="${ctx}/test1/test1/import/template">下载模板</a>
		</form>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/test1/test1/">测试1列表</a></li>
		<shiro:hasPermission name="test1:test1:edit"><li><a href="${ctx}/test1/test1/form">测试1添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="test1" action="${ctx}/test1/test1/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<li><label>作者名：</label>
				<form:input path="auth.name" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>作者工号：</label>
				<form:input path="auth.no" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>发布单位：</label>
				<form:input path="danwei" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
			<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
			<input id="btnImport" class="btn btn-primary" type="button" value="导入"/>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>头像</th>
				<th>标题</th>
				<th>作者名</th>
				<th>作者工号</th>
				<th>发布单位</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="test1:test1:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="test1">
			<tr>
				<td>
				<a href="${ctx}/test1/test1/view?id=${test1.id}">
					<img src="${test1.headImg}" style="width:120px">
				</a></td>
				<td>
				
					${test1.title}
				</td>
				<td>
				
					${test1.auth.name}
				</td>
				<td>
				
					${test1.auth.no}
				</td>
				<td>
				
					${test1.danwei}
				</td>
				<td>
				
					<fmt:formatDate value="${test1.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
				
					${test1.remarks}
				</td>
				<shiro:hasPermission name="test1:test1:edit"><td>
    				<a href="${ctx}/test1/test1/form?id=${test1.id}">修改</a>
					<a href="${ctx}/test1/test1/delete?id=${test1.id}" onclick="return confirmx('确认要删除该测试1吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>