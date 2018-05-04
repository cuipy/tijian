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

        function clkCancelSample(id,result){

            confirmx('您确信要撤销这个样本吗？一旦撤销，该项目需要重新进行取样。',function(){
                var url="${ctx}/wshbj/examinationRecordItem/ajax_cancel_sample";
                var d1={'id':id};
                $.ajax({
                    type:'post',dataType:'json',url:url,data:d1,
                    success:function(d1r){
                        showMsgx($('#msg'),d1r);
                        if(d1r.state==1){
                            $('#tr_'+id).remove();
                        }
                    },
                    error:function(err){
                        showMsgx($('#msg'),err);
                    }
                })
            });
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li <c:if test="${where == '_nodo'}"> class="active"</c:if> ><a href="${ctx}/wshbj/examinationRecordItem/list_need_sample_nodo">待采集列表</a></li>
		<li <c:if test="${where == '_done'}"> class="active"</c:if> ><a href="${ctx}/wshbj/examinationRecordItem/list_need_sample_done">已采集列表</a></li>
		<li <c:if test="${where == ''}"> class="active"</c:if> ><a href="${ctx}/wshbj/examinationRecordItem/list_need_sample">全部采集列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationRecordItem" action="${ctx}/wshbj/examinationRecordItem/list_need_sample${where}" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>体检编号：</label>
				<form:input path="queryExamCode" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>样本编号：</label>
				<form:input path="sampleCode" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>体检用户：</label>
				<form:input path="userName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>	</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div id="msg" class="alert alert-danger" style="display:none"></div>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th width="150">体检编号</th>
				<th width="200">样本编号</th>
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
			<tr id="tr_${item.id}">
				<td>
					${item.examinationCode}
				</td>
				<td> ${item.sampleCode} </td>
				<td> <c:if test="${not empty item.recordOrganName }">${item.recordOrganName} - </c:if> ${item.recordUserName}  </td>
				<td>${wshbjfns:getEntityName('ExaminationItem',item.itemId,'')} </td>
				<td>
				<c:if test="${item.status != 2 and item.status !=3 }"> ${item.strStatus} </c:if>
				<c:if test="${item.status == 3 }"> <span class="label label-success">${item.strStatus}</span> </c:if>
				<c:if test="${item.status == 2 }"> <span class="label label-warning">${item.strStatus}</span> </c:if>

				 </td>
				<td>${item.strExaminationFlag}</td>
				<td> ${item.remarks} </td>
				<shiro:hasPermission name="wshbj:examinationRecordItem:edit"><td>
    				<c:if test="${item.status ==0 || item.status == 2 }">
    				<a class="label label-important" href="${ctx}/wshbj/examinationRecordItem/form?id=${item.id}">采集</a> </c:if>

    				<c:if test="${item.needSamples == '1' and item.status ==1 }">
    				    <span class="btn btn-mini btn-warning" onclick="clkCancelSample('${item.id}')">撤销样本</span>&nbsp;&nbsp;&nbsp;</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>