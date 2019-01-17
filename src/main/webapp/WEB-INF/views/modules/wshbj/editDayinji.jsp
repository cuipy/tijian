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

        function clkPrintA4Demo(){
            lodop_printA4('体检表DEMO', '${ctxhttp}/wshbj/exam_record_print/tjb1_html_demo');
        }

        function clkPrintBarcodeDemo(){
            lodop_printBarcode('条码Demo','${ctxhttp}/wshbj/exam_record_print/barcode_html?barcode=A1B2C3D4E5');
        }

        function clkPrintCardDemo(){
            lodop_printA4('健康证DEMO', '${ctxhttp}/wshbj/exam_record_print/zhizheng_html_demo');
        }

	</script>

</head>
<body>
<div class="breadcrumb form-search">
	<label>设置打印机</label>

	<ul class="ul-form">
		<li>
			&nbsp;A&nbsp;4&nbsp;打印机：<select id="sltA4Print" style="min-width:200px;"  onclick="lodop_setA4PrintIndex()"></select>
			&nbsp;&nbsp;&nbsp; <button onclick='clkPrintA4Demo()' type='button'> 测试打印A4 </button>
		</li>
	</ul>
	<ul class="ul-form">
	<li>
			条码打印机：<select id="sltBarcodePrint" style="min-width:200px;"  onclick="lodop_setBarcodePrintIndex()"></select>
			&nbsp;&nbsp;&nbsp; <button onclick='clkPrintBarcodeDemo()' type='button'> 测试打印条码 </button>
		</li>

 	</ul>
	<ul class="ul-form">
		<li>
			制卡打印机：<select id="sltCardPrint" style="min-width:200px;"  onclick="lodop_setCardPrintIndex()"></select>
			&nbsp;&nbsp;&nbsp; <button onclick='clkPrintCardDemo()' type='button'> 测试打印健康证 </button>
		</li>

	</ul>
</div>

</body>
</html>