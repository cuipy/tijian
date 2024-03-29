<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="wshbjfns" uri="/WEB-INF/tlds/wshbjfns.tld" %>
<html>
<head>
	<title>体检记录管理</title>
	<meta name="decorator" content="default"/>

<style type="text/css">
.th_order{
    cursor:pointer;
}
</style>

	<script type="text/javascript">
		$(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出体检记录数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/wshbj/examinationRecord/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});

			setTimeout("lodop_check()",300);

		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }

        function do_print(recordId){
            var url='${ctx}/wshbj/zhizhengAddRecord/ajax_get_last';
            var d1={};
            $.get(url,d1,function(d1r){
                if(d1r.state!=1){
                    alert(d1r.msg);
                    return;
                }
                var resultCount=0;
                if(d1r.data==null||d1r.data.resultCount==null){
                    resultCount=0;
                }else{
                    resultCount = d1r.data.resultCount;
                }
                if(resultCount<=0){
                    alert("可制证数量不足，请联系管理员");
                    return;
                }

                var url2='${ctx}/wshbj/examinationRecord/ajax_print_card';
                var d2={id:recordId};
                $.get(url2,d2);

                lodop_view_printBarcode('体检流程表','${ctxhttp}/wshbj/exam_record_print/zhizheng_html?id='+recordId)

            });
        }

        function do_print2(recordId){
            var url='${ctx}/wshbj/zhizhengAddRecord/ajax_get_last';
            var d1={};
            $.get(url,d1,function(d1r){
                if(d1r.state!=1){
                    alert(d1r.msg);
                    return;
                }
                var resultCount=0;
                if(d1r.data==null||d1r.data.resultCount==null){
                    resultCount=0;
                }else{
                    resultCount = d1r.data.resultCount;
                }
                if(resultCount<=0){
                    alert("可制证数量不足，请联系管理员");
                    return;
                }

                var url2='${ctx}/wshbj/examinationRecord/ajax_print_card';
                var d2={id:recordId};
                $.get(url2,d2);

                lodop_printCard('体检流程表','${ctxhttp}/wshbj/exam_record_print/zhizheng_html2?id='+recordId)

            });
        }
        function do_printview(recordId){
                 window.open('${ctxhttp}/wshbj/exam_record_print/zhizheng_html?id='+recordId);

        }

        function clkOrder(_orderField){
            var currField = '${examinationRecord.orderField}';
            var currDirect = '${examinationRecord.orderDirect}';

            $("#orderField").val(_orderField);

            if(_orderField == currField){
                $("#orderDirect").val(currDirect == 'asc'? 'desc':'asc');
            }else{
                $("#orderDirect").val( 'desc' );
            }
            $("#searchForm").submit();
        }



	</script>
</head>

<body>
    <div class="box1">
    <%@ include file="/WEB-INF/views/include/check_lodop.jsp"%>
    </div>

	<ul class="nav nav-tabs">
		<shiro:hasPermission name="wshbj:examinationRecord:edit"><li><a href="${ctx}/wshbj/examinationRecord/form">体检记录添加</a></li></shiro:hasPermission>
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/list">体检记录列表</a></li>
		<li class=""><a href="${ctx}/wshbj/examinationRecord/list_print">可制证体检记录</a></li>
		<li ><a href="${ctx}/wshbj/examinationRecord/list_nopass">不合格体检记录</a></li>
	</ul>
	<div class="box1">
	<form:form id="searchForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">

			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-mini"/>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idNumber" htmlEscape="false" maxlength="50" class="input-mini"/>
			</li>
			<li><label>联系电话：</label>
				<form:input path="phoneNumber" htmlEscape="false" maxlength="45" class="input-mini"/>
			</li>
			<li><label>编号：</label>
                <form:input path="code" htmlEscape="false" maxlength="50" class="input-mini"/>
            </li>
			<li><label>状态：</label>
				<form:select path="status" cssStyle="width: 100px">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${fns:getDictList('examination_record_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>体检套餐：</label>
				<form:select path="packageId" class="input-mini">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${examinationItemList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns">
			    <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
                <input id="btnExport" class="btn btn-primary" type="button" value="导出Excel"/>
                <form:hidden path="orderField"/>
                <form:hidden path="orderDirect"/>
            </li>

			<li><label>A4打印机：</label>
                    <select id="sltA4Print" style="min-width:200px;"  onclick="lodop_setA4PrintIndex()"></select>
                </li>
                <li><label>条码打印机：</label>
                    <select id="sltBarcodePrint" style="min-width:200px;"  onclick="lodop_setBarcodePrintIndex()"></select>
                </li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th width="120" class="th_order" onclick="clkOrder('a.code')">编号
				<c:if test="${examinationRecord.orderField == 'a.code' and examinationRecord.orderDirect=='asc' }"><i class="icon-circle-arrow-up"></i> </c:if>
                <c:if test="${examinationRecord.orderField == 'a.code' and examinationRecord.orderDirect=='desc' }"><i class="icon-circle-arrow-down"></i> </c:if>
				</th>
				<th width="130" class="th_order" onclick="clkOrder('o2.name')">体检单位
				<c:if test="${examinationRecord.orderField == 'o2.name' and examinationRecord.orderDirect=='asc' }"><i class="icon-circle-arrow-up"></i> </c:if>
				<c:if test="${examinationRecord.orderField == 'o2.name' and examinationRecord.orderDirect=='desc' }"><i class="icon-circle-arrow-down"></i> </c:if> </th>
                <th width="80" class="th_order" onclick="clkOrder('u2.name')">体检人
                <c:if test="${examinationRecord.orderField == 'u2.name' and examinationRecord.orderDirect=='asc' }"><i class="icon-circle-arrow-up"></i> </c:if>
                <c:if test="${examinationRecord.orderField == 'u2.name' and examinationRecord.orderDirect=='desc' }"><i class="icon-circle-arrow-down"></i> </c:if>
                </th>
                <th width="170" class="th_order" onclick="clkOrder('u2.id_number')">身份证号
                <c:if test="${examinationRecord.orderField == 'u2.id_number' and examinationRecord.orderDirect=='asc' }"><i class="icon-circle-arrow-up"></i> </c:if>
                <c:if test="${examinationRecord.orderField == 'u2.id_number' and examinationRecord.orderDirect=='desc' }"><i class="icon-circle-arrow-down"></i> </c:if>
                </th>
				<th width="100" class="th_order" onclick="clkOrder('a.phone_number')">联系电话
                <c:if test="${examinationRecord.orderField == 'a.phone_number' and examinationRecord.orderDirect=='asc' }"><i class="icon-circle-arrow-up"></i> </c:if>
                <c:if test="${examinationRecord.orderField == 'a.phone_number' and examinationRecord.orderDirect=='desc' }"><i class="icon-circle-arrow-down"></i> </c:if>
				</th>
				<th width="60">性别</th>
				<th >体检套餐/项目</th>
				<th width="120" class="th_order" onclick="clkOrder('a.update_date')">填报时间
                <c:if test="${examinationRecord.orderField == 'a.update_date' and examinationRecord.orderDirect=='asc' }"><i class="icon-circle-arrow-up"></i> </c:if>
                <c:if test="${examinationRecord.orderField == 'a.update_date' and examinationRecord.orderDirect=='desc' }"><i class="icon-circle-arrow-down"></i> </c:if>
				</th>
				<th width="100" class="th_order" onclick="clkOrder('a.status')">状态
                <c:if test="${examinationRecord.orderField == 'a.status' and examinationRecord.orderDirect=='asc' }"><i class="icon-circle-arrow-up"></i> </c:if>
                <c:if test="${examinationRecord.orderField == 'a.status' and examinationRecord.orderDirect=='desc' }"><i class="icon-circle-arrow-down"></i> </c:if>
				</th>
				<shiro:hasPermission name="wshbj:examinationRecord:edit"><th width="400">操作</th></shiro:hasPermission>
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
				<td>
						${fns:getDictLabel(examinationRecord.status,'examination_record_status','')}
				</td>
				<shiro:hasPermission name="wshbj:examinationRecord:edit"><td>
					<c:if test="${examinationRecord.status == '0'}"><a class="label label-success" href="${ctx}/wshbj/examinationRecord/form?id=${examinationRecord.id}">修改</a></c:if>
					<c:if test="${examinationRecord.status <= 10}">
		<%--				<a class="label label-info" href="javascript:void(0)" onclick="lodop_printA4('体检流程表','${ctxhttp}/wshbj/exam_record_print/tjb_html?id=${examinationRecord.id}')" target="_blank">打印健康体检表</a>
						<a class="label label-info" href="javascript:void(0)" onclick="lodop_printA4('体检流程表','${ctxhttp}/wshbj/exam_record_print/tjb2_html?id=${examinationRecord.id}')" target="_blank">打印公共体检表</a>
						<a class="label label-info" href="javascript:void(0)" onclick="lodop_view_printA4('体检流程表','${ctxhttp}/wshbj/exam_record_print/tjb_html?id=${examinationRecord.id}')" target="_blank">预览打印体检表</a>--%>
                    </c:if>
					<c:if test="${examinationRecord.status eq '40' or examinationRecord.status eq '45' or examinationRecord.status eq '50' }">
					<a class="label label-success" href="javascript:void(0)"
					 onclick="do_print('${examinationRecord.id}')" target="_blank">打印健康证1</a>
						<a class="label label-success" href="javascript:void(0)"
						   onclick="do_print2('${examinationRecord.id}')" target="_blank">打印健康证2</a>
					  <a class="label label-success" href="javascript:void(0)"
                     onclick="do_printview('${examinationRecord.id}')" target="_blank">预览健康证</a></c:if>


					<c:if test="${examinationRecord.status == '0'}">
					    <a class="label label-danger"  href="${ctx}/wshbj/examinationRecord/delete?id=${examinationRecord.id}" onclick="return confirmx('确认要删除该体检记录吗？', this.href)">删除</a></c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>

    </div>


</body>
</html>