<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(function() {

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

			// 当体检项目方式更改的时候
            $("input[name='itemType']:radio").change(function() {
                if($(this).val()=='1'){
                    $('#packageIdDiv').show();
                    $('#itemsDiv').hide();
                    refreshPackagePrice();

				}else {
                    $('#packageIdDiv').hide();
                    $('#itemsDiv').show();
                    refreshItemsPrice();
				}
            });


            $('#idNumber').bind('keypress',function(event){
                if(event.keyCode == 13) {
                    var idNumber = $('#idNumber').val();
                    var url = '${ctx}/wshbj/examinationUser/getByIdNumber';
                    $.post(url,{idNumber:idNumber},function (data) {
                        if(data){
                            setUserPro(data);
                        }
                    });

                    //防止form提交
                    return false;
                }
            });


             var lastUserName='';
             $('#userAuto').autocompleter({

                highlightMatches: true,
                template: '{{ label }}',
                hint: false,
                cache:false,
                empty: false,
                limit: 10,
                source:"${ctx}/wshbj/examinationUser/ajax_for_autocompleter",
                callback: function (value, index, selected) {
                    var u=selected;
                    $("#userId").val(u.id);
                    $("#name").val(u.name);
                    $("#idNumber").val(u.idNumber);
                    $("#birthday").val(u.birthday);
                    $("#phoneNumber").val(u.phoneNumber);
                    $("#sex").val(u.sex);
                    $("#strSex").val(u.strSex);
                    $("#organId").val(u.organId);
                    $("#organName").val(u.organName);
                    $("#industryId").val(u.industryId);
                    $("#industryName").val(u.industryName);
                    $("#postId").val(u.postId);
                    $("#postName").val(u.jobPostName);
                }
            });

            setTimeout("$('#userAuto').focus();",1000);
        });
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}


        //选择用户返回
        function userTreeselectCallBack(v, h, f) {
            if('ok'==v){
                var euserId = $('#userId').val();
                var url = '${ctx}/wshbj/examinationUser/getById';
                $.post(url,{id:euserId},function (data) {
                    if(data){
                        setUserPro(data);
                    }
                },'json');
            }else if('clear'==v){

            }
        }

        function setUserPro(data) {
            $('#userName').val(data.name);
            $('#userId').val(data.id);
            $('#idNumber').val(data.idNumber);
            $('#phoneNumber').val(data.phoneNumber);
            $('#birthday').val(data.birthday);

            $("#sex").attr("value", data.sex);
            $("#sex").trigger('change');

            $("#organId").attr("value", data.organId);
            $("#organId").trigger('change');

            $("#industryId").attr("value", data.industryId);
            $("#industryId").trigger('change');

            $("#postId").attr("value", data.postId);
            $("#postId").trigger('change');
        }

        // 选中某个体检套餐，更新总费用
        function refreshPackagePrice() {
            var price=$("input[type='radio'][id*='packageId_']:checked").attr('data-price');
            $("#packagePrice").val(price);
        }

        // 当勾选体检项目的时候，刷新体检项目总费用
        function refreshItemsPrice(){
            var aprice=0;
            $("input[type='checkbox'][id*=ri]:checked").each(function(i){
                var price=$(this).attr("data-price");
                aprice+= parseInt(price);
            })
            $("#packagePrice").val(aprice);
        }
	</script>
</head>
<body>


	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/form?id=${examinationRecord.id}">体检记录<shiro:hasPermission name="wshbj:examinationRecord:edit">${not empty examinationRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationRecord:edit">查看</shiro:lacksPermission></a></li>
        <li><a href="${ctx}/wshbj/examinationRecord/">体检记录列表</a></li>
        <li><a href="${ctx}/wshbj/examinationRecord/list_print">可制证体检记录</a></li>
        <li ><a href="${ctx}/wshbj/examinationRecord/list_nopass">不合格体检记录</a></li>
	</ul><br/>

	<div >
	<form:form id="inputForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>

    <div style="max-width:1024px">

		<div class="control-group span12">
			 <label class="control-label"><font color="red">*</font> 编号：</label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="45"  readonly="true" class="input-medium"/>
                <span class="help-inline">编号无需录入。行业中设置体检编号生成规则</span>
			</div>
		</div>
        <div class="cl"></div>
		<div class="control-group span12">
			<label class="control-label"><font color="red">*</font>  身份证/手机号：</label>
			<div class="controls">
			     <input type="hidden" id="userId" name="user.id" value="${examinationRecord.user.id}" >
			     <input type="hidden" id="name" name="name" value="${examinationRecord.name}" >
			    <div class="autocompleter-box"><input type="text" id="userAuto" name="userInfo"
			   <c:if test="${examinationRecord.user != null}"> value="${examinationRecord.organName} ${examinationRecord.name} (${examinationRecord.idNumber}/${examinationRecord.phoneNumber})"</c:if>
			   maxlength="50" class="input-xxlarge required" /></div>

                <span class="help-inline">选择体检用户 <a href="${ctx}/wshbj/examinationUser/form" target="_blank">添加体检用户</a></span>
			</div>
		</div>
        <div class="cl"></div>

		<div class="control-group span4">
			<label class="control-label"><font color="red">*</font>  身份证号：</label>
			<div class="controls">
				<form:input path="idNumber" htmlEscape="false" maxlength="20" class="input-medium" readonly="true"/>
			</div>
		</div>


		<div class="control-group span4">
			<label class="control-label"><font color="red">*</font> 联系电话：</label>
			<div class="controls">
				<form:input path="phoneNumber" htmlEscape="false" maxlength="45" class="input-medium"  readonly="true"/>

			</div>
		</div>


		<div class="control-group span4">
			<label class="control-label"><font color="red">*</font> 性别：</label>
			<div class="controls">

			    <input type="hidden" id="sex" name="sex"  value="${examinationRecord.sex}">
				<input type="text" id="strSex" name="strSex"  value="${examinationRecord.strSex}" class="input-medium" readonly="true">

			</div>
		</div>
		<div class="control-group span4">
            <label class="control-label"><font color="red">*</font> 出生日期：</label>
            <div class="controls">
                <input type="text" id="birthday" name="birthday"  value="${examinationRecord.birthday}" class="input-medium" readonly="true">

            </div>
        </div>

	<div class="control-group span4">
		<label class="control-label">行业：</label>
		<div class="controls">
		   <input type="hidden" id="industryId" name="industryId" value="${examinationRecord.industryId}" >
           <input type="text" id="industryName" name="industryName" value="${examinationRecord.industryName}" class="input-medium" readonly="true">

		</div>
	</div>
	<div class="control-group span4" >
		<label class="control-label">单位：</label>
		<div class="controls">
		    <input type="hidden" id="organId" name="organId" value="${examinationRecord.organId}" >
            <input type="text" id="organName" name="organName" value="${examinationRecord.organName}" class="input-medium" readonly="true">

		</div>
	</div>
	<div class="control-group span4">
		<label class="control-label">岗位：</label>
		<div class="controls">
			<input type="hidden" id="postId" name="postId"  value="${examinationRecord.postId}">
            <input type="text" id="postName" name="postName" value="${examinationRecord.postName}" class="input-medium" readonly="true">

		</div>
	</div>

		<div class="control-group span8">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="cl"></div>
		<div class="control-group span6">
			<label class="control-label">体检项目方式：</label>
			<div class="controls">
				<input type="radio" id="itemType1" name="itemType" value="1" <c:if test="${examinationRecord.itemType eq null or examinationRecord.itemType eq 1}">checked="checked"</c:if>/><label for="itemType1">体检套餐</label>
				<input type="radio" id="itemType2" name="itemType" value="2" <c:if test="${examinationRecord.itemType eq 2}">checked="checked"</c:if>/><label for="itemType2">自由选择</label>
			</div>
		</div>
				<div class="control-group span6">
        			<label class="control-label">价格：</label>
        			<div class="controls">
        				<form:input path="packagePrice" htmlEscape="false" maxlength="64" class="input-medium "/>
        			</div>
        		</div>

		<div class="control-group span12" id="packageIdDiv">
			<label class="control-label">体检套餐：</label>
			<div class="controls">

                <c:forEach items="${packageList}" var="p">
                <input type="radio" id="packageId_${p.id}" name="packageId" value="${p.id}"
                 onclick="refreshPackagePrice()"
                 data-price="${p.price}" <c:if test="${p.id == examinationRecord.packageId}">checked='checked'</c:if> />
                <label for="packageId_${p.id}">${p.name}</label>
                </c:forEach>

			</div>
		</div>
		<div class="control-group span12" id="itemsDiv1" >
            <label class="control-label">套餐包含项目：</label>
            <div class="controls">
                <c:forEach items="${examinationItemList}" var="ri" varStatus="s">
                <input id="tcri${ri.id}" name="examinationRecordItemList[${s.index}].itemId" value="${ri.id}" type="checkbox" data-price="${ri.price}"
              checked='checked' disabled>
                <label for="tcri${ri.id}"> ${ri.name} ${ri.price}元</label>&nbsp;&nbsp;&nbsp;&nbsp;
                </c:forEach>
            </div>
        </div>
		<div class="control-group span12" id="itemsDiv" >
			<label class="control-label">补充体检项目：</label>
			<div class="controls">
			    <c:if test="${not empty examinationItemList  }">
			    <c:forEach items="${examinationItemList}" var="ri" varStatus="s">
				<input id="bcri${ri.id}" name="examinationRecordItemList[${s.index}].itemId" value="${ri.id}" type="checkbox" data-price="${ri.price}" onclick="refreshItemsPrice()"
				<c:if test="${examinationRecord.itemIds !=null and fn:contains(examinationRecord.itemIds,ri.id)}">checked='checked'</c:if> >
				<label for="bcri${ri.id}"> ${ri.name} ${ri.price}元</label>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				</c:if>
			</div>
		</div>
		<div class="cl"></div>
		<div class="form-actions span12">
			<shiro:hasPermission name="wshbj:examinationRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
<div class="cl"></div>
</div>
	</form:form>
	</div>
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

</body>
</html>