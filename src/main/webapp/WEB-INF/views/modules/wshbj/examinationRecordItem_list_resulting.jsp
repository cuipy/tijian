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

        function clkResult(itemId,result){

            var url="${ctx}/wshbj/examinationRecordItem/ajax_update_result_flag";
            var d1={id:itemId,resultFlag:result};
            $.ajax({
                type:'post',dataType:'json',url:url,data:d1,
                success:function(d1r){
                    if(d1r.state== 1){
                        showTip(d1r.msg);
                        $("#tr_"+itemId).remove();
                    }else{
                        showMsgx($("#msg"),d1r);
                    }

                },
                error:function(err){
                   showMsgx($("#msg"),d1r);
                }
            })

        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationRecordItem/list_resulting">待录结果项目</a></li>
		<li><a href="${ctx}/wshbj/examinationRecordItem/list_resulted">已录结果项目</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationRecordItem" action="${ctx}/wshbj/examinationRecordItem/list_no_result" method="post" class="breadcrumb form-search">
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
	<div id="msg" class="alert alert-danger" style="display:none">
	    <a class="close" data-dismiss="alert" href="#">&times;</a>
	    <span class="text"></span>
	</div>
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
			<tr id="tr_${item.id}">
				<td>
					${item.examinationCode}
				</td>
				<td> ${item.sampleCode} </td>
				<td> <c:if test="${not empty item.recordOrganName }">${item.recordOrganName} - </c:if> ${item.recordUserName}  </td>
				<td>${wshbjfns:getEntityName('ExaminationItem',item.itemId,'')} </td>
				<td>${item.strStatus}</td>
				<td>${item.strExaminationFlag}</td>
				<td> ${item.remarks} </td>
				<shiro:hasPermission name="wshbj:examinationRecordItem:edit"><td>

    				<span class="btn btn-mini btn-success" onclick="clkResult('${item.id}',1)">合格</span>&nbsp;&nbsp;&nbsp;
    				<span class="btn btn-mini btn-danger" onclick="clkResult('${item.id}',0)">不合格</span>

				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>