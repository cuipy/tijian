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


        function info (recordId){
            $.ajax({
                url:"${ctx}/wshbj/examinationRecordItem/ajax_examinationRecordItem2?recordId="+recordId,
                type:"post",
                success(res){
                    backFunc(res);
                }
            });
        }
        //请求成功后开始遍历list
        function backFunc(result){
            var vendorJson = eval(result);
            $("#infomation>tr").remove();
            for(var i=0; i<vendorJson.length; i++){

                if(vendorJson[i].sampleCode==undefined){
                    vendorJson[i].sampleCode='无';
                }
                if(vendorJson[i].resultRemarks==undefined){
                    vendorJson[i].resultRemarks='';
                }
                $("#infomation").append("<tr id='tr_"+vendorJson[i].id+"'>" +
                    "<td>"+vendorJson[i].sampleCode+"</td> " +
                    "<td>"+vendorJson[i].recordOrganName+" </td> " +
                    "<td>"+vendorJson[i].itemName+" </td>"+
                    "<td>"+vendorJson[i].strStatus+"</td>" +
                    "<td>"+vendorJson[i].strExaminationFlag+"</td>"+
                    "<td>"+vendorJson[i].resultRemarks+"</td>"+
                    "<td style='width:100px;'> <span class='btn btn-mini btn-warning' onclick=\"clkCancelSample('"+vendorJson[i].id+"',1)\">撤销样本</span>&nbsp;&nbsp;&nbsp;"+
                    "<span class='btn btn-mini btn-warning' onclick=\"clkCancelResult('"+vendorJson[i].id+"',0)\">撤销结果</span> </td>"+
                    "</tr>");

            }
        };

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


			<li><label>体检项目：</label>
				<form:select path="itemName" class="input-mini" cssStyle="width: 163px">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${examinationItemList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>
            <li><label> </label>
                <form:hidden path="userName" htmlEscape="false" maxlength="64" class="input-medium"/>
            </li>
			<li><label></label>
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
<%--	<table id="contentTable" class="table table-striped table-bordered table-condensed">
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


	<div class="pagination">${page}</div>--%>

    <table id="contentTable" class="table table-striped table-bordered table-condensed;" style="width:250px;float:left;">
        <thead style="width:80px;margin-left:10%;">
        <tr>
            <th width="10"> <input type="checkbox"  id="all" value=""></th>
            <th width="40">体检编号</th>

            <th width="40">体检人</th>

        </tr>
        </thead>



        <tbody  style:flolt:left width:200px;boder:1px solid #ff0000;>
        <c:forEach items="${page.list}" var="item">
            <tr id="tr_${item.id}" >
                <td><input  type="checkbox" name="id" value="${item.recordId}"></td>
                <td>
                    <a href="#" onclick="info('${item.recordId}')" >${item.examinationCode}</a>
                </td>
                <td> ${item.recordUserName}  </td>

            </tr>
        </c:forEach>

        </tbody style:"width:50%;flolt:left;">
        <div class="pagination">${page}</div>


    </table>
    <table id="contentTable" class="table table-striped table-bordered table-condensed;" style="width:800px;float:left;margin-left:30px";>
        <thead style="width:20px;"  >
        <tr>


            <th width="60">样本编号</th>
            <th width="80">体检单位</th>

            <th width="50">项目</th>
            <th width="50">状态</th>
            <th width="50">初/复</th>
            <th width="200">备注</th>
            <shiro:hasPermission name="wshbj:examinationRecordItem:edit">
                <th width="80">操作</th></shiro:hasPermission>
        </tr>
        </thead>

        <tbody id="infomation" style:flolt:left width:200px;border:1px solid #ff0000;>
        <%--
                    <c:forEach items="${page.list}" var="item">
                        <tr id='tr_'>

                        <td> ${item.sampleCode} </td>
                        <td> <c:if test="${not empty item.recordOrganName }">${item.recordOrganName} </c:if>  </td>

                        <td>${wshbjfns:getEntityName('ExaminationItem',item.itemId,'')} </td>
                        <td>${item.strStatus}</td>
                        <td>${item.strExaminationFlag}</td>
                        <shiro:hasPermission name="wshbj:examinationRecordItem:edit"><td style="width:100px;">

                            <span class="btn btn-mini btn-success" onclick="clkResult('${item.id}',1)">合格</span>&nbsp;&nbsp;&nbsp;
                            <span class="btn btn-mini btn-danger" onclick="clkResult('${item.id}',0)">不合格</span>

                        </td></shiro:hasPermission>
                        </tr>
                    </c:forEach>
        --%>
        </tbody style:"width:50%;flolt:left;";>
    </table>

</body>
</html>