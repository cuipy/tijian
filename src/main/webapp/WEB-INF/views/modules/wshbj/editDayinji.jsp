<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>打印机设置</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/websocket/reconnecting-websocket.js" type="text/javascript"></script>
	<script src="${ctxStatic}/websocket/web_socket.js" type="text/javascript"></script>
	<script type="text/javascript">
        $(function() {
            setInterval(focusExamRecordCode, 2000);
            setTimeout("lodop_check()",300);
        });

        function focusExamRecordCode(){
            $("#examRecordCode").focus();



        }

	</script>

</head>
<body>
<div class="breadcrumb form-search">
	<label>设置打印机</label>

	<ul class="ul-form">
		<li>
			&nbsp;A&nbsp;4&nbsp;打印机：<select id="sltA4Print" style="min-width:200px;"  onclick="lodop_setA4PrintIndex()"></select>
		</li>
	</ul>
	<ul class="ul-form">
	<li>
			条码打印机：<select id="sltBarcodePrint" style="min-width:200px;"  onclick="lodop_setBarcodePrintIndex()"></select>
		</li>

 	</ul>
	<ul class="ul-form">
		<li>
			制卡打印机：<select id="sltCardPrint" style="min-width:200px;"  onclick="lodop_setCardPrintIndex()"></select>
		</li>

	</ul>
</div>

</body>
</html>