<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="wshbjfns" uri="/WEB-INF/tlds/wshbjfns.tld" %>
<html>
<head>
	<title>体检记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出体检记录数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/wshbj/examinationRecord/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }

        function startFujian(examinationRecordId) {
            top.$.jBox.confirm("确认要启动复检吗？","系统提示",function(v,h,f){
                if(v=="ok"){
                    $('#msg').hide().html('');
                    startFujianDo(examinationRecordId);
                }
            },{buttonsFocus:1});
        }

        function startFujianDo(examinationRecordId) {
			var url = '${ctx}/wshbj/examinationRecord/ajax_start_fujian';
			$.post(url,{id:examinationRecordId},function (result) {
				if(result.state!='1'){
                    showTip(result.msg,"error");
				}else{
                    $('#searchForm').submit();
                    lodop_printA4('流程表','${ctxhttp}/wshbj/exam_record_print/tjb3_html?id='+examinationRecordId);
                }
            }).error(function(xhr,status,info){
                $('#msg').show().html(xhr.responseText.replace(/\n/g,"<br>"));
             });
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<shiro:hasPermission name="wshbj:examinationRecord:edit"><li><a href="${ctx}/wshbj/examinationRecord/form">体检记录添加</a></li></shiro:hasPermission>
		<li class=""><a href="${ctx}/wshbj/examinationRecord/list">体检记录列表</a></li>
		<li><a href="${ctx}/wshbj/examinationRecord/list_print">可制证体检记录</a></li>
		<li  class="active"><a href="${ctx}/wshbj/examinationRecord/list_nopass">不合格体检记录</a></li>
	</ul>

    <div class="box1">
	<div id="msg" class="alert alert-danger" style="display:none" ></div>

	<form:form id="searchForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/list_nopass" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>体检单位：</label>
				<form:select path="organId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${organList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>

			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idNumber" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>联系电话：</label>
				<form:input path="phoneNumber" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>编号：</label>
                <form:input path="code" htmlEscape="false" maxlength="50" class="input-medium"/>
            </li>
			<li><label>体检套餐：</label>
				<form:select path="packageId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${packageList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
<%--
			<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
--%>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th width="120">编号</th>
				<th width="130">体检单位</th>
				<th width="80">体检人</th>
				<th width="170">身份证号</th>
				<th width="100">联系电话</th>
				<th width="40">性别</th>
				<th >体检套餐/项目</th>
				<th width="120">填报时间</th>
				<shiro:hasPermission name="wshbj:examinationRecord:edit"><th width="150">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationRecord">
			<tr >
				<td>
						<a href="${ctx}/wshbj/examinationRecord/view?id=${examinationRecord.id}">${examinationRecord.code}</a>
				</td>
				<td>
						${examinationRecord.organName}
				</td>
				<td>
						${examinationRecord.name}
				</td>
				<td>
						${examinationRecord.idNumber}
				</td>
				<td>
						${examinationRecord.phoneNumber}
				</td>
				<td>
						${fns:getDictLabel(examinationRecord.sex,'sex','')}
				</td>

				<td>
				    <c:if test="${examinationRecord.itemType==1}">${wshbjfns:getEntityName('ExaminationPackage',examinationRecord.packageId,'')}</c:if>
					<c:if test="${examinationRecord.itemType == 2}">
					    <c:forEach items="${examinationRecord.items}" var="ri">${ri.itemName} | </c:forEach>
					</c:if>

				</td>
				<td>
					<fmt:formatDate value="${examinationRecord.updateDate}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<shiro:hasPermission name="wshbj:examinationRecord:edit"><td>

					<c:if test="${examinationRecord.status eq '20' or examinationRecord.status eq '30' }">
					<a class="label label-info" href="javascript:void(0);" onclick="startFujian('${examinationRecord.id}');" target="_blank">启动复检</a> </c:if>

				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>


</body>
</html>