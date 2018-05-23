<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<!--
快捷采集样本操作：
1 本页面进行快速采样操作；
2 进入本页面，首先选择采样项目；
3 页面显示当前采集项目类型，提示：请扫描体检项目条码或读取体检人身份证

4 采样编号如果是在 体检记录创建的时候生成，且在创建的时候打印，则此时不需要打印 样本编号；
5 采样编号如果是在 体检记录创建的时候生成，但在采用的时候打印，则此时需要打印 样本编号；
6 采样编号如果在这个时候生成，则需要 自动生成体检编号，则需要打印 样本编号。

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
            setInterval(focusExamRecordCode, 2000);
		    setTimeout("lodop_check()",300);

		    // 当前要录入体检记录 编号的时候
		    $("#examRecordCode").focus();
		    $("#examRecordCode").on("blur keypress",function(){
		        $("#msg_examRecordCode").html("开始分析体检记录编号");

		        // 输入体检记录编号后，开始检测体检编号，如果编号合法，则可以采集编号
		        var recordCode =$.trim($("#examRecordCode").val());
		        var currExamItemId = $.trim($("#currExamItemId").val());

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

		    <c:if test="${not empty currExamItemId and not empty examRecord and !examRecordItem.grabSample}">
		    // 体检记录项目还没有真正采样
            setTimeout("daojishiGrabSample()",1000);
		    </c:if>

		    <c:if test="${ not empty examRecordItem && examRecordItem.sampleCodePrintCount<=3 && sampleCodePrintPoint==2}">
		    setTimeout("do_sample_code_print()",1000);
		    </c:if>

        });

        function focusExamRecordCode(){
            $("#examRecordCode").focus();
        }

        <c:if test="${not empty examRecordItem and sampleCodePrintPoint==2}">
        // 执行 样本编号打印
        function do_sample_code_print(){
            var url="${ctx}/wshbj/examinationRecordItem/ajax_update_sample_code_print_count";
            var d1={"id":'${examRecordItem.id}'};
            $.get(url,d1);

            lodop_printBarcode('样本编号','${ctxhttp}/wshbj/exam_record_print/barcode_html?barcode='+$('#examRecordItemSampleCode').val() );
        }
        </c:if>

        <c:if test="${not empty currExamItemId and not empty examRecord and !examRecordItem.grabSample}">
        var submited=false;
        function daojishiGrabSample(){
            var second=$("#btnUpdateGrabSample").attr("data-second");
            var isecond=parseInt(second);

            if(submited){
                return;
            }

            if(isecond<=0){
                $("#btnUpdateGrabSample").hide();
                do_update_grab_sample();
            }else{
                $("#btnUpdateGrabSample").attr("data-second",isecond-1);
                $("#btnUpdateGrabSample").val("设置取样成功("+isecond+"秒后自动提交)");
                setTimeout("daojishiGrabSample()",1000);
            }

        }
        // 体检记录项目还没有真正采样
        function do_update_grab_sample(){
            var url="${ctx}/wshbj/examinationRecordItem/ajax_update_grab_sample";
            var d1={"id":'${examRecordItem.id}'};
            $.get(url,d1,function(d1r){
                submited=true;
                $("#btnUpdateGrabSample").hide();
                $("#msg").show().html("体检记录项目采集成功。");
            });
        }

        </c:if>


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

    <div class="breadcrumb form-search">
    <ul class="ul-form">
        <li><label>条码打印机：</label>
            <select id="sltBarcodePrint" style="min-width:200px;"  onclick="lodop_setBarcodePrintIndex()"></select>
        </li>
    </ul>
    </div>

    <c:if test="${not empty currExamItemId }">
	<div  style="max-width:1200px" class="form-horizontal">

	    <input type="hidden" id="examRecordId" name="id" value="${examRecord.id}"/>
	    <input type="hidden" id="currExamItemId" name="currExamItemId" value="${currExamItemId}"/>

	    <input type="hidden" id="examRecordItemId" name="examRecordItemId" value="${examRecordItem.id}"/>
        <input type="hidden" id="examRecordItemSampleCode" name="examRecordItemSampleCode" value="${examRecordItem.sampleCode}"/>

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

            <input id="btnSubmit" class="btn btn-primary" type="button" value="打印样本编号" onclick="do_sample_code_print()" />&nbsp;&nbsp;
            <c:if test="${!examRecordItem.grabSample}">
            <input id="btnUpdateGrabSample" class="btn btn-primary" type="button" value="设置取样成功" data-second="10" onclick="do_update_grab_sample()" />&nbsp;</c:if>
		</div>
        </c:if>

<div class="cl"></div>

	</div>

	</c:if>


</body>
</html>

