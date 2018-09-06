<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="wshbjfns" uri="/WEB-INF/tlds/wshbjfns.tld" %>
<html>
<head>
	<title>体检记录管理</title>
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
	<script type="text/javascript" src="/static/My97DatePicker/WdatePicker.js"></script>


</head>

<body>

	<ul class="nav nav-tabs">
		<li ><a href="${ctx}/wshbj/examinationRecord/tongji1">体检单位以及人数统计</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/tongji2">体检人员月综合统计</a></li>
		<li ><a href="${ctx}/wshbj/examinationRecord/tongji3">健康检查年统计</a></li>
		<li ><a href="${ctx}/wshbj/examinationRecord/tongji4">不合格人员统计</a></li>

	</ul>
	<div class="box1">

		<form:form id="searchForm"  action="${ctx}/wshbj/examinationRecord/tongji2" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>开始时间：</label>
				<input type="text" name="beginDate"   class="input-medium Wdate required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">
 			</li>
			<li><label>截止时间：</label>
				<input type="text"  name="endDate"     class="input-medium Wdate required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">

			</li>
			<li><label>单位：</label>
				<input type="text" name="organ" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
            </li>
		</ul>
	</form:form>


		<sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
			<tr>
				<th width="130">编号</th>
				<th width="130">姓名</th>

				<th width="130">性别</th>
				<th width="80">年龄</th>
				<th width="170">是否制证</th>
				<th width="100">身份证</th>
				<th width="100">工作单位</th>
				<th width="100">行业</th>
				<th width="100">岗位</th>
				<th width="100">联系电话</th>
				<th width="120">体检日期</th>
 			</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="examinationRecord">
				<tr >
					<td>
						<a href="${ctx}/wshbj/examinationRecord/view?id=${examinationRecord.id}">${examinationRecord.code}</a>
					</td>
					<td>
							${examinationRecord.name}
					</td>
					<td>
							${fns:getDictLabel(examinationRecord.sex,'sex','')}
					</td>

					<td>
							${examinationRecord.age}
					</td>
					<td>
							${fns:getDictLabel(examinationRecord.status,'examination_record_status','')}
					</td>
					<td>
							${examinationRecord.idNumber}
					</td>
					<td>
							${examinationRecord.organName}
					</td>
					<td>
							${examinationRecord.industry.name}
					</td>

					<td>
							${examinationRecord.jobPost.name}
					</td>

					<td>
							${examinationRecord.phoneNumber}
					</td>

					<td>
						<fmt:formatDate value="${examinationRecord.updateDate}" pattern="yyyy-MM-dd HH:mm"/>
					</td>

				</tr>
			</c:forEach>
			</tbody>
		</table>
	<div class="pagination">${page}</div>
    </div>


</body>
</html>