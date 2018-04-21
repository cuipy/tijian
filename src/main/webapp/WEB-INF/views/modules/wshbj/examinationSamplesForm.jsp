<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检样本管理</title>
	<meta name="decorator" content="default"/>

	<script type="text/javascript">
	    var lastExaminationCode='';
	    var lastCode='';

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



            // 体检编号文本框失去焦点事件
            $('#examinationCode').on('blur',inputExaminationCode);
            $('#examinationCode').on('keypress',enterExaminationCode);

            $('#examinationCode').on('change',chgExaminationCode);

            // 样本编号文本框失去焦点事件
            $('#code').on('blur',inputCode);
            $('#code').on('keypress',enterCode);

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

		// 选择采集项目的时候触发
		function clkItemId(){
            $("#code").removeAttr('readonly');
            $("#code").focus();
		}

		// 设置记录id 用户id 等隐藏控件，设置性别、单位、姓名等现实数据。
		function setControl(data){
		    $("#code").prop("readonly",true);

		    if(data==null){
		        $('#recordId').val('');
                $('#userId').val('');
                $('#userName').val('');
                $('#sex').val('');
                $('#organ').val('');
                return;
		    }
            $('#recordId').val(data.id);
            $('#userId').val(data.user.id);
            $('#userName').val(data.name);
            $('#sex').val(data.strSex);
            $('#organ').val(data.organName);

            // 获取体检类型
            var specimenId = $("input[name='itemId']:checked").attr('data-specimen_id');
            if(specimenId!=undefined){
                $("#code").removeAttr("readonly");
            }

            // 加载当前用户报名的体检项目
            var itemsHtml="";
            if(data.items!=null){
                for(var i=0;i<data.items.length;i++){
                    var item=data.items[i];
                    // 不需要体检，或者不是最后一次体检样本，则过滤掉
                    if( item.needSamples != 1||item.lastFlag!= 1){
                        continue;
                    }

                    // 是否已经取样
                    var hasSampleCode = false;
                    // 样本检查结果标记
                    var resultFlag = '';
                    var resultFlatDetail='';


                    if(item.sampleCode==null){
                        hasSampleCode=false;
                        resultFlatDetail='未取样';

                     }else{
                        hasSampleCode=true;
                        resultFlatDetail='已取样';

                        // 判断检查结果
                        if(item.resultFlag==null||item.resultFlag=='' ){
                            resultFlag='';
                            resultFlatDetail='未出结果';
                        }else if(item.resultFlag=='0'){
                             resultFlag='0';
                             resultFlatDetail='不合格';
                        }else if(item.resultFlag=='1'){
                              resultFlag='1';
                              resultFlatDetail='合格';
                         }
                     }

                    itemsHtml+="<input type='radio' name='itemId' id='itemId_"+item.itemId+"' value='"+item.itemId+"' data-flag='"+item.examinationFlag
                    +"' data-specimen_id='"+item.specimenId+"' data-result_flag='"+resultFlag+"' ";

                    // 如果未取样，或者取样了，但结果不是不合格，则不可再取样。
                    if(hasSampleCode&&resultFlag!='0'){
                        itemsHtml+=" disabled='disabled' ";
                    }else{
                        itemsHtml+=" onclick='clkItemId()'";
                    }
                    itemsHtml+="><label for='itemId_"+item.itemId+"'>"+item.itemName+"&nbsp;&nbsp;";
                    itemsHtml+= item.examinationFlag==1?"初检":"复检";
                    itemsHtml+= '&nbsp;&nbsp;'+resultFlatDetail;

                    itemsHtml+=" </label>&nbsp;&nbsp;";
                }
            }
            $("#box_items").html(itemsHtml);
            $("input[name='itemId']").focus();
        }

        // 体检编号文本框内容发生变化
        function chgExaminationCode(){

        }

        // 在体检编号文本框操作键盘
        function enterExaminationCode(evt){
            if(evt.keyCode==13){
                inputExaminationCode();
                $("#code").focus();
            }
        }

        // 在样本编号文本框操作键盘的事件
        function enterCode(evt){
            if(evt.keyCode==13){
                inputCode();
                $("input[name='itemId']").focus();
            }
        }

        // 成功录入体检编号后的方法
        function inputExaminationCode(){

            var examinationCode = $('#examinationCode').val();
            if(lastExaminationCode==examinationCode){
                return;
            }

            if(!examinationCode||examinationCode.length<3){
                setControl(null);
                lastExaminationCode='';
                return;
            }

            // ajax方式获取体检项目
            var url = '${ctx}/wshbj/examinationRecord/ajax_get_by_record_code';
            $.post(url,{'code':examinationCode},function (d1r) {
                if(!d1r){
                    showTip("由于未知原因，获取数据失败","error");
                    lastExaminationCode='';
                }else if(d1r.state!=1){
                    showTip(d1r.msg,"error");
                    lastExaminationCode='';
                }else{
                    setControl(d1r.data);
                    lastExaminationCode=examinationCode;
                }
            });
        }

        // 样本编号输入后的操作
        function inputCode(){
            // 当前体检类型
            var specimenId = $("input[name='itemId']:checked").attr('data-specimen_id');

            var code= $("#code").val();

            if(code==null||code==''||code==lastCode){
                return;
            }

            var url="${ctx}/wshbj/sampleCodes/ajax_get_by_id";
            var d1={sampleCode:code,v:new Date().getTime()};
            $.get(url,d1,function(d1r){
                if(d1r.state==1 ){
                    // 如果样本类型编号不一致 ，则报错
                    if(d1r.data.specimenId != specimenId ){
                        showTip("样本编号所属类型与采集项目不一致","error");
                    }else if(d1r.data.isUsed =='1'){
                        showTip("样本编号已经使用了，不可使用该样本编号","error");
                    }else{
                        lastCode=code;
                        showTip("编号正确，允许使用");
                        return;
                    }
                }else{
                    showTip(d1r.msg,"error");
                }
                lastCode='';
                $("#code").val('');
            });
        }

		function submitForm() {
            $("#msg").html("").hide();

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
                <form:input path="code" htmlEscape="false" maxlength="50" class="input-large required" readonly="true"/>
                <span class="help-inline"> 采样人员领取的样本编号条码贴。选中采集项目后，才可以录入样本编号。 </span>
            </div>
        </div>

		<div class="cl"></div>

		<div class="control-group span12">
			<label class="control-label"> <font color="red">*</font> 采集项目：</label>
			<div class="controls" id="box_items">
                <span class="help-inline"> 录入正确的体检编号后，自动加载采集项目。 </span>
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
			<shiro:hasPermission name="wshbj:examinationRecordItem:edit"><input id="btnSubmit" class="btn btn-primary" type="button" value="保 存" onclick="submitForm();"/>&nbsp;</shiro:hasPermission>
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