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

        $(function() {
            $('#all').on('click',function(){
                if(this.checked) {
                    $("input[name='id']").attr('checked',true);
                }else {
                    $("input[name='id']").attr('checked',false);
                }
            });
        });


        function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
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
                     vendorJson[i].sampleCode='不需要采样';
                }
                  $("#infomation").append("<tr id='tr1_"+vendorJson[i].id+"'>" +
                     "<td>"+vendorJson[i].sampleCode+"</td> " +
                     "<td>"+vendorJson[i].recordOrganName+" </td> " +
                     "<td>"+vendorJson[i].itemName+" </td>"+
                     "<td>"+vendorJson[i].strStatus+"</td>" +
                     "<td>"+vendorJson[i].strExaminationFlag+"</td>"+
                      "<td style='width:100px;'> <span class='btn btn-mini btn-success' onclick=\"clkResult('"+vendorJson[i].id+"',1)\">合格</span>&nbsp;&nbsp;&nbsp;"+
                     "<span class='btn btn-mini btn-danger' onclick=\"clkResult('"+vendorJson[i].id+"',0)\">不合格</span> </td>"+
                     "</tr>");

            }
        };

        function clkResult(itemId,result){
             var url="${ctx}/wshbj/examinationRecordItem/ajax_update_result_flag";
            var d1={id:itemId,resultFlag:itemId+","+result};
            $.ajax({
                type:'post',dataType:'json',url:url,data:d1,
                success:function(d1r){
                    if(d1r.state== 1){
                        showTip(d1r.msg);
                         $("#tr1_"+itemId).remove();
                    }else{
                        showMsgx($("#msg"),d1r);
                    }

                },
                error:function(err){
                   showMsgx($("#msg"),d1r);
                }
            })

        }
        function clkAllResult(result){
            //声明变量
            var ids="";
            //jquery获取选中的checkedbox值判断这个值不为空 用,号隔开
            $("input[name='id']:checkbox:checked").each(function(){ if($(this).val()!=''){ ids+=$(this).val()+",";} });
             var url="${ctx}/wshbj/examinationRecordItem/ajax_update_allresult_flag";
            var d1={ids:ids,resultFlag:result};
            $.ajax({
                type:'post',dataType:'json',url:url,data:d1,
                success:function(d1r){
                    if(d1r.state== 1){
                        showTip(d1r.msg);
                        var result=ids.split(",");
                        for(var i=0;i<result.length;i++){
                             $("#tr_"+result[i]).remove();
                        }
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

	<div class="box1">
	<form:form id="searchForm" modelAttribute="examinationRecordItem" action="${ctx}/wshbj/examinationRecordItem/list_resulting" method="post" class="breadcrumb form-search">
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
			<li><label>体检时间：</label>
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


 				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>	</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	   <p style="margin-left:1%">
	   <span class="btn btn-mini btn-success" onclick="clkAllResult(1)">批量合格</span>&nbsp;&nbsp;&nbsp;
       		<span class="btn btn-mini btn-danger" onclick="clkAllResult(0)">批量不合格</span>

        </p>


		<div id="msg" class="alert alert-danger" style="display:none">
	    <a class="close" data-dismiss="alert" href="#">&times;</a>
	    <span class="text"></span>
	</div>
	<sys:message content="${message}"/>




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





	</div>
</body>
</html>