<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人信息</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/user/info">个人信息</a></li>
		<li><a href="${ctx}/sys/user/modifyPwd">修改密码</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/info" method="post" class="form-horizontal"><%--
		<form:hidden path="email" htmlEscape="false" maxlength="255" class="input-xlarge"/>
		<sys:ckfinder input="email" type="files" uploadPath="/mytask" selectMultiple="false"/> --%>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">头像:</label>
			<div class="controls">
				 <sys:cropper mainImgWidth="180"  mainImgHeight="180" imgName="头像" path="photo"
							  errImg="${ctxStatic}/images/nopic.jpg"
							  value="${ctx}/sys/user/getPhotoImg?id=${user.id}"/>
			</div>
		</div>

 		<div class="control-group">
			<label class="control-label">单位:</label>
			<div class="controls">
				<label class="lbl" style="width: 108px">${user.company.name}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">系统名称:</label>
			<div class="controls">
				<label class="lbl" >河北梦桥健康管理系统</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"> </label>
			<div class="controls">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"> </label>
			<div class="controls">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"> </label>
			<div class="controls">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"> </label>
			<div class="controls">
			</div>
		</div>



		<div class="control-group">
			<label class="control-label">姓名:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">邮箱:</label>
			<div class="controls">
				<form:input path="email" htmlEscape="false" maxlength="50" class="email"/>
			</div>
		</div>
 		<div class="control-group">
			<label class="control-label">电话:</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="50"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机:</label>
			<div class="controls">
				<form:input path="mobile" htmlEscape="false" maxlength="50"/>
			</div>
		</div>
 		<div class="control-group">
			<label class="control-label">地址:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<div class="cl"></div>
		<%--		<div class="control-group">
                    <label class="control-label">用户类型:</label>
                    <div class="controls">
                        <label class="lbl">${fns:getDictLabel(user.userType, 'sys_user_type', '无')}</label>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">用户角色:</label>
                    <div class="controls">
                        <label class="lbl">${user.roleNames}</label>
                    </div>
                </div>
                 <div class="control-group">
                    <label class="control-label">上次登录:</label>
                    <div class="controls">
                        <label class="lbl">IP: ${user.oldLoginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${user.oldLoginDate}" type="both" dateStyle="full"/></label>
                    </div>
                </div>--%>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
		</div>
	</form:form>
</body>
</html>