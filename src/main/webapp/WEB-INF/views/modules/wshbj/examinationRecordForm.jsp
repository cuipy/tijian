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
                    setUserPro(u);

                    chgIndustry();
                }
            });

            setTimeout("$('#userAuto').focus();",300);
            setTimeout("lodop_check()",300);
        });

        // 设置用户的属性property
        function setUserPro(u) {
            $("#userId").val(u.id);
            $("#name").val(u.name);
            $("#idNumber").val(u.idNumber);
            $("#birthday").val(u.birthday);
            $("#phoneNumber").val(u.phoneNumber);
            $("#sex").val(u.sex);
            if(u.age!=null&&u.age!=''){
                $("#age").val(u.age);
            }else{
                $("#age").val(getAgeFromId(u.idNumber));
            }
            $("#strSex").val(u.strSex);
            $("#organId").val(u.organId);
            $("#organName").val(u.organName);
            $("#industryId").val(u.industryId);
            $("#industryName").val(u.industryName);
            $("#postId").val(u.postId);
            $("#postName").val(u.jobPostName);
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
                    pchkbox.trigger('click');
                }
            });
        }

        // 选中某个体检套餐，更新总费用
        function chkPackage(packageId) {
            var itemIds=$("#packageId_"+packageId).attr("data-itemIds");

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
            refreshItemsPrice();
        }

        // 当勾选体检项目的时候，刷新体检项目总费用
        function refreshItemsPrice(){
            var aprice=0;
            $("input[type='checkbox'][id^=tcri]:checked,input[type='checkbox'][id^=bcri]:checked").each(function(i){
                var price=$(this).attr("data-price");
                aprice+= parseInt(price);
            })
            $("#packagePrice").val(aprice);
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
                    lodop_printA4('流程表','${ctxfull}/wshbj/exam_record_print/tjb_html?id='+id);
                }
                // 清除必要的字段，继续添加新登记。
                setUserPro({});
                $("#userAuto").val('');

                if(status.indexOf('return')>=0){
                    setTimeout("location.href='${ctx}/wshbj/examinationRecord/list'",1000);
                 }
            });
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

    <div id="lodop_check" class="alert alert-danger" style="display:none" >
        1 您可能还未安装Lodop打印驱动，请<a href="${ctxStatic}/lodop/CLodop_Setup_for_Win32NT.exe" target="_blank">下载</a>并安装Lodop。<br>
        2 您如果已经安装Lodop打印驱动，但没有启动服务。请运行 <span style="color:#000;"> 开始 > 所有程序 > C-Lodop(HTM-WEB-PRINT)32bit > C-Lodop Setup</span> ，并启动CLodop服务。
    </div>

    <div id="msg" class="alert alert-danger" style="display:none" ></div>


	<div >
	<form:form id="inputForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/ajax_save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>

    <div style="max-width:1024px">

		<div class="control-group span12">
			<label class="control-label"><font color="red">*</font> 选择体检人：</label>
			<div class="controls">
			     <input type="hidden" id="userId" name="user.id" value="${examinationRecord.user.id}" >
			     <input type="hidden" id="name" name="name" value="${examinationRecord.name}" >
			    <div class="autocompleter-box"><input type="text" id="userAuto" name="userInfo" placeholder="姓名/姓名拼音/身份证/手机号"
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
            <label class="control-label"><font color="red">*</font> 年龄：</label>
            <div class="controls">
                <input type="text" id="age" name="age"  value="${examinationRecord.age}" class="input-medium" readonly="true">
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
           <input type="text"  onchange="chgIndustry()"  id="industryName" name="industryName" value="${examinationRecord.industryName}" class="input-medium" readonly="true">

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

<div class="cl"></div>
		<div class="control-group span8">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="cl"></div>

<div class="control-group span4">
    		<label class="control-label">体检日期：</label>
    		<div class="controls">
                <input type="text" id="examTime" name="examTime" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${examinationRecord.examTime}' />"
                   class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});">

    		</div>
    	</div>
    	<div class="cl"></div>
		<div class="control-group span12" id="packageIdDiv">
			<label class="control-label">体检套餐：</label>
			<div class="controls">
                <label for="packageId_no"> <input type="radio" id="packageId_no" name="packageId" value="" onclick="chkPackage('no')" data-itemIds=''
                   <c:if test="${examinationRecord.packageId == null || examinationRecord.packageId ==''}">checked='checked'</c:if> />
                                自由选择体检项目</label>
                <c:forEach items="${packageList}" var="p">
                <label for="packageId_${p.id}"> <input type="radio" id="packageId_${p.id}" name="packageId" value="${p.id}" data-itemIds="${p.itemIds}"
                 onclick="chkPackage('${p.id}')" <c:if test="${p.id == examinationRecord.packageId}">checked='checked'</c:if> />
                ${p.name}</label>
                </c:forEach>

			</div>
		</div>
		<div class="control-group span12" id="itemsDiv1" >
            <label class="control-label">必选项目：</label>
            <div class="controls radios-box">
                <c:forEach items="${examinationItemList}" var="ri" varStatus="s">
               <label id="lbl_tcri${ri.id}" for="tcri${ri.id}" style="display:none;">
               <input id="tcri${ri.id}" name="examinationRecordItemList[${s.index}].itemId" value="${ri.id}" type="checkbox" data-price="${ri.price}" onclick="return false;">
                 ${ri.name} ${ri.price}元</label>
                </c:forEach>
            </div>
        </div>
		<div class="control-group span12" id="itemsDiv" >
			<label class="control-label">自由选择项目：</label>
			<div class="controls radios-box">
			    <c:if test="${not empty examinationItemList  }">
			    <c:forEach items="${examinationItemList}" var="ri" varStatus="s">
				<label id="lbl_bcri${ri.id}" for="bcri${ri.id}"> <input id="bcri${ri.id}" name="examinationRecordItemList[${s.index}].itemId" value="${ri.id}" type="checkbox" data-price="${ri.price}" onclick="refreshItemsPrice()"
				<c:if test="${examinationRecord.itemIds !=null and fn:contains(examinationRecord.itemIds,ri.id)}">checked='checked'</c:if> >
				${ri.name} ${ri.price}元</label>
				</c:forEach>
				</c:if>
			</div>
		</div>
		<div class="cl"></div>
		<div class="control-group span6">
            <label class="control-label">合计价：</label>
            <div class="controls">
                <form:input path="packagePrice" htmlEscape="false" maxlength="64" class="input-medium " readonly="true"/>
            </div>
        </div>
		<div class="cl"></div>
		<div class="form-actions span12">

			<shiro:hasPermission name="wshbj:examinationRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="button" value="保存并打印" onclick="do_sumbit('print')" />&nbsp;</shiro:hasPermission>
            <shiro:hasPermission name="wshbj:examinationRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="button" value="保存并返回" onclick="do_sumbit('return')" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>

			当前A4打印机<select id="sltA4Print" style="min-width:200px;"  onclick="lodop_setA4PrintIndex()"></select>
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