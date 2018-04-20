<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检样本管理</title>
	<meta name="decorator" content="default"/>

	<script type="text/javascript">
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

            $('#examinationCode').on('blur',inputExaminationCode);

             $('#examinationCode').autocompleter({

                    highlightMatches: true,
                    template: '{{ code }} <span>({{ name }})</span>',
                    hint: false,
                    cache:false,
                    empty: false,
                    limit: 10,
                    source:"${ctx}/wshbj/examinationRecord/ajax_no_complete_for_autocompleter",
                    callback: function (value, index, selected) {

                    }
                });

		});

		// 设置记录id 用户id 等隐藏控件，设置性别、单位、姓名等现实数据。
		function setControl(data){
		    if(data==null){
		        $('#recordId').val('');
                $('#userId').val('');
                $('#userName').val('');
                $('#sex').val('');
                $('#organ').val('');

                return;
		    }
            $('#recordId').val(data.id);
            $('#userId').val(data.userId);
            $('#userName').val(data.name);
            $('#sex').val(data.strSex);
            $('#organ').val(data.organName);

            // 加载当前用户报名的体检项目
            var itemsHtml="";
            for(var i=0;i<data.items.length;i++){
                var item=data.items[i];
                if( item.needSamples != 1){
                    continue;
                }
                itemsHtml+="<input type='radio' name='itemId' id='itemId_"+item.itemId+"' value='"+item.itemId+"' data-flag='"+item.examinationFlag+"'><label for='itemId_"+item.itemId+"'>"+item.itemName+"&nbsp;";
                itemsHtml+= item.examinationFlag==1?"(初检)":"(复检)";
                itemsHtml+=" </label>&nbsp;&nbsp;";
            }
            $("#box_items").html(itemsHtml);
        }

        function inputExaminationCode(){
            var examinationCode = $('#examinationCode').val();

            if(!examinationCode||examinationCode.length<3){
                setControl('','','','','');
            }

            // ajax方式获取体检项目
            var url = '${ctx}/wshbj/examinationRecord/ajax_get_by_record_code';
            $.post(url,{'code':examinationCode},function (d1r) {
                if(!d1r){
                    showTip("由于未知原因，获取数据失败","error");
                }else if(d1r.state!=1){
                    showTip(d1r.msg,"error");
                }else{
                    setControl(d1r.data);
                }
            });
        }

		function submitForm() {
            var url = '${ctx}/wshbj/examinationSamples/saveSamples';
            $.ajax({
                url: url,
                type: "POST",
                data: $("#inputForm").serialize(),//核心代码，form表单序列化
                dataType: "JSON",
                success: function(data) {
                    if(data.code!='0'){
                        showTip(data.msg,'error');
                    }else{
                        showTip('采样成功','success');
                        setTimeout(function () {
                            location.href = '${ctx}/wshbj/examinationSamples/form';
                        },2000)
                    }
                }
            });
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active">
		<shiro:hasPermission name="wshbj:examinationSamples:edit">
		    <a href="${ctx}/wshbj/examinationSamples/form?id=${examinationSamples.id}">体检样本${not empty examinationSamples.id?'修改':'采集'}</shiro:hasPermission>
		<shiro:lacksPermission name="wshbj:examinationSamples:edit">查看</shiro:lacksPermission></a></li>
		<li><a href="${ctx}/wshbj/examinationSamples/">体检样本列表</a></li>
	</ul><br/>

	<div class="row">
	<form:form id="inputForm" modelAttribute="examinationSamples" action="${ctx}/wshbj/examinationSamples/save" method="post" class="form-horizontal">
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
                <form:input path="code" htmlEscape="false" maxlength="50" class="input-large required"/>
                <span class="help-inline"> 采样人员定期会领取一定数量的样本编号条码贴。 </span>
            </div>
        </div>

		<div class="cl"></div>


		<div class="control-group span12">
			<label class="control-label">是否初检：</label>
			<div class="controls" id="box_is_first">
				<input type="radio" id="examinationFlag1" name="examinationFlag" value="1" checked/><label for="examinationFlag1">初检</label>
				<input type="radio" id="examinationFlag2" name="examinationFlag" value="2" /><label for="examinationFlag2">复检</label>
			</div>
		</div>

		<div class="control-group span12">
			<label class="control-label"> <font color="red">*</font> 采集项目：</label>
			<div class="controls" id="box_items">

			</div>
		</div>
        <div class="cl"></div>

		<div class="control-group span6">
			<label class="control-label">体检用户：</label>
			<div class="controls">
				<form:hidden path="userId"/>
				<input type="text" id="userName" name="userName" readonly class="input-large "/>

			</div>
		</div>
		<div class="control-group  span6">
			<label class="control-label">性别：</label>
			<div class="controls">
				<input type="text" id="sex" name="sex" readonly class="input-large "/>
			</div>
		</div>

		<div class="control-group span12">
			<label class="control-label">单位：</label>
			<div class="controls">
				<input type="text" id="organ" name="organ" readonly class="input-large"/>
			</div>
		</div>
		<div class="control-group span12">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions  span12">
			<shiro:hasPermission name="wshbj:examinationSamples:edit"><input id="btnSubmit" class="btn btn-primary" type="button" value="保 存" onclick="submitForm();"/>&nbsp;</shiro:hasPermission>
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