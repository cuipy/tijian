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
            setInterval(focusExamRecordCode, 2000);
		    setTimeout("lodop_check()",500);

		    // 当前要录入体检记录 编号的时候
		    $("#examRecordCode").focus();
		    $("#examRecordCode").on("blur keypress",function(){
		        $("#msg_examRecordCode").html("开始分析体检记录编号");

		        // 输入体检记录编号后，开始检测体检编号，如果编号合法，则可以采集编号
		        var recordCode = $.trim($("#examRecordCode").val());
		        // 如果体检记录编号为 空
		        if(recordCode == ''){
		            return;
		        }

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

        function focusExamRecordCode(){
            $("#examRecordCode").focus();
        }

        <c:if test="${not empty examRecord}">
        // 如果已经选中体检记录对象，可以进行制卡
        function do_update_print_card(){

            if($("#examRecordId").val()==''){
                $("#msg").show().html("未能获取体检记录对象的id，无法制卡。");
                return;
            }

            var url="${ctx}/wshbj/examinationRecord/ajax_print_card";
            var d1={"id":$("#examRecordId").val()};
            $.get(url,d1,function(d1r){
                if(d1r.state==1){
                    $("#btnPrintCard").hide();
                    $("#msg").show().html("体检记录制卡成功。");
                    do_print_card();
                }else  if(d1r.state==2){
                    $("#msg").show().html("本次并非第一次打印制卡");
                    do_print_card();
                }else{
                     $("#msg").show().html(d1r.msg);
                }
            });

        }

        // 执行打印制卡
        function do_print_card(){
            lodop_printCard("制证","${ctxhttp}/wshbj/exam_record_print/zhizheng_html?id="+$("#examRecordId").val());
        }
        </c:if>

	</script>
</head>
<body>

	<ul class="nav nav-tabs">
        <li><a href="javascript:void(0)">快速制卡</a></li>
	</ul>

    <div class="box1">
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
        <li><label>可制证数量：</label>
        ${canZhizhengCount}
        </li>
    </ul>
    </div>

	<div  style="max-width:1200px" class="form-horizontal">

        <input type="hidden" id="examRecordId" name="examRecordId" value="${examRecord.id}"/>
        <input type="hidden" id="examRecordStatus" name="examRecordStatus" value="${examRecord.status}"/>

        <div class="control-group span12">
            <label class="control-label">编号：</label>
            <div class="controls">
                <input type="text" id="examRecordCode" name="examRecordCode" maxlength="50" class="input-large"/>
                <span id="msg_examRecordCode" class="help-inline"> <c:if test="${empty examRecord}">手动录入或条码扫描体检编号。</c:if> </span>
            </div>
        </div>
        <div class="cl"></div>

        <div class="control-group span6">
            <label class="control-label">体检编号：</label>
            <div class="controls">
                ${examRecord.code}
            </div>
        </div>

        <div class="cl"></div>

        <div class="control-group span4">
            <label class="control-label"> 用户头像：</label>
            <div class="controls">
                 <img id="imgHeadImg" style="width:90px;min-height:110px" src="${ctx}/wshbj/examinationRecord/getHeadImg?id=${examRecord.id}"
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
            <label class="control-label">体检项目：</label>
            <div class="controls">
                <table class="tbl-items">
                <c:forEach items="${examRecord.items}" var="vo" varStatus="idx">
                    <c:if test="${vo.recordResultDeptId == myDeptId}">
                    <tr><td> ${vo.itemName}  </td>
                    <td> <c:if test="${vo.needSamples == 1 }">需要采样 </c:if>
                        <c:if test="${vo.needSamples != 1 }">无需采样</c:if>
                    </td>
                    <td>
                        <c:if test="${vo.sampleCode != null && vo.sampleCode != ''}">标本编号：${vo.sampleCode}</c:if>
                        <c:if test="${vo.sampleCode == null || vo.sampleCode == ''}">待采样</c:if>
                    </td>
                    <td>
                        <label for="resultFlag1${idx.index}">
                            <c:if test="${vo.resultFlag ==null}">  <input type="hidden" class="noResultItemId" value="${vo.id}"> </c:if>
                            <input class="rd-itemId" id="resultFlag1${idx.index}" value="1" name="resultFlag[${idx.index}]" type="radio"
                               data-itemId="${vo.id}" <c:if test="${vo.resultFlag ==null or vo.resultFlag == 1 }">checked="checked"</c:if>>合格</label>
                        <label for="resultFlag0${idx.index}">
                            <input class="rd-itemId" id="resultFlag0${idx.index}" value="0" name="resultFlag[${idx.index}]" type="radio"
                               data-itemId="${vo.id}" <c:if test="${vo.resultFlag == 0 }">checked="checked"</c:if>>不合格</label>
                    </td> </tr>
                    </c:if>
                </c:forEach>
                </table>
            </div>
        </div>
        <div class="cl"></div>


		<div class="form-actions span12">
            <input id="btnPrintCard" class="btn btn-primary" type="button" value="制卡打印" data-second="10" onclick="do_update_print_card()" />&nbsp;
		</div>

<div class="cl"></div>

	</div></div>



</body>
</html>

