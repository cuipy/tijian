<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检用户管理</title>
	<meta name="decorator" content="default"/>

    <script src="${ctxStatic}/websocket/reconnecting-websocket.js" type="text/javascript"></script>
    <script src="${ctxStatic}/websocket/web_socket.js" type="text/javascript"></script>
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

			$("#idNumber").on('blur',refreshBirthday);
			$("#idNumber").on('change',refreshBirthday);

			initWebsocket();

		});

		function refreshBirthday(){
		    var idNumber=$("#idNumber").val();
		    var dt=getDateFromId(idNumber);
		    $("#birthday").val(dt);
		}

		 WEB_SOCKET_SWF_LOCATION = "${ctxStatic}/websocket/WebSocketMain.swf";
        function initWebsocket(){
            // 初始化身份证读取的websocket，身份证读取插件的websocket 端口为 8202
            var ws1 = new ReconnectingWebSocket("ws://127.0.0.1:8202/jsclient");
            ws1.onopen=function(evt){$('#dlalert').hide();}
            ws1.onmessage=function(evt){
                var msg = evt.data;
                var jmsg = JSON.parse(msg);

                $("#name").val(jmsg.Name);
                $("#idNumber").val(jmsg.Code);

                refreshBirthday();

                if(jmsg.Sex=='男'){
                    $("#sex option[value='1']").attr("selected",true);
                }else{
                    $("#sex option[value='2']").attr("selected",true);
                }
            }
         }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/examinationUser/">体检用户列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationUser/form?id=${examinationUser.id}">体检用户<shiro:hasPermission name="wshbj:examinationUser:edit">${not empty examinationUser.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationUser:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>

	<div id="dlalert" class="alert alert-warning">
          <strong>重要提示，身份证读取服务插件安装说明：</strong> <br>
          1. 身份证读取需要安装读取服务。 首先<a href="${ctxStatic}/idr200svr1.zip">下载身份证读取程序zip压缩包</a>，然后解压缩到本地计算机任意位置，然后运行 install.bat 命令完成服务注册。<br>
          2. 身份证读取必须安装 <a href="http://rj.baidu.com/soft/detail/23411.html?ald">微软 Microsoft .NET Framework 3.5</a>，如遇到身份证读取失败的问题，请自行下载安装.NET Framework 3.5

        </div>

	<div class="">
	<form:form id="inputForm" modelAttribute="examinationUser" action="${ctx}/wshbj/examinationUser/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>

		<div class="control-group span6">
            <label class="control-label">真人照片采集：</label>
            <div class="controls">
                <sys:cropper mainImgWidth="220" imgName="真人照片" path="headImgPath" value="${examinationUser.headImgPath}"/>
            </div>
        </div>

		<div class="control-group span6">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">身份证号：</label>
			<div class="controls">
				<form:input path="idNumber" htmlEscape="false" maxlength="20" class="input-medium required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="phoneNumber" htmlEscape="false" maxlength="45" class="input-medium required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">出生日期：</label>
			<div class="controls">
				<form:input path="birthday" htmlEscape="false" maxlength="45" autocomplete="true" readonly="true" class="input-medium Wdate required"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label"><font color="red">*</font> 性别：</label>
			<div class="controls">
				<form:select path="sex" cssStyle="width: 100px">
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"> </span>
			</div>
		</div>

		<div class="control-group span6">
			<label class="control-label">行业：</label>
			<div class="controls">
				<form:select path="industryId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${industryList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">  <a href="${ctx}/wshbj/industry/form" target="_blank">新增行业</a> </span>
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">体检单位：</label>
			<div class="controls">
				<form:select path="organId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${organList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"> <a href="${ctx}/wshbj/organ/form" target="_blank">新增单位</a> </span>
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">岗位：</label>
			<div class="controls">
				<form:select path="postId" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${postList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">  <a href="${ctx}/wshbj/jobPost/form" target="_blank">新增岗位</a> </span>
			</div>
		</div>


		<div class="control-group span6">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="cl"></div>
		<div class="form-actions span12">
			<shiro:hasPermission name="wshbj:examinationUser:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

    <div class="cl"></div>
	</div>

    <div class="help-div">

    <div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 体检用户是体检人管理，由前台操作录入<br>
      2. 体检用户身份证是唯一标记，不可重复。<br>

    </div>

   <div class="alert alert-danger">
      <strong>重要提示，需要完成的准备工作：</strong> <br>
      1. 体检单位、行业、岗位，需要先录入系统<br>
      2. 身份证号码不允许重复。<br>
    </div>
    </div>
</body>
</html>