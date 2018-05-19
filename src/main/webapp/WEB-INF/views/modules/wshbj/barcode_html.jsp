<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检记录管理</title>
	<meta name="decorator" content="print"/>

    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jsbarcode/JsBarcode.all.js" type="text/javascript"></script>
    <style type="text/css">
    body{margin:0px;}
    div,table{box-sizing:border-box;}
    .cl{clear:both;}

    .tbl-barcode{width:50px;border:0px;}


    </style>

    <script type="text/javascript">
    $(function(){
        var code1=$('#dv-code1').text();
        JsBarcode(".img-code", code1, {
        			  format:"CODE128",
        			  displayValue:false,
        			  height:50,margin:0
        			});
    })
    </script>
</head>
<body>
<table class="tbl-barcode" cellspacing="0" cellpadding="0">
<tr><td><img style="" class="t2-tm-img img-code"></td></tr>
<tr><td id="dv-code1" class="t2-tm-code">${barcode}</td></tr>
</table>


</body>
</html>