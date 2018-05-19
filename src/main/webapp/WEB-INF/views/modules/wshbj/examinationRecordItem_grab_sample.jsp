<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<!--
快捷采集样本操作：
1 本页面进行快速采样操作；
2 进入本页面，首先选择采样项目；
3 页面显示当前采集项目类型，提示：请扫描体检项目条码或读取体检人身份证

4 采样编号生成阶段：

needSampleItems   需要采集样本的 ExaminationItem 的列表
currExamItemId  当前选中的 体检项目类型 id
examRecord    当前要采样的 体检记录 对象


  -->
	<title>快速采集体检样本</title>
	<meta name="decorator" content="default"/>
    <script src="${ctxStatic}/websocket/reconnecting-websocket.js" type="text/javascript"></script>
    <script src="${ctxStatic}/websocket/web_socket.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(function() {

		    <c:if test="${not empty currExamItemId and empty examRecord }">
		    // 当前要录入体检记录 编号的时候
		    $("#examRecordCode").focus();
		    $("#examRecordCode").on("blur keypress",function(){
		        $("#msg_examRecordCode").html("开始分析体检记录编号");

		        // 输入体检记录编号后，开始检测体检编号，如果编号合法，则可以采集编号
		        var recordCode =$("#examRecordCode").val();
		        var currExamItemId = $("#currExamItemId").val();

		        var url="${ctx}/wshbj/examinationRecord/ajax_check_exam_record_code_can_grab_sample";
		        var d1={"examRecordCode":recordCode,"examItemId":currExamItemId};
		        $.get(url,d1,function(d1r){

                    if(d1r.state!=1){
                        $("#msg_examRecordCode").html(d1r.msg);
                        return;
                    }else{
                        var url2="${ctx}/wshbj/examinationRecordItem/grab_sample?examRecordCode="+recordCode+"&currExamItemId="+currExamItemId;
                        location.href=url2;
                    }

		        });

		    });
		    </c:if>

		    <c:if test="${not empty currExamItemId and not empty examRecord }">
		    // 获得体检记录对象，准备录入采样编号


		    </c:if>

        });


	</script>
</head>
<body>

	<ul class="nav nav-tabs">
        <li><a href="${ctx}/wshbj/examinationRecordItem/grab_sample" style="color:#666;">快速采样：选择采集类型</a></li>
        <c:forEach items="${needSampleItems}" var="vo">
        <c:if test="${vo.id==currExamItemId}"><li class="active"></c:if>
        <c:if test="${vo.id!=currExamItemId}"><li></c:if>
        <a href="${ctx}/wshbj/examinationRecordItem/grab_sample?currExamItemId=${vo.id}">${vo.name}</a></li> </c:forEach>
	</ul>

    <div id="msg" class="alert alert-danger" >
    <c:if test="${empty currExamItemId }">第一步：请选择采集样本类型</c:if>
    <c:if test="${not empty currExamItemId}">
        <c:if test="${empty examRecord}">
            第二步：请录入体检记录编号，或扫描体检人身份证
        </c:if>
    </c:if>
    </div>

    <c:if test="${not empty currExamItemId }">
	<div  style="max-width:1200px" class="form-horizontal">

	    <input type="hidden" id="examRecordId" name="id" value="${examRecord.id}"/>
	    <input type="hidden" id="currExamItemId" name="currExamItemId" value="${currExamItemId}"/>

        <div class="control-group span12">
            <label class="control-label">体检编号：</label>
            <div class="controls">
                <input type="text" id="examRecordCode" name="examRecordCode" maxlength="50" class="input-large"
                <c:if test="${not empty examRecord}">value="${examRecord.code}" readonly="readonly"</c:if> />
                <span id="msg_examRecordCode" class="help-inline"> <c:if test="${empty examRecord}">手动录入或条码扫描体检编号。</c:if> </span>
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


        <div class="control-group span6">
            <label class="control-label"> 用户头像：</label>
            <div class="controls">
                 <img id="imgHeadImg" style="width:320px;min-height:220px" src="${ctx}/wshbj/examinationRecord/getHeadImg?id=${examRecord.id}"/>
            </div>
        </div>

        <div class="control-group span4">
            <label class="control-label">真实姓名：</label>
            <div class="controls">
                ${examRecord.name}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">身份证：</label>
            <div class="controls">
                ${examRecord.idNumber}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">联系电话：</label>
            <div class="controls">
                ${examRecord.phoneNumber}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">性别：</label>
            <div class="controls">
                ${examRecord.strSex}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">年龄：</label>
            <div class="controls">
                ${examRecord.age}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">出生日期：</label>
            <div class="controls">
                ${examRecord.birthday}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">体检单位：</label>
            <div class="controls">
                ${examRecord.organName}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">行业：</label>
            <div class="controls">
                ${examRecord.industryName}
            </div>
        </div>
        <div class="control-group span4">
            <label class="control-label">岗位：</label>
            <div class="controls">
                ${examRecord.postName}
            </div>
        </div>
        <div class="cl"></div>

        <div class="control-group span12">
            <label class="control-label">全部体检项目：</label>
            <div class="controls">
                <c:forEach items="${examRecord.items}" var="vo">
                <label class="label"> ${vo.itemName} </label> -
                <label class="label"> <c:if test="${vo.needSamples == 1 }">需要采样 <c:if test="${vo.sampleCode != null && vo.sampleCode != ''}">标本编号：${vo.sampleCode}</c:if>
                <c:if test="${vo.sampleCode == null || vo.sampleCode == ''}">待采样</c:if>  </c:if>
                <c:if test="${vo.needSamples != 1 }">无需采样</c:if> </label> -

                 <label class="label">  <c:if test="${vo.resultFlag == null }">无结果</c:if>
                 <c:if test="${vo.resultFlag == 0 }">不合格</c:if>
                <c:if test="${vo.resultFlag == 1 }">合格</c:if> </label>

                <br>
                </c:forEach>
            </div>
        </div>
        <div class="cl"></div>

        </c:if>
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

