 <%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检记录管理</title>
	<meta name="decorator" content="default"/>
    <script src="${ctxStatic}/websocket/reconnecting-websocket.js" type="text/javascript"></script>
    <script src="${ctxStatic}/websocket/web_socket.js" type="text/javascript"></script>

	<script type="text/javascript">

		$(function() {

            initWebsocket();

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


             $('#showIdNumber').autocompleter({

                highlightMatches: true,
                template: '{{ label }}',
                hint: false,
                cache:false, focusOpen:true,
                empty: false,
                limit: 10,
                source:"${ctx}/wshbj/examinationUser/ajax_for_autocompleter",
                callback: function (value, index, selected) {
                    var u=selected;
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

			$("#postName").autocompleter({
                highlightMatches: true,
                template: '{{ label }}',
                hint: false, focusOpen:true,
                cache:false,
                empty: false,
                limit: 10,
                source:"${ctx}/wshbj/jobPost/ajax_for_autocompleter",
                callback: function (value, index, selected) {
                    var o=selected;
                    $('#postId').val(o.id);
                    $('#postName').val(o.name);
                }
            });

            // 身份证输入文本框失去焦点的时候
             $('#showIdNumber').blur(function(){
                 ispay();
                 loadUserByIdNumber();
             });
            setTimeout("lodop_check()",300);
        });

        function getFixExamCode(idObj){
            $("#msg").hide();
            var url="${ctx}/wshbj/examinationUser/ajax_get_by_prefixExamCode";
            var d1={industryId: $("#industryId").val() };

            $.get(url,d1,function(d1r) {
                $("#defaultHealth").val("");
                $("#defaultHealth").val(d1r.data.defaultHealth);
                 $("#prefixExamCode").val('');
                  if (d1r.data.prefixExamCode !='') {
                      $("#prefixExamCode").val(d1r.data.prefixExamCode);
                 }else {
                      $("#prefixExamCode").val('');
                  }
            });
        }
        function ispay() {
            var url="${ctx}/wshbj/userPay/ispay";
            var d1={idNumber: $("#showIdNumber").val() };
            $.get(url,d1,function(d1r){
                if(d1r=="true"){
                      $("#packagePrice").val("已付款");
                }else{
                    $("#packagePrice").val("0");
                }
            }).error(function(xhr){
            });

        }
        function loadUserByIdNumber(idObj){
            $("#msg").hide();

            $("#idNumber").val($("#showIdNumber").val());

            if($("#showIdNumber").val() =='' ||$("#showIdNumber").val() .length<15){
                return;
            }

            var url="${ctx}/wshbj/examinationUser/ajax_get_by_idnumber";
            var d1={idNumber: $("#showIdNumber").val() };

            $.get(url,d1,function(d1r){
                if(d1r.state==1){
                    setUserPro(d1r.data);
                    $("#idNumberInfo").show().html("系统内的体检用户。");
                }else if(d1r.state==2){
                    $("#code").val(d1r.data);
                    setUserPro({});
                    if(idObj!=null){
                        loadIdObject(idObj);
                    }else{
                        parseIdNumber();
                    }
                    $("#idNumberInfo").show().html("新用户，将创建新的体检用户。");
                }
            }).error(function(xhr){
                 $("#msg").show().html(xhr.responseText.replace(/\n/g,"<br>"));
            });
         }

        // 从身份证号码中读取部分信息
        function parseIdNumber(){
            var idNumber=$("#showIdNumber").val();

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

        // 从身份证读卡器中获取信息
        function loadIdObject(idObj){
            $("#name").val(idObj.Name);
            $("#showIidNumber").val(idObj.Code);
            $("#idNumber").val(idObj.Code);
            $("#idNumberPicHead").val(idObj.p4base64);
            $("#idNumberPicFore").val(idObj.p1base64);
            $("#idNumberPicBack").val(idObj.p2base64);

            // 头像默认采用身份证头像
            if($("#upheadImg").val()==''||bIdNumberChanged){
                $("#upheadImg").val(idObj.p4base64);
                $("#headImgImg").attr("src",idObj.p4base64);
            }

            var srcBirthday=idObj.BirthDay;
            var birthday=srcBirthday.substr(0,4)+"-"+srcBirthday.substr(4,2)+"-"+srcBirthday.substr(6,2);
            $("#birthday").val(birthday);

            var age=getAgeFromId(idObj.Code);
            $("#age").val(age);

            if(idObj.Gender=='男'){
                $("#sex1").attr("checked",true);
            }else if(idObj.Gender=='女'){
                $("#sex2").attr("checked",true);
            }
        }



        // 设置用户的属性property
        function setUserPro(u) {
            if(u.id==null&&$("#userId").val()==''){
                return;
            }

            $("#userId").val(u.id);
            $("#name").val(u.name);
            $("#idNumber").val(u.idNumber);
            $("#birthday").val(u.birthday);
            $("#phoneNumber").val(u.phoneNumber);
            $("#postName").val(u.postName);
            $("#remarks").val(u.remarks);
            $("#code").val(u.code);
            $("#packagePrice").val('0');




            if(u.age!=null&&u.age!=''){
                $("#age").val(u.age);
            }else{
                $("#age").val(getAgeFromId(u.idNumber));
            }
            if(u.sex=='1'){
                $("#sex1").attr("checked",true);
            }
            if(u.sex=='2'){
                $("#sex2").attr("checked",true);
            }

            if(u.organId!=null&&u.organId!=''){
                $("#organId").val(u.organId);
                $("#organName").val(u.organName);
            }

             if(u.industryId!=null&&u.industryId!=''){
                $("#industryId").attr("value", u.industryId);
                $("#industryId").trigger('change');
             }

             if(u.postId!=null&&u.postId!=''){
                $("#postId").attr("value", u.postId);
                $("#postId").trigger('change');
             }

            $("#headImgImg").attr("src","${ctx}/wshbj/examinationUser/getHeadImg?id="+u.id);
            refreshItemsPrice();
        }

        // 行业更新后，设置行业默认套餐
        function chgIndustry(){
            var industryId=$('#industryId').val();

            var url='${ctx}/wshbj/industry/ajax_get_by_id';
            var d1={id:industryId};
            $.get(url,d1,function(d1r){
                var pid=d1r.defaultPackageId;
                var pchkbox=$("#packageId_"+pid);
                if(pchkbox!=null){
                    pchkbox.prop('checked',true);
                    var money=$("#packageId_"+pid).attr("data-money");
                    chkPackage(pid,money);
                 }
            });

            getFixExamCode();
        }

        // 选中某个体检套餐，更新总费用
        function chkPackage(packageId,money) {
            var itemIds=$("#packageId_"+packageId).attr("data-itemIds");

            if(itemIds == undefined ){
                return;
            }
            // 1 显示套餐必选项目
            $("label[id^='lbl_tcri']").each(function(){
                var lblId=$(this).attr('id');
                // 获得对应checkbox
                var chk=$('#tcri'+lblId.substring(8));

                // 获得要搜索的itemId，最后带 逗号
                var titemId=lblId.substring(8)+",";
                if(itemIds.indexOf(titemId)>=0){
                    $(this).css('display','');
                    chk.attr('checked','checked');
                }else{
                     $(this).css('display','none');
                     chk.removeAttr('checked');
                }
            })

            // 2 隐藏自由选择项目中 的必选项目
            $("label[id^='lbl_bcri']").each(function(){
                var lblId=$(this).attr('id');
                // 获得对应checkbox
                var chk=$('#bcri'+lblId.substring(8));

                // 获得要搜索的itemId，最后带 逗号
                var titemId=lblId.substring(8)+",";
                if(itemIds.indexOf(titemId)<0){
                    $(this).css('display','');
                }else{
                     $(this).css('display','none');
                     chk.removeAttr('checked');
                }
            })

            // 刷新体检费用
            refreshItemsPrice(packageId);
        }

        // 当勾选体检项目的时候，刷新体检项目总费用
        function refreshItemsPrice(packageId){
             var aprice=0;
            var itemIds= $("#packageId_"+packageId).attr("data-itemIds");
             var money=0;

            $("input[type='checkbox'][id^=tcri]:checked,input[type='checkbox'][id^=bcri]:checked").each(function(i){
                  //情况1：如果选择了套餐
                   if(itemIds!=null&&itemIds!=''){
                      //获得这个套餐的价钱
                      money= $("input[type='radio'][id^=packageId_]:checked").attr("data-money");
                      var examinationItem=$(this).attr("value");
                      var packageIds= new Array();
                      packageIds=itemIds.split(",");
                      //循环找出套餐是否包括所选的体检项目 使用优惠后的价钱
                      for (i=0;i<packageIds.length ;i++ ){
                          //如果套餐里包含该体检项目 就不增加额外的费用
                          if(examinationItem==packageIds[i]){
                                 return;
                             }
                     }
                     //如果还要选择套餐这之外的体检项目 使用套餐的价钱 加上套餐之外的项目的钱
                        var price=$(this).attr("data-price");
                        aprice+= parseFloat(price);
                 }else {
                    //情况2 ：没选择套餐 把选择的体检项目的钱相加
                     var  price=$(this).attr("data-price");
                      aprice+= parseFloat(price);
                 }
            })

            aprice+= parseFloat(money);
            var ispay = $("#packagePrice").val();
             if(ispay!='已付款'){
                $("#packagePrice").val(aprice);
            }


        }

        // ajax form方式提交保存
        function do_sumbit(status){

             $("#msg").hide().html('');
            $("#inputForm").ajaxSubmit(function(d1r){
                if(d1r == null||d1r.state==null){
                     $("#msg").show();
                     $("#msg").html('由于未知原因，提交失败\n'+d1r);
                    return;
                }
                if(d1r.state != 1){
                    $("#msg").show();
                    $("#msg").html(d1r.msg);
                    return;
                }
                var id=d1r.data.id;
                $("#msg").show();
                $("#msg").html(d1r.msg);
                if(status.indexOf('print')>=0){
                    var defaultHealth=  $("#defaultHealth").val();
                     lodop_printA4('流程表','${ctxhttp}/wshbj/exam_record_print/tjb'+defaultHealth+'_html?id='+id);
                     lodop_sampleCode(id)
                }
                // 清除必要的字段，继续添加新登记。
                setUserPro({});
                $("#showIdNumber").val('');
                $("#userId").val('');
                $("#name").val('');
                $("#idNumber").val('');
                $("#birthday").val('');
                $("#phoneNumber").val('');
                $("#postName").val('');
                $("#remarks").val('');
                $("#code").val('');
                $("input:radio,input:checkbox").attr("checked",false);
                chkPackage('no','');

                if(status.indexOf('return')>=0){
                    setTimeout("location.href='${ctx}/wshbj/examinationRecord/list'",1000);
                 }
            });
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

                $("#showIdNumber").val(jmsg.Code);
                loadUserByIdNumber(jmsg);
            }
         }

        function lodop_sampleCode(id) {
            var code= $("#recordId").val();
             $.ajax({
                url:'${ctx}/wshbj/examinationRecordItem/ajax_examinationRecordItem?recordId='+id+'&code='+code,
                type:'post',
                success(result){
                    var vendorJson = eval(result);
                     if(vendorJson==undefined){
                        alert("未找到符合编号的样本号");
                        return false;
                    }
                    for(var i=0; i<vendorJson.length; i++){
                        if(vendorJson[i].sampleCode!=undefined){
                            lodop_printBarcode('样本编号','${ctxhttp}/wshbj/exam_record_print/barcode_html?barcode='+vendorJson[i].sampleCode);
                        }
                    }

                }
            });
        }



	</script>
</head>
<body>

	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/form?id=${examinationRecord.id}">体检记录<shiro:hasPermission name="wshbj:examinationRecord:edit">${not empty examinationRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationRecord:edit">查看</shiro:lacksPermission></a></li>
        <li><a href="${ctx}/wshbj/examinationRecord/list">体检记录列表</a></li>
        <li><a href="${ctx}/wshbj/examinationRecord/list_print">可制证体检记录</a></li>
        <li ><a href="${ctx}/wshbj/examinationRecord/list_nopass">不合格体检记录</a></li>
	</ul><br/>

    <div class="box1">
    <div id="lodop_check" class="alert alert-danger" style="display:none" >
        1 您可能还未安装Lodop打印驱动，请<a href="${ctxStatic}/lodop/CLodop_Setup_for_Win32NT.exe" target="_blank">下载</a>并安装Lodop。<br>
        2 您如果已经安装Lodop打印驱动，但没有启动服务。请运行 <span style="color:#000;"> 开始 > 所有程序 > C-Lodop(HTM-WEB-PRINT)32bit > C-Lodop Setup</span> ，并启动CLodop服务。
    </div>
    <div id="dlalert" class="alert alert-warning">
      <strong>重要提示，身份证读取服务插件安装说明：</strong> <br>
      1. 身份证读取需要安装读取服务。 首先<a href="${ctxStatic}/idr200svr1.zip">下载身份证读取程序zip压缩包</a>，然后解压缩到本地计算机任意位置，然后运行 install.bat 命令完成服务注册。<br>
      2. 身份证读取必须安装 <a href="http://rj.baidu.com/soft/detail/23411.html?ald">微软 Microsoft .NET Framework 3.5</a>，如遇到身份证读取失败的问题，请自行下载安装.NET Framework 3.5

    </div>

    <div id="msg" class="alert alert-danger" style="display:none" ></div>


	<div  style="max-width:1200px" >
        <form:form id="inputForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/ajax_save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
            <input type="hidden" id="defaultHealth" name="defaultHealth" >
        <input type="hidden" id="userId" name="user.id" value="${examinationRecord.user.id}" >
        <input type="hidden" id="idNumber" name="idNumber" value="${examinationRecord.idNumber}" >
        <form:hidden path="idNumberPicHead"/><form:hidden path="idNumberPicFore"/><form:hidden path="idNumberPicBack"/>
     <div>




        <div class="control-group">
            <label class="control-label"><font color="red">*</font>  用户头像：</label>
            <div class="controls">
                 <sys:cropper mainImgWidth="180"  mainImgHeight="240" imgName="真人照片" path="headImg"
                              value="${ctx}/wshbj/examinationRecord/getHeadImg?id=${examinationRecord.id}"
                 errImg="${ctxStatic}/images/nopic.jpg"/>
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" style="font-weight:bold"><font color="red">*</font>  身份证号：</label>
            <div class="controls">
                <div class="autocompleter-box"> <input type="text" id="showIdNumber" name="showIdNumber" value="${examinationRecord.idNumber}" maxlength="20" class="input-medium required"/>
                <span id="idNumberInfo" class="help-inline">通过身份证获取用户信息</span>
                </div>
            </div>
        </div>

        <div class="control-group">
            <label class="control-label"><font color="red">*</font> 真实姓名：</label>
            <div class="controls">
                <form:input path="name" htmlEscape="false" maxlength="32" class="input-medium  required"/>
            </div>
        </div>
		<div class="control-group">
			<label class="control-label"><font color="red">*</font> 联系电话：</label>
			<div class="controls">
				<form:input path="phoneNumber" htmlEscape="false" maxlength="45" class="input-medium  required"/>
                <font color="red">*</font> 性别：
                     <form:radiobuttons path="sex" items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>

		</div>

		<div class="control-group">

		</div>

		<div class="control-group">
            <label class="control-label"><font color="red">*</font> 年龄：</label>
            <div class="controls">
                <input type="number" id="age" name="age"  value="${examinationRecord.age}" class="input-medium required">
            </div>
        </div>


		<div class="control-group">
            <label class="control-label"><font color="red">*</font> 出生日期：</label>
            <div class="controls">
                <input type="text" id="birthday" name="birthday"  value="${examinationRecord.birthday}"  readonly="true"
                 class="input-medium Wdate required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">
                &nbsp;&nbsp;备注：
                     <form:input id="remarks" path="remarks" htmlEscape="false" maxlength="255" cssStyle="width:350px"/>
             </div>
        </div>
        <div class="control-group">
            <label class="control-label">
             <a href="${ctx}/wshbj/organ/form" target="_blank"><img style="width:16px" src="${ctxStatic}/images/icons/plus_alt.png"></a>
             体检单位：</label>
            <div class="controls">
                <div class="autocompleter-box">
                    <input type="hidden" id="organId" name="organId" value="${examinationRecord.organId}" >
                    <input type="text" id="organName" name="organName" value="${examinationRecord.organName}" class="input-medium required">
                    <span class="help-inline"> </span>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">
            <a href="${ctx}/wshbj/jobPost/form" target="_blank"><img style="width:16px" src="${ctxStatic}/images/icons/plus_alt.png"></a>
                岗位：</label>
            <div class="controls">
                <div class="autocompleter-box">
                    <input type="hidden" id="postId" name="postId" value="${examinationRecord.postId}" >
                    <input type="text" id="postName" name="postName" value="${examinationRecord.postName}" class="input-medium required">
                    <span class="help-inline"> </span>
                </div>
            </div>

        </div>



	<div class="control-group">
		 <a href="${ctx}/wshbj/industry/form" target="_blank"><img style="width:16px" src="${ctxStatic}/images/icons/plus_alt.png"></a> 行业：
				<form:select path="industryId"   onchange="chgIndustry()" class="input-medium">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${industryList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"> </span>
	</div>



        <div class="control-group">
            <label class="control-label">编号：</label>
            <div class="controls">
<%--
                <input type="text"  id="prefixExamCode" name="prefixExamCode"   class="input-medium required">
--%>
                <input type="text" readonly  style="padding-left: 0px; margin-left: 0px" id="code" name="code"  value="${examinationRecord.code}" class="input-medium required">
            </div>
        </div>
		<div class="cl"></div>

		<div class="control-group" id="packageIdDiv">
			<label class="control-label">体检套餐：</label>
			<div class="controls">
                <label for="packageId_no">
                    <input type="radio" id="packageId_no" name="packageId" value="" onclick="chkPackage('no','')" data-itemIds=''
                   <c:if test="${examinationRecord.packageId == null || examinationRecord.packageId ==''}">checked='checked'</c:if> />
                                自由选择体检项目</label>
                <c:forEach items="${packageList}" var="p">
                <label for="packageId_${p.id}"> <input type="radio" id="packageId_${p.id}" name="packageId" value="${p.id}" data-itemIds="${p.itemIds}" data-money="${p.price}"
                 onclick="chkPackage('${p.id}',${p.price})" <c:if test="${p.id == examinationRecord.packageId}">checked='checked'</c:if> />
                ${p.name}</label>
                </c:forEach>

			</div>
		</div>
		<div class="cl"></div>
		<div class="control-group" id="itemsDiv1" style="display:none" >
            <label class="control-label">必选项目：</label>
            <div class="controls radios-box">
                <c:forEach items="${examinationItemList}" var="ri" varStatus="s">
               <label id="lbl_tcri${ri.id}" for="tcri${ri.id}" style="display:none;">
               <input id="tcri${ri.id}" name="examinationRecordItemList[${s.index}].itemId" value="${ri.id}" type="checkbox" data-price="${ri.price}" onclick="return false;">
                 ${ri.name} </label>
                </c:forEach>
            </div>
        </div>
        <div class="cl"></div>
		<div class="control-group" id="itemsDiv" >
			<label class="control-label">自由选择项目：</label>
			<div class="controls radios-box">
			    <c:if test="${not empty examinationItemList  }">
			    <c:forEach items="${examinationItemList}" var="ri" varStatus="s">

				<label id="lbl_bcri${ri.id}" for="bcri${ri.id}">
                    <input id="bcri${ri.id}" name="examinationRecordItemList[${s.index}].itemId" value="${ri.id}" type="checkbox" data-price="${ri.price}" onclick="refreshItemsPrice('')"
				<c:if test="${examinationRecord.itemIds !=null and fn:contains(examinationRecord.itemIds,ri.id)}">checked='checked'</c:if> >
				${ri.name} </label>
				</c:forEach>
				</c:if>
			</div>
		</div>
		<div class="cl"></div>
		<div class="control-group">
            <label class="control-label">合计价：</label>
            <div class="controls">
                <form:input path="packagePrice" id="packagePrice"   htmlEscape="false" maxlength="64" class="input-medium " readonly="true"/>
            </div>


        </div>


			<shiro:hasPermission name="wshbj:examinationRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="button" value="保存并打印" onclick="do_sumbit('print')" />&nbsp;</shiro:hasPermission>
            <shiro:hasPermission name="wshbj:examinationRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="button" value="保存并返回" onclick="do_sumbit('return')" />&nbsp;</shiro:hasPermission>

        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>

        <div class="cl"></div>
        <div class="control-group">
            <label class="control-label">体检编号：</label>
            <div class="controls">
                <input type="text" id="recordId" name="recordId"  value="${examinationRecord.code}"  class="input-medium required">
            </div>

        </div>
        <p>
            <shiro:hasPermission name="wshbj:examinationRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="button" value="打印样本编号" onclick="lodop_sampleCode('')" />&nbsp;</shiro:hasPermission>
        </p>

 <div class="cl"></div>
</div>
	</form:form>
	</div>
<%--
<div class="help-div">
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
</div>
--%>

</div>



</body>
</html>