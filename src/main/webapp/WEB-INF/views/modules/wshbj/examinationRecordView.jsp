<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检记录管理</title>
	<meta name="decorator" content="default"/>

</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/form?id=${examinationRecord.id}">体检记录<shiro:hasPermission name="wshbj:examinationRecord:edit">${not empty examinationRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationRecord:edit">查看</shiro:lacksPermission></a></li>
        <li><a href="${ctx}/wshbj/examinationRecord/">体检记录列表</a></li>
	</ul><br/>

	<div >
	<form:form id="inputForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>

    <div class="row">

		<div class="control-group span6">
			 <label class="control-label"><font color="red">*</font> 编号：</label>
			<div class="controls">
				${examinationRecord.code}
			</div>
		</div>

		<div class="control-group span6">
			<label class="control-label"><font color="red">*</font>  体检用户：</label>
			<div class="controls">
				${examinationRecord.name}

			</div>
		</div>

		<div class="control-group span6">
			<label class="control-label"><font color="red">*</font>  身份证号：</label>
			<div class="controls">
				${examinationRecord.idNumber}
			</div>
		</div>


		<div class="control-group span6">
			<label class="control-label"><font color="red">*</font> 联系电话：</label>
			<div class="controls">
				${examinationRecord.phoneNumber}

			</div>
		</div>

		<div class="control-group span6">
			<label class="control-label"><font color="red">*</font> 性别：</label>
			<div class="controls">
			    ${fns:getDictLabel(examinationRecord.sex,'sex','')}
			</div>
		</div>
		<div class="control-group span6">
            <label class="control-label"><font color="red">*</font> 出生日期：</label>
            <div class="controls">
                ${examinationRecord.birthday}
            </div>
        </div>

	<div class="control-group span6">
		<label class="control-label">行业：</label>
		<div class="controls">
		     ${examinationRecord.industry.name}
		</div>
	</div>
	<div class="control-group span6" >
		<label class="control-label">单位：</label>
		<div class="controls">
			<form:select  path="organId"  class="input-large">
				<form:option value="">
					请选择
				</form:option>
				<form:options items="${organList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
			</form:select>
		</div>
	</div>
	<div class="control-group span6">
		<label class="control-label">岗位：</label>
		<div class="controls">
			<form:select path="postId" class="input-large">
				<form:option value="">
					请选择
				</form:option>
				<form:options items="${postList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
			</form:select>
		</div>
	</div>

		<div class="cl"></div>
		<div class="control-group span12">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="cl"></div>
		<div class="control-group span6">
			<label class="control-label">体检项目方式：</label>
			<div class="controls">
				<input type="radio" id="itemType1" name="itemType" value="1" <c:if test="${examinationRecord.itemType eq 1}">selected="selected"</c:if>/><label for="itemType1">体检套餐</label>
				<input type="radio" id="itemType2" name="itemType" value="2" <c:if test="${examinationRecord.itemType eq 2}">selected="selected"</c:if>/><label for="itemType2">自由选择</label>
			</div>
		</div>
				<div class="control-group span6">
        			<label class="control-label">价格：</label>
        			<div class="controls">
        				<form:input path="packagePrice" htmlEscape="false" maxlength="64" class="input-large "/>
        			</div>
        		</div>

		<div class="control-group span12" id="packageIdDiv" style="<c:if test="${examinationRecord.itemType eq 2}">display: none;</c:if>">
			<label class="control-label">体检套餐：</label>
			<div class="controls">
				<select id="packageId" name="packageId" class="input-large" onchange="chgPackage()">
				     <option/>请选择体检套餐
					<c:forEach items="${packageList}" var="p">
					<option value="${p.id}" data-price="${p.price}" <c:if test="${p.id == examinationRecord.packageId}">selected='selected'</c:if> >${p.name}</option>
					</c:forEach>
				</select>

			</div>
		</div>
		<div class="control-group span12" id="itemsDiv" style="<c:if test="${empty examinationRecord.itemType or examinationRecord.itemType eq 1}">display: none;</c:if>">
			<label class="control-label">检查项目列表：</label>
			<div class="controls">
			    <c:forEach items="${examinationItemList}" var="ri" varStatus="s">
				<input id="ri${ri.id}" name="examinationRecordItemList[${s.index}].itemId" value="${ri.id}" type="checkbox" data-price="${ri.price}" onclick="clkItems()"
				<c:if test="${fn:contains(examinationRecord.itemIds,ri.id)}">checked='checked'</c:if> >
				<label for="ri${ri.id}">[${ri.code}] ${ri.name} ${ri.price}元</label>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
			</div>
		</div>
		<div class="cl"></div>
		<div class="form-actions span12">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>

</div>
	</form:form>
	</div>

    <div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 信息登记是在体检前进行登记<br>
      2. 该信息一般由前台登记人员创建<br>


    </div>

    <div class="alert alert-danger">
      <strong>重要提示，需要完成的准备工作：</strong> <br>
      1. 体检用户必须录入系统，见：<span class="help-inline">左侧菜单 - 体检人  -  体检用户</span>，如没有该菜单，说明您没有操作该功能的权限或菜单名称变更，请联系相关负责人处理<br>
      2. 体检套餐必须录入系统，见：<span class="help-inline">左侧菜单 - 基础数据 - 体检套餐</span>，如没有该菜单，说明您没有操作该功能的权限或菜单名称变更，请联系相关负责人处理<br>
      3. 自由选择的体检项目，项目都是在<span class="help-inline">辅助信息 - 检查项目</span>菜单中维护，如没有该菜单，说明您没有操作该功能的权限或菜单名称变更，请联系相关负责人处理<br>

    </div>

</body>
</html>