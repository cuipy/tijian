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

        function clkCancelResult(id,result){

            confirmx('您确信要撤销这个结果吗？一旦撤销，该项目需要重新设置结果。',function(){
                var url="${ctx}/wshbj/examinationRecordItem/ajax_cancel_result";
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
		<li><a href="${ctx}/wshbj/examinationRecordItem/list_resulting">待录结果项目</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationRecordItem/list_resulted">已录结果项目</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="examinationRecordItem" action="${ctx}/wshbj/examinationRecordItem/list_resulted" method="post" class="breadcrumb form-search">
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
			<li><label>体检项目：</label>
				<form:select path="itemName" class="input-mini">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${examinationItemList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>

			<li><label>开始时间：</label>
				<form:input path="beginDate" cssStyle="width: 163px;" htmlEscape="false"  maxlength="64" class="input-mini Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>截止时间：</label>
				<form:input path="endDate" cssStyle="width: 163px;" htmlEscape="false"  maxlength="64" class="input-mini Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>体检项目：</label>
				<form:select path="itemId" class="input-mini" cssStyle="width: 163px">
					<form:option value="0">
						请选择
					</form:option>
					<form:option value="1">
						信息登记日期
					</form:option>
					<form:option value="2">
						采样日期
					</form:option>
					<form:option value="3">
						录入结果日期
					</form:option>
				</form:select>
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
				<td>${item.strStatus}</td>
				<td>${item.strExaminationFlag}</td>
				<td> ${item.remarks} </td>
				<shiro:hasPermission name="wshbj:examinationRecordItem:edit"><td>

                    <c:if test="${item.needSamples == '1' }"><span class="btn btn-mini btn-warning" onclick="clkCancelSample('${item.id}')">撤销样本</span>&nbsp;&nbsp;&nbsp;</c:if>
    				<span class="btn btn-mini btn-warning" onclick="clkCancelResult('${item.id}')">撤销结果</span>&nbsp;&nbsp;&nbsp;

				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>