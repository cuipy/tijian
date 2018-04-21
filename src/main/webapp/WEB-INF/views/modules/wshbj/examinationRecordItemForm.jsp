<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检样本管理</title>
	<meta name="decorator" content="default"/>

	<script type="text/javascript">
	    var lastSampleCode='';

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



            // 样本编号文本框失去焦点事件
            $('#sampleCode').on('blur',inputCode);
            $('#sampleCode').on('keypress',enterCode);



		});

        // 在样本编号文本框操作键盘的事件
        function enterCode(evt){
            if(evt.keyCode==13){
                inputCode();
                $("input[name='itemId']").focus();
            }
        }

        // 样本编号输入后的操作
        function inputCode(){
            // 当前体检类型
            var specimenId = $("input[name='itemId']:checked").attr('data-specimen_id');

            var sampleCode= $("#sampleCode").val();

            if(sampleCode==null||sampleCode==''||sampleCode==lastSampleCode){
                return;
            }

            $("#btnSubmit").addClass("disabled");
            var url="${ctx}/wshbj/examinationRecordItem/ajax_check_sample_code";
            var d1={sampleCode:sampleCode,specimenId:specimenId,v:new Date().getTime()};
            $.get(url,d1,function(d1r){
                if(d1r.state==null){
                     $("#msg").html("<pre>"+d1r.responseText+"</pre>").show();
                    return;
                }
                if(d1r.state==1 ){
                    lastSampleCode=sampleCode;
                    showTip("编号正确，允许使用");
                    $("#btnSubmit").removeClass("disabled");
                    return;

                }
                showTip(d1r.msg,"error");
                $("#msg").html(d1r.msg).show();

                lastSampleCode='';
                $("#sampleCode").val('');
            });
        }

		function submitForm() {
            $("#msg").html("").hide();

            var url = '${ctx}/wshbj/examinationRecordItem/saveSamples';
            $.ajax({
                url: url,
                type: "POST",
                data: $("#inputForm").serialize(),//核心代码，form表单序列化
                dataType: "JSON",
                success: function(data) {
                    if(data.sampleCode!='0'){
                        showTip(data.msg,'error');
                    }else{
                        showTip('采样成功','success');
                        setTimeout(function () {
                            location.href = '${ctx}/wshbj/examinationRecordItem/list_need_sample';
                        },2000)
                    }
                },
                error:function(err){
                    $("#msg").html("<pre>"+err.responseText+"</pre>").show();
                }
            });
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active">
		<shiro:hasPermission name="wshbj:examinationRecordItem:edit">
		    <a href="${ctx}/wshbj/examinationSamples/form?id=${examinationSamples.id}">体检样本${not empty examinationSamples.id?'修改':'采集'}</a></shiro:hasPermission>
		</li>
		<li><a href="${ctx}/wshbj/examinationRecordItem/list_need_sample">体检样本列表</a></li>
	</ul><br/>
    <div id="msg" class="alert alert-danger" style="display:none" ></div>
	<div class="row">
	<form:form id="inputForm" modelAttribute="examinationRecordItem" action="${ctx}/wshbj/examinationSamples/save" method="post" class="form-horizontal">
		<form:hidden path="recordId"/>
		<sys:message content="${message}"/>

		<div class="row">
		<div class="control-group span12">
			<label class="control-label"><font color="red">*</font>体检编号：</label>
			<div class="controls">
				<form:hidden path="id"/>
				<div class="autocompleter-box"><form:input path="examinationCode" htmlEscape="false" maxlength="50" class="input-large"/></div>
				<span class="help-inline"> 信息登记时的编号，推荐采用条码扫描枪录入。 </span>
			</div>
		</div>
        <div class="cl"></div>

		<div class="control-group span12">
            <label class="control-label"><font color="red">*</font>样本编号：</label>
            <div class="controls">
                <input type="text" id="sampleCode" name="sampleCode" value="${examinationRecordItem.sampleCode}" maxlength="50" class="input-large required"
                 <c:if test="${empty examinationRecordItem.examinationCode }">readonly="true" </c:if> />
                <span class="help-inline"> 采样人员领取的样本编号条码贴。选中采集项目后，才可以录入样本编号。 </span>
            </div>
        </div>

		<div class="cl"></div>

		<div class="control-group span12">
			<label class="control-label"> <font color="red">*</font> 采集项目：</label>
			<div class="controls" id="box_items">
			    <input type="radio" name="itemId" value="${examinationRecordItem.itemId}" data-specimen_id="${examinationRecordItem.specimenId}" checked="checked">
			    ${examinationRecordItem.itemName}   ${examinationRecordItem.strExaminationFlag}  ${examinationRecordItem.strStatus}
                <span class="help-inline"> 录入正确的体检编号后，自动加载采集项目。 </span>
			</div>
		</div>
        <div class="cl"></div>

		<div class="control-group span6">
			<label class="control-label">体检用户：</label>
			<div class="controls">
				<form:hidden path="recordUserId"/>
				<input type="text" id="userName" name="userName" value="${examinationRecordItem.recordUserName}" readonly class="input-large "/>

			</div>
		</div>
		<div class="control-group  span6">
			<label class="control-label">性别：</label>
			<div class="controls">
				<input type="text" id="sex" name="sex" value="${examinationRecordItem.recordUserStrSex}"  readonly class="input-large "/>
			</div>
		</div>

		<div class="control-group span12">
			<label class="control-label">单位：</label>
			<div class="controls">
				<input type="text" id="organ" name="organ" value="${examinationRecordItem.recordOrganName}"  readonly class="input-large"/>
			</div>
		</div>
		<div class="control-group span12">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions  span12">
			<shiro:hasPermission name="wshbj:examinationRecordItem:edit">
			<input id="btnSubmit" class="btn btn-primary disabled" type="button" value="保 存" onclick="submitForm();" />&nbsp;</shiro:hasPermission>
            <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		</div>

	</form:form>
	</div>

    <div class="alert alert-success">
      <strong>帮助：</strong> <br>
      1. 样本采集是在信息登记成功后，体检用户在各体检部门进行体检，进行样本采集。<br>
      2. 样本采用在第一阶段只包括：血样和尿样<br>
      3. 样本采集要基于<br>
      4. 本功能的目的是定义哪些角色可以操作哪些检查项目，比如一个医生拥有了“抽血”的项目，他就可以在系统中看到抽血相关的操作了。

    </div>

    <div class="alert">
      <strong>操作流程：</strong> <br>
      <img src="${ctxStatic}/images/docs/yangben_caiji_flow_1.png">

    </div>


</body>
</html>