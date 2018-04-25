<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>测试1管理</title>
	<meta name="decorator" content="default"/>

    <script src="${ctxStatic}/websocket/reconnecting-websocket.js" type="text/javascript"></script>
    <script src="${ctxStatic}/websocket/web_socket.js" type="text/javascript"></script>
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
			$("#btnPrint").click(function(){
                $("#inputForm").print({noPrintSelector:'.no-print',iframe:false});
            });

            initWebsocket();
		});

        function initWebsocket(){
            var ws1 = new ReconnectingWebSocket("ws://127.0.0.1:8202/jsclient");
            ws1.onmessage=function(evt){
                var msg = evt.data;
                var jmsg = JSON.parse(msg);

                $("#title").val(jmsg.Name);
                $("#userPwd").val(jmsg.Code);
                $("#headImg").attr('src',jmsg.p1base64);
            }
         }

	</script>



</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/test1/test1/">测试1列表</a></li>
		<li class="active"><a href="${ctx}/test1/test1/form?id=${test1.id}">测试1<shiro:hasPermission name="test1:test1:edit">${not empty test1.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="test1:test1:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="test1" action="${ctx}/test1/test1/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">身份证：</label>
			<div class="controls">
				<img id="headImg" width="300" >
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="128" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证号：</label>
			<div class="controls">
				<form:input type="text" path="userPwd" htmlEscape="false" maxlength="64" class="input-xlarge"/>
			</div>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="test1:test1:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<shiro:hasPermission name="test1:test1:view"><input id="btnPrint" class="btn btn-info" type="button" value="打 印"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>