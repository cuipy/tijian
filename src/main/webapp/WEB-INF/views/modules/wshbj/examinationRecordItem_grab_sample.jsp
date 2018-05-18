<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<!--
快捷采集样本操作：
1 本页面进行快速采样操作；
2 进入本页面，首先选择采样项目；
3 页面显示当前采集项目类型，提示：请扫描体检项目条码或读取体检人身份证

needSampleItems   需要采集样本的 ExaminationItem 的列表
sampleExamItemId  当前选中的 体检项目类型 id
examRecord    当前要采样的 体检记录 对象


  -->
	<title>体检记录管理</title>
	<meta name="decorator" content="default"/>
    <script src="${ctxStatic}/websocket/reconnecting-websocket.js" type="text/javascript"></script>
    <script src="${ctxStatic}/websocket/web_socket.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(function() {

		    <c:if test="${not empty sampleExamItemId and empty examRecord }">
		    // 当前要录入体检记录 编号的时候
		    $("#examRecordCode").focus();
		    $("#examRecordCode").on("blur keypress",function(){
		        // 输入体检记录编号后，开始检测体检编号，如果编号合法，则可以采集编号
		        var recordCode =$("#examRecordCode").val();
		        var sampleExamItemId = $("#sampleExamItemId").val();

		        var url="${ctx}/wshbj/examinationRecord/ajax_check_exam_record_code_can_grab_sample";
		        var d1={"examRecordCode":recordCode,"examItemId":sampleExamItemId};
		        $.get(url,d1,function(d1r){
		            if(d1r.state<10){
		                if(d1r.state>1){
		                    $("#msg").show().html(d1r.msg);
		                    return;
		                }else{
		                    var url2="${ctx}/wshbj/examinationRecordItem/grab_sample?examRecordCode="+recordCode+"&sampleExamItemId="+sampleExamItemId;
		                    location.href=url2;
		                }
		            }
		        });

		    });
		    </c:if>

        });


	</script>
</head>
<body>

	<ul class="nav nav-tabs">
        <li><a href="${ctx}/wshbj/examinationRecordItem/grab_sample" style="color:#666;">请选择采集类型</a></li>
        <c:forEach items="${needSampleItems}" var="vo">
        <c:if test="${vo.id==sampleExamItemId}"><li class="active"></c:if>
        <c:if test="${vo.id!=sampleExamItemId}"><li></c:if>
        <a href="${ctx}/wshbj/examinationRecordItem/grab_sample?sampleExamItemId=${vo.id}">${vo.name}</a></li> </c:forEach>
	</ul>

    <div id="msg" class="alert alert-danger" >
    <c:if test="${empty sampleExamItemId }">第一步：请选择采集样本类型</c:if>
    <c:if test="${not empty sampleExamItemId}">
        <c:if test="${empty examRecord}">
            第二步：请录入体检记录编号，或扫描体检人身份证
        </c:if>
    </c:if>
    </div>

    <c:if test="${not empty sampleExamItemId }">
	<div  style="max-width:1200px" class="form-horizontal">

	    <input type="hidden" id="examRecordId" name="id" value="${examRecord.id}"/>
	    <input type="hidden" id="sampleExamItemId" name="sampleExamItemId" value="${sampleExamItemId}"/>

        <div class="control-group span12">
            <label class="control-label">体检编号：</label>
            <div class="controls">
                <input type="text" id="examRecordCode" name="examRecordCode" maxlength="50" class="input-large"
                <c:if test="${not empty examRecord}">onchange="chgExamRecordCode()" readonly="readonly"</c:if> />
                <span class="help-inline"> 手动录入或条码扫描体检编号。 </span>
            </div>
        </div>
        <div class="cl"></div>

        <c:if test="${not empty examRecord}">
        <div class="control-group span12">
            <label class="control-label">录入样本编号：</label>
            <div class="controls">
                <input type="text" id="sampleCode" name="sampleCode" maxlength="50" class="input-large" onchange=""/>
                <span class="help-inline"> 手动录入或条码扫描样本编号。 </span>
            </div>
        </div>
        <div class="cl"></div>
        </c:if>

        <div class="control-group span6">
            <label class="control-label"> 用户头像：</label>
            <div class="controls">
                 <img style="width:320px;min-height:220px" src="${examItem.headImg}"/>
            </div>
        </div>

        <div class="control-group span4">
            <label class="control-label">真实姓名：</label>
            <div class="controls">
                ${examItem.name}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">身份证：</label>
            <div class="controls">
                ${examItem.idNumber}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">联系电话：</label>
            <div class="controls">
                ${examItem.phoneNumber}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">性别：</label>
            <div class="controls">
                ${examItem.strSex}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">年龄：</label>
            <div class="controls">
                ${examItem.age}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">出生日期：</label>
            <div class="controls">
                ${examItem.birthday}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">体检单位：</label>
            <div class="controls">
                ${examItem.organName}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">行业：</label>
            <div class="controls">
                ${examItem.industryName}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">岗位：</label>
            <div class="controls">
                ${examItem.postName}
            </div>
        </div>
<div class="cl"></div>
		<div class="form-actions span12">
            <c:if test="${not empty examRecord }">
			<input class="btn btn-primary" type="button" value="保存采集样本(10秒后自动保存)" onclick="do2()"/>&nbsp;
            <input class="btn btn-primary" type="button" value="重新录入体检项目" onclick="do2()" />&nbsp;
            </c:if>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>

		</div>
<div class="cl"></div>

	</div>

	</c:if>



</body>
</html>