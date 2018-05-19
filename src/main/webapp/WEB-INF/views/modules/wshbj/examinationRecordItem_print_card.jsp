<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<!--
快速制卡



  -->
	<title>快速制卡</title>
	<meta name="decorator" content="default"/>
    <script src="${ctxStatic}/websocket/reconnecting-websocket.js" type="text/javascript"></script>
    <script src="${ctxStatic}/websocket/web_socket.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(function() {

		    setTimeout("lodop_check()",500);

		    // 当前要录入体检记录 编号的时候
		    $("#examRecordCode").focus();
		    $("#examRecordCode").on("blur keypress",function(){
		        $("#msg_examRecordCode").html("开始分析体检记录编号");

		        // 输入体检记录编号后，开始检测体检编号，如果编号合法，则可以采集编号
		        var recordCode = $.trim($("#examRecordCode").val());

		        var url="${ctx}/wshbj/examinationRecord/ajax_check_exam_record_code_can_print_card";
		        var d1={"examRecordCode":recordCode };
		        $.get(url,d1,function(d1r){

                    if(d1r.state!=1){
                        $("#msg_examRecordCode").html(d1r.msg);
                        return;
                    }else{
                        var url2="${ctx}/wshbj/examinationRecord/print_card?examRecordCode="+recordCode ;
                        location.href=url2;
                    }

		        });

		    });

        });




	</script>
</head>
<body>

	<ul class="nav nav-tabs">
        <li>快速制卡</li>
	</ul>

    <div id="msg" class="alert alert-danger" >
        <c:if test="${empty examRecord}">
        请录入体检记录编号，或扫描体检人身份证
        </c:if>
    </div>

    <div class="breadcrumb form-search">
    <ul class="ul-form">
        <li><label>制卡打印机：</label>
            <select id="sltCardPrint" style="min-width:200px;"  onclick="lodop_setCardPrintIndex()"></select>
        </li>
    </ul>
    </div>

	<div  style="max-width:1200px" class="form-horizontal">

        <input type="hidden" id="examRecordId" name="examRecordId" value="${examRecord.id}"/>

        <div class="control-group span12">
            <label class="control-label">编号：</label>
            <div class="controls">
                <input type="text" id="examRecordCode" name="examRecordCode" maxlength="50" class="input-large"/>
                <span id="msg_examRecordCode" class="help-inline"> <c:if test="${empty examRecord}">手动录入或条码扫描体检编号。</c:if> </span>
            </div>
        </div>
        <div class="cl"></div>

        <c:if test="${not empty examRecord}">
        <div class="control-group span6">
            <label class="control-label">体检编号：</label>
            <div class="controls">
                ${examRecord.code}
            </div>
        </div>
        <div class="control-group span6">
            <label class="control-label">样本编号：</label>

            <div class="controls"> ${examRecordItem.sampleCode}  打印次数：${examRecordItem.sampleCodePrintCount}   </div>
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
                <c:if test="${vo.lastFlag=='1'}">
                <label class="label"> ${vo.itemName} </label> -
                <label class="label"> <c:if test="${vo.needSamples == 1 }">需要采样 <c:if test="${vo.grabSample == true}">已采样</c:if>
                <c:if test="${vo.grabSample == false }">待采样</c:if>  </c:if>
                <c:if test="${vo.needSamples != 1 }">无需采样</c:if> </label> -

                 <label class="label">  <c:if test="${vo.resultFlag == null }">无结果</c:if>
                 <c:if test="${vo.resultFlag == 0 }">不合格</c:if>
                <c:if test="${vo.resultFlag == 1 }">合格</c:if> </label>

                <br></c:if>
                </c:forEach>
            </div>
        </div>
        <div class="cl"></div>
		<div class="form-actions span12">
            <input id="btnPrintCard" class="btn btn-primary" type="button" value="制卡" data-second="10" onclick="do_print_card()" />&nbsp;
		</div>
        </c:if>

<div class="cl"></div>

	</div>



</body>
</html>

