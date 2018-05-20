<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检记录管理</title>
	<meta name="decorator" content="default"/>

</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/view?id=${examinationRecord.id}">体检记录</a></li>
        <li><a href="${ctx}/wshbj/examinationRecord/">体检记录列表</a></li>
	</ul><br/>

	<div >
	<form:form id="inputForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>

    <div style="max-width:1200px;">

        <div class="control-group span6">
            <label class="control-label"> 用户头像：</label>
            <div class="controls">
                 <img id="imgHeadImg" style="width:320px;min-height:220px" src="${ctx}/wshbj/examinationRecord/getHeadImg?id=${examinationRecord.id}"/>
            </div>
        </div>

		<div class="control-group span4">
			 <label class="control-label"><font color="red">*</font> 编号：</label>
			<div class="controls">
				${examinationRecord.code}
			</div>
		</div>

		<div class="control-group span4">
			<label class="control-label"><font color="red">*</font>  体检用户：</label>
			<div class="controls">
				${examinationRecord.name}
			</div>
		</div>

		<div class="control-group span4">
			<label class="control-label"><font color="red">*</font>  身份证号：</label>
			<div class="controls">
				${examinationRecord.idNumber}
			</div>
		</div>


		<div class="control-group span4">
			<label class="control-label"><font color="red">*</font> 联系电话：</label>
			<div class="controls">
				${examinationRecord.phoneNumber}

			</div>
		</div>

		<div class="control-group span4">
			<label class="control-label"><font color="red">*</font> 性别：</label>
			<div class="controls">
			    ${fns:getDictLabel(examinationRecord.sex,'sex','')}
			</div>
		</div>
		<div class="control-group span4">
            <label class="control-label"><font color="red">*</font> 出生日期：</label>
            <div class="controls">
                ${examinationRecord.birthday}
            </div>
        </div>

        <div class="control-group span4">
            <label class="control-label">行业：</label>
            <div class="controls">
                 ${examinationRecord.industryName}
            </div>
        </div>
        <div class="control-group span4" >
            <label class="control-label">单位：</label>
            <div class="controls">
                ${examinationRecord.organName}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">岗位：</label>
            <div class="controls">
                ${examinationRecord.postName}
            </div>
        </div>

		<div class="cl"></div>
		<div class="control-group span12">
			<label class="control-label">备注：</label>
			<div class="controls">
				${examinationRecord.remarks}
			</div>
		</div>
		<div class="cl"></div>
		<div class="control-group span4">
			<label class="control-label">体检项目方式：</label>
			<div class="controls">

			${examinationRecord.itemType=="1"? "体检套餐":"自由选择"}
			</div>
		</div>
        <div class="control-group span4">
            <label class="control-label">价格：</label>
            <div class="controls">
                ${examinationRecord.packagePrice } 元
            </div>
        </div>

        <div class="control-group span4">
		<label class="control-label">体检结果：</label>
            <div class="controls">
             <label class="label">${examinationRecord.strStatus }</label>
            </div>
        </div>
        <div class="cl"></div>
		<div class="control-group span12" id="itemsDiv">
			<label class="control-label">检查项目列表：</label>
			<div class="controls">
			   <c:forEach items="${examinationRecord.items}" var="ri"><label class="label"> ${ri.itemName} </label> -
                <label class="label"> <c:if test="${ri.needSamples == 1 }">需要采样
                <c:if test="${ri.grabSample == true}">标本编号：${ri.sampleCode}</c:if>
                <c:if test="${ri.grabSample == false}">待采样</c:if>  </c:if>
                <c:if test="${ri.needSamples != 1 }">无需采样</c:if> </label> -

                 <label class="label">  <c:if test="${ri.resultFlag == null }">无结果</c:if>
                 <c:if test="${ri.resultFlag == 0 }">不合格</c:if>
                <c:if test="${ri.resultFlag == 1 }">合格</c:if> </label>

                <br> </c:forEach>
			</div>
		</div>
		<div class="cl"></div>
		<div class="form-actions span12">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
        <div class="cl"></div>
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