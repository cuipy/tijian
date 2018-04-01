<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检样本管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
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

            $('#examinationCode').bind('keypress',function(event){
                if(event.keyCode == 13) {
                    var examinationCode = $('#examinationCode').val();
                    var url = '${ctx}/wshbj/examinationRecord/getMapByCode';
                    $.post(url,{code:examinationCode},function (data) {
                        if(data){
                            $('#userId').val(data.userId);
                            $('#userName').val(data.userName);
                            $('#sex').val(data.sexLabel);
                            $('#organ').val(data.organName);

                        }
                    });
                    //防止form提交
                    return false;
                }
            });
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationSamples/form?id=${examinationSamples.id}">体检样本<shiro:hasPermission name="wshbj:examinationSamples:edit">${not empty examinationSamples.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationSamples:edit">查看</shiro:lacksPermission></a></li>
		<li><a href="${ctx}/wshbj/examinationSamples/">体检样本列表</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="examinationSamples" action="${ctx}/wshbj/examinationSamples/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">体检编号：</label>
			<div class="controls">
				<form:input path="examinationCode" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样本编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否初检：</label>
			<div class="controls">
				<input type="radio" id="examinationFlag1" name="examinationFlag" value="1" checked/><label for="examinationFlag1">初检</label>
				<input type="radio" id="examinationFlag2" name="examinationFlag" value="2" /><label for="examinationFlag2">复检</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">采集项目：</label>
			<div class="controls">
				<select id="itemId" name="itemId" class="input-xlarge required">
					<c:forEach items="${itemList}" var="item">
						<shiro:hasPermission name="${item.permission}">
							<option value="${item.id}">${item.name}</option>
						</shiro:hasPermission>
					</c:forEach>
				</select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">体检用户：</label>
			<div class="controls">
				<form:hidden path="userId"/>
				<input id="userName" name="userName" readonly class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
				<input id="sex" name="sex" readonly class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">单位：</label>
			<div class="controls">
				<input id="organ" name="organ" readonly class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationSamples:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>