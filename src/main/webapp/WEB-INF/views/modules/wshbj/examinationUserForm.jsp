<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检用户管理</title>
	<meta name="decorator" content="default"/>
    <style type="text/css">
    .radios-sex>span{min-width:70px;}
    </style>
    <script src="${ctxStatic}/websocket/reconnecting-websocket.js" type="text/javascript"></script>
    <script src="${ctxStatic}/websocket/web_socket.js" type="text/javascript"></script>
	<script type="text/javascript">

	    /**
	    1 读身份证，直接通过身份证阅读器实现；
	    2 身份证读卡器，可以读到身份证号、姓名、性别、年龄；头像图片、正反面图片，存了，但没显示。
	    3 身份证的其他信息目前没有保留，例如发证日期、到期时间、民族、地址等；
	    4 直接输入身份证号，首先通过autocompleter 验证身份证号是否在 examinationUser 中存在，如果存在，则读出；如果不存在，则是创建新用户；
	    5 手动输入身份证，离开身份证文本框的时候，会解析身份证号，得到生日、性别、年龄；
	    6 头像可以通过2种方式获得；一 本地图片文件；二 摄像头取像；
	    7 摄像头取像可以通过webRTC 和  Flash两种方式，问题是： webRTC必须是HTTPS协议；而Flash方式总提问是否允许使用摄像头；
	    8 行业、岗位、单位、体检日期、套餐、体检项目，等数据，都保存在LocalStorage中。
	    9 默认打印机存储在LocalStorage中


	    **/

		$(function() {
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

			$("#organName").autocompleter({
			    highlightMatches: true,
                template: '{{ label }}',
                hint: false, focusOpen:true,
                cache:false,
                empty: false,
                limit: 10,
                source:"${ctx}/wshbj/organ/ajax_for_autocompleter",
                callback: function (value, index, selected) {
                    var o=selected;
                    $('#organId').val(o.id);
                    $('#organName').val(o.name);
                }
			});

			$("#idNumber").on('blur',parseIdNumber);
			$("#idNumber").on('change',parseIdNumber);

			initWebsocket();

		});

		function parseIdNumber(){
		    var idNumber=$("#idNumber").val();

		    // 生日
		    var dt=getDateFromId(idNumber);
		    $("#birthday").val(dt);
		    $("#age").val(getAgeFromId(idNumber));
		    var strSex=getSexFromId(idNumber);

		    if(strSex=='男'){
		        $("#sex1").attr('checked',true);
		    }else if(strSex=='女'){
		        $("#sex2").attr('checked',true);
		    }

		}

		 WEB_SOCKET_SWF_LOCATION = "${ctxStatic}/websocket/WebSocketMain.swf";
        function initWebsocket(){
            // 初始化身份证读取的websocket，身份证读取插件的websocket 端口为 8202
            var ws1 = new ReconnectingWebSocket("ws://127.0.0.1:8202/jsclient");
            ws1.onopen=function(evt){$('#dlalert').hide();}
            ws1.onmessage=function(evt){
                var msg = evt.data;
                var jmsg = JSON.parse(msg);

                // 判断是否扫描的是新的身份证
                var bIdNumberChanged=false;
                if($("#idNumber").val()!=''&&$("#idNumber").val()!=jmsg.Code){
                    bIdNumberChanged=true;
                }

                $("#name").val(jmsg.Name);
                $("#idNumber").val(jmsg.Code);
                $("#idNumberPicHead").val(jmsg.p4base64);
                $("#idNumberPicFore").val(jmsg.p1base64);
                $("#idNumberPicBack").val(jmsg.p2base64);

                // 头像默认采用身份证头像
                if($("#upheadImgPath").val()==''||bIdNumberChanged){
                    $("#upheadImgPath").val(jmsg.p4base64);
                    $("#headImgPathImg").attr("src",jmsg.p4base64);
                }

                var srcBirthday=jmsg.BirthDay;
                var birthday=srcBirthday.substr(0,4)+"-"+srcBirthday.substr(4,2)+"-"+srcBirthday.substr(6,2);
                $("#birthday").val(birthday);

                var age=getAgeFromId(jmsg.Code);
                $("#age").val(age);

                if(jmsg.Gender=='男'){
                    $("#sex1").attr("checked",true);
                }else if(jmsg.Gender=='女'){
                    $("#sex2").attr("checked",true);
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

	<div style="max-width:1200px;">
	<form:form id="inputForm" modelAttribute="examinationUser" action="${ctx}/wshbj/examinationUser/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>

		<form:hidden path="idNumberPicHead"/><form:hidden path="idNumberPicFore"/><form:hidden path="idNumberPicBack"/>

		<div class="control-group span6">
            <label class="control-label">真人照片采集：</label>
            <div class="controls">
                <sys:cropper mainImgWidth="320"  mainImgHeight="240" imgName="真人照片" path="headImgPath" value="${ctx}/wshbj/examinationUser/getHeadImg?id=${examinationUser.id}"/>
            </div>
        </div>

		<div class="control-group span4">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group span4">
            <label class="control-label">姓名全拼：</label>
            <div class="controls">
                <form:input path="namePinyin" htmlEscape="false" maxlength="128" class="input-medium"/>
            </div>
        </div>

		<div class="control-group span4">
			<label class="control-label">身份证号：</label>
			<div class="controls">
				<form:input path="idNumber" htmlEscape="false" maxlength="20" class="input-medium required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group span4">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="phoneNumber" htmlEscape="false" maxlength="45" class="input-medium required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>

		<div class="control-group span4">
			<label class="control-label">出生日期：</label>
			<div class="controls">
				<form:input path="birthday" htmlEscape="false" maxlength="45" autocomplete="true" readonly="true" class="input-medium Wdate required"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group span4">
			<label class="control-label"><font color="red">*</font> 性别：</label>
			<div class="controls radios-div radios-sex">
				<form:radiobuttons path="sex" items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</div>
		</div>

		<div class="control-group span4">
            <label class="control-label"><font color="red">*</font> 年龄：</label>
            <div class="controls radios-div radios-sex">
                <form:input path="age" type="number" htmlEscape="false" class="input-medium required"/>
            </div>
        </div>

<div class="cl"></div>
<div class="control-group span4">
    <label class="control-label">体检单位：</label>
    <div class="controls">
        <div class="autocompleter-box"><input type="hidden" id="organId" name="organId" value="${examinationRecord.organId}" >
                    <input type="text" id="organName" name="organName" value="${examinationRecord.organName}" class="input-medium required">
        <span class="help-inline"> <a href="${ctx}/wshbj/organ/form" target="_blank">新增单位</a> </span>
        </div>
    </div>
</div>

		<div class="control-group span4">
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

		<div class="control-group span4">
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

        <div class="cl"></div>
		<div class="control-group span12">
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