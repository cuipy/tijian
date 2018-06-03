<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<!--
快捷录入结果操作：
1 本页面进行快速 结果录入 操作；
2 进入本页面，首先选择 体检项目；
3 页面显示当前 体检项目 类型，提示：请扫描体检项目条码或读取体检人身份证

examItems   所有体检项目 ExaminationItem 的列表
currExamItemId  当前选中的 体检项目类型 id
examRecordCode   当前体检记录的 code
examRecord    当前要采样的 体检记录 对象


  -->
	<title>快速录入体检结果</title>
	<meta name="decorator" content="default"/>
    <script src="${ctxStatic}/websocket/reconnecting-websocket.js" type="text/javascript"></script>
    <script src="${ctxStatic}/websocket/web_socket.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(function() {
		    setInterval(focusExamRecordCode, 2000);

		    // 当前要录入体检记录 编号的时候
		    $("#examRecordCode").focus();
		    $("#examRecordCode").on("blur keypress",function(){
		        // 输入体检记录编号后，开始检测体检编号，如果编号合法，则可以采集编号
		        var recordCode =$("#examRecordCode").val();
		        var currExamItemId = $("#currExamItemId").val();

		        var url="${ctx}/wshbj/examinationRecord/ajax_check_exam_record_code_can_set_result";
		        var d1={"examRecordCode":recordCode,"examItemId":currExamItemId};
		        $.get(url,d1,function(d1r){
                    if(d1r.state>1){
                        $("#msg_examRecordCode").show().html(d1r.msg);
                        return;
                    }else{
                        var url2="${ctx}/wshbj/examinationRecordItem/set_result?examRecordCode="+recordCode+"&currExamItemId="+currExamItemId;
                        location.href=url2;
                    }
		        });

		    });

		    <c:if test="${ not empty examRecordItem and ((examRecordItem.needSamples=='1' and examRecordItem.grabSample) || examRecordItem.needSamples=='0') }">
            setTimeout("daojishiSetResultFlag()",1000);
            </c:if>

        });

        function focusExamRecordCode(){
            $("#examRecordCode").focus();
        }

        <c:if test="${ not empty examRecordItem and ((examRecordItem.needSamples=='1' and examRecordItem.grabSample) || examRecordItem.needSamples=='0') }">
        var submited=false;
        function daojishiSetResultFlag(){
            var second=$("#btnUpdateResultFlag").attr("data-second");
            var isecond=parseInt(second);
            if(submited){
                return;
            }

            if(isecond<=0){
                $("#btnUpdateResultFlag").hide();
                doUpdateResultFlag();
            }else{
                $("#btnUpdateResultFlag").attr("data-second",isecond-1);
                $("#btnUpdateResultFlag").val("提交体检项目结果("+isecond+"秒后自动提交)");
                setTimeout("daojishiSetResultFlag()",1000);
            }

        }

        // 可以录入体检记录结果
        function doUpdateResultFlag(){
            var url="${ctx}/wshbj/examinationRecordItem/ajax_update_result_flag";
            var resultFlag = $("#resultFlag0:checked").val();
            if( !resultFlag ){
                resultFlag="1";
            }
            var d1={"id": $("#examRecordItemId").val() ,"resultFlag": resultFlag };
            $.get(url,d1,function(d1r){
                submited=true;
                $("#btnUpdateResultFlag").hide();
                $("#msg").show().html(d1r.msg);
            });
        }

        </c:if>


	</script>
</head>
<body>

	<ul class="nav nav-tabs">
        <li><a href="${ctx}/wshbj/examinationRecordItem/set_result" style="color:#666;">快速录入结果：选择体检项目</a></li>
        <c:forEach items="${examItems}" var="vo">
        <c:if test="${vo.id==currExamItemId}"><li class="active"></c:if>
        <c:if test="${vo.id!=currExamItemId}"><li></c:if>
        <a href="${ctx}/wshbj/examinationRecordItem/set_result?currExamItemId=${vo.id}">${vo.name}</a></li> </c:forEach>
	</ul>

    <div class="box1">
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

	    <input type="hidden" id="examRecordItemId" name="examRecordItemId" value="${examRecordItem.id}"/>
        <input type="hidden" id="examRecordItemSampleCode" name="examRecordItemSampleCode" value="${examRecordItem.sampleCode}"/>

        <div class="control-group span12">
            <label class="control-label">体检编号：</label>
            <div class="controls">
                <input type="text" id="examRecordCode" name="examRecordCode" maxlength="50" class="input-large" />
                <span id="msg_examRecordCode" class="help-inline"> <c:if test="${empty examRecord}">手动录入或条码扫描体检编号。</c:if> </span>
            </div>
        </div>
        <div class="cl"></div>

        <c:if test="${not empty examRecord}">

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
            <div class="control-group span12">
                <label class="control-label">是否合格：</label>
                <div class="controls radios-div" >
                    <label for="resultFlag1"><input id="resultFlag1" value="1" name="resultFlag" type="radio" checked="checked">合格</label>
                    <label for="resultFlag0"><input id="resultFlag0" value="0" name="resultFlag" type="radio">不合格</label>
                </div>
            </div>
            <div class="cl"></div>
          <div class="form-actions span12">
                  <c:if test="${not empty examRecord }">
                <input id="btnUpdateResultFlag" class="btn btn-primary" type="button" value="提交体检项目结果(10秒后自动提交)" data-second="10" onclick="doUpdateResultFlag()"/>&nbsp;
                  </c:if>

            </div>

        </c:if>
		       <div class="cl"></div>
	</div>

	</c:if>
    </div>


</body>
</html>