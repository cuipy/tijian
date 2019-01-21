<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="wshbjfns" uri="/WEB-INF/tlds/wshbjfns.tld" %>
<html>
<head>
	<title>体检用户管理</title>
	<meta name="decorator" content="default"/>

	<style type="text/css">
    .th_order{
        cursor:pointer;
    }
    </style>

	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }

        function clkOrder(_orderField){
            var currField = '${examinationUser.orderField}';
            var currDirect = '${examinationUser.orderDirect}';

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
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationUser/">体检用户列表</a></li>
		<shiro:hasPermission name="wshbj:examinationUser:edit"><li><a href="${ctx}/wshbj/examinationUser/form">体检用户添加</a></li></shiro:hasPermission>
	</ul>

	<div class="box1">
	<form:form id="searchForm" modelAttribute="examinationUser" action="${ctx}/wshbj/examinationUser/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        <form:hidden path="orderField"/>
        <form:hidden path="orderDirect"/>

		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idNumber" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>联系电话：</label>
				<form:input path="phoneNumber" htmlEscape="false" maxlength="45" class="input-medium"/>
			</li>
			<li><label>体检单位：</label>
				<form:select path="organId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${organList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<form:form action="${ctx}/wshbj/examinationRecord/importFile" method="post" enctype="multipart/form-data">
		<input type="file" id="file" name="file">
		<input  class="btn btn-primary" type="submit" value="Excel批量导入"/>
	</form:form>
		<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th width="120" class="th_order" onclick="clkOrder('a.name')">姓名
				<c:if test="${examinationUser.orderField == 'a.name' and examinationUser.orderDirect=='asc' }"><i class="icon-circle-arrow-up"></i> </c:if>
                <c:if test="${examinationUser.orderField == 'a.name' and examinationUser.orderDirect=='desc' }"><i class="icon-circle-arrow-down"></i> </c:if>
				</th>
				<th width="180" class="th_order" onclick="clkOrder('a.id_number')">身份证号
				<c:if test="${examinationUser.orderField == 'a.id_number' and examinationUser.orderDirect=='asc' }"><i class="icon-circle-arrow-up"></i> </c:if>
                <c:if test="${examinationUser.orderField == 'a.id_number' and examinationUser.orderDirect=='desc' }"><i class="icon-circle-arrow-down"></i> </c:if>
				</th>
				<th  class="th_order" onclick="clkOrder('a.phone_number')">联系电话
				<c:if test="${examinationUser.orderField == 'a.phone_number' and examinationUser.orderDirect=='asc' }"><i class="icon-circle-arrow-up"></i> </c:if>
                <c:if test="${examinationUser.orderField == 'a.phone_number' and examinationUser.orderDirect=='desc' }"><i class="icon-circle-arrow-down"></i> </c:if>
				</th>
				<th>性别</th>
				<th width="260">单位</th>
				<th>备注</th>
				<shiro:hasPermission name="wshbj:examinationUser:edit"><th width="120">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="examinationUser">
			<tr>
				<td>
					<shiro:hasPermission name="wshbj:examinationUser:edit">
						<a href="${ctx}/wshbj/examinationUser/form?id=${examinationUser.id}">
						</shiro:hasPermission>
						${examinationUser.name}
							<shiro:hasPermission name="wshbj:examinationUser:edit">
						</a>
								</shiro:hasPermission>
				</td>
				<td>
					${examinationUser.idNumber}
				</td>
				<td>
					${examinationUser.phoneNumber}
				</td>
				<td>
							${fns:getDictLabel(examinationUser.sex,'sex','')}
				</td>
				<td>
							${wshbjfns:getEntityName('Organ',examinationUser.organId,'')}
				</td>
				<td>
					${examinationUser.remarks}
				</td>
				<shiro:hasPermission name="wshbj:examinationUser:edit"><td>
    				<a href="${ctx}/wshbj/examinationUser/form?id=${examinationUser.id}">修改</a>
					<a href="${ctx}/wshbj/examinationUser/delete?id=${examinationUser.id}" onclick="return confirmx('确认要删除该体检用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
<%--
    <div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 体检用户是体检人管理，由前台操作录入<br>
      2. 体检用户身份证是唯一标记，不可重复。

    </div>

   <div class="alert alert-danger">
      <strong>重要提示，需要完成的准备工作：</strong> <br>
      1. 体检单位、行业、岗位，需要先录入系统<br>
      2. 身份证号码不允许重复。

    </div>--%>
    </div>

</body>
</html>