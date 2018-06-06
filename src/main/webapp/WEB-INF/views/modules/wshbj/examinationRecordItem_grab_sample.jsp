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

specimens   需要当前用户可采样的 specimens 的列表
currSpecimenId  当前选中的 标本 id
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
		        var currSpecimenId = $.trim($("#currSpecimenId").val());

		        var url="${ctx}/wshbj/examinationRecord/ajax_check_exam_record_code_can_grab_sample";
		        var d1={"examRecordCode":recordCode,"specimenId":currSpecimenId};
		        $.get(url,d1,function(d1r){

                    if(d1r.state!=1&&d1r.state!=3){
                        $("#msg_examRecordCode").html(d1r.msg);
                        return;
                    }else{
                        var url2="${ctx}/wshbj/examinationRecordItem/grab_sample?examRecordCode="+recordCode+"&currSpecimenId="+currSpecimenId;
                        location.href=url2;
                    }

		        });

		    });

		    <c:if test="${not empty currSpecimenId and not empty examRecord}">
		    // 体检记录项目还没有真正采样
            daojishiGrabSample();
		    </c:if>

            <c:if test="${autoPrint}">
		    setTimeout("do_sample_code_print()",1000);
            </c:if>
        });

        function focusExamRecordCode(){
            $("#examRecordCode").focus();
        }

        // 执行 样本编号打印
        function do_sample_code_print(){
            var url="${ctx}/wshbj/examinationRecordItem/ajax_update_sample_code_print_count";
            var d1={"sampleCode":$("#sampleCode").val()};
            $.get(url,d1);

            var cnt = $("#sampleCodeCount").val();
            if(!isNaN(cnt)){
                cnt=parseInt(cnt);

                for(var i=0;i<cnt;i++){
                    lodop_printBarcode('样本编号','${ctxhttp}/wshbj/exam_record_print/barcode_html?barcode='+$('#sampleCode').val() );
                }
            }
        }

        <c:if test="${not empty currSpecimenId and not empty examRecord and !examRecordItem.grabSample}">
        function daojishiGrabSample(){
            $("#btnUpdateGrabSample").hide();
            do_update_grab_sample();
        }
        // 体检记录项目还没有真正采样
        function do_update_grab_sample(){
            var url="${ctx}/wshbj/examinationRecordItem/ajax_update_grab_sample";
            var d1={"sampleCode":$("#sampleCode").val()};
            $.get(url,d1,function(d1r){
                $("#btnUpdateGrabSample").hide();
                $("#msg").show().html("体检记录项目采集成功。");
            });
        }

        <c:if test="${not autPrint}">
        // 撤销取样
        function do_cancel_grab_sample(){
            var url="${ctx}/wshbj/examinationRecordItem/ajax_cancel_grab_sample";
            var d1 = {"examRecordId":$("#examRecordId").val(),"specimenId": $("#currSpecimenId").val() };
            $.post(url,d1,function(){location.reload();});
        }
        </c:if>

        </c:if>


	</script>
</head>
<body>
	<ul class="nav nav-tabs">
        <li><a href="${ctx}/wshbj/examinationRecordItem/grab_sample" style="color:#666;">快速采样：选择采样标本</a></li>
        <c:forEach items="${specimens}" var="vo">
        <c:if test="${vo.id==currSpecimenId}"><li class="active"></c:if>
        <c:if test="${vo.id!=currSpecimenId}"><li></c:if>
        <a href="${ctx}/wshbj/examinationRecordItem/grab_sample?currSpecimenId=${vo.id}">${vo.name}</a></li> </c:forEach>
	</ul>
    <div class="box1">
    <div id="msg" class="alert alert-danger" >
    <c:if test="${empty currSpecimenId }">第一步：请选择采集样本类型</c:if>
    <c:if test="${not empty currSpecimenId}">
        <c:if test="${empty examRecord}">
            第二步：请录入体检记录编号，或扫描体检人身份证
        </c:if>
        <c:if test="${not autoPrint}">
            已经取样成功。
        </c:if>
    </c:if>
    </div>

	<div  style="max-width:1200px" class="form-horizontal">

	    <input type="hidden" id="examRecordId" name="id" value="${examRecord.id}"/>
	    <input type="hidden" id="currSpecimenId" name="currSpecimenId" value="${currSpecimenId}"/>

        <input type="hidden" id="autoPrint" value="${autoPrint}"/>
        <input type="hidden" id="sampleCode" name="sampleCode" value="${sampleCode}"/>
        <input type="hidden" id="sampleCodeCount" value="${sampleCodeCount}"/>

        <div class="control-group">
            <label class="control-label">编号：</label>
            <div class="controls">
                <input type="text" id="examRecordCode" name="examRecordCode" maxlength="50" class="input-large"/>
                <span id="msg_examRecordCode" class="help-inline"> <c:if test="${empty examRecord}">手动录入或条码扫描体检编号。</c:if> </span>
            </div>
        </div>
        <div class="cl"></div>

        <div class="control-group">
            <label class="control-label">体检编号：</label>
            <div class="controls">
                ${examRecord.code}
            </div>
        </div>

        <div class="cl"></div>

        <div class="control-group span4">
            <label class="control-label"> 用户头像：</label>
            <div class="controls">
                 <img id="imgHeadImg" style="width:90px;height:120px"  src="${ctx}/wshbj/examinationRecord/getHeadImg?id=${examRecord.id}"
                 onerror="javascript:this.src='${ctxStatic}/images/style2/nopic.png'"/>
            </div>
        </div>

        <div class="control-group span4">
            <label class="control-label">真实姓名：</label>
            <div class="controls">
                ${examRecord.name}
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

        <div class="cl"></div>

        <div class="control-group">
            <label class="control-label">全部体检项目：</label>
            <div class="controls">
                <c:forEach items="${examRecord.items}" var="vo">
                <c:if test="${vo.lastFlag=='1' and vo.specimenId == currSpecimenId}">
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
		<div class="form-actions">

            <input id="btnSubmit" class="btn btn-primary" type="button" value="打印样本编号" onclick="do_sample_code_print()" />&nbsp;&nbsp;
            <c:if test="${not autoPrint}">
            <input id="btnCancelGrabSample" class="btn btn-primary" type="button" value="撤销并重新取样"
                   onclick="do_cancel_grab_sample()" />&nbsp;</c:if>
		</div>

<div class="cl"></div>

	</div>

	    <div class="breadcrumb form-search">
        <ul class="ul-form">
            <li><label>条码打印机：</label>
                <select id="sltBarcodePrint" style="min-width:200px;"  onclick="lodop_setBarcodePrintIndex()"></select>
            </li>
        </ul>
        </div>

	</div>


</body>
</html>

