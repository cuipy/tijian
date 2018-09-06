<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检记录管理</title>
	<meta name="decorator" content="print"/>

    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jsbarcode/JsBarcode.all.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jsbarcode/jquery.qrcode.min.js" type="text/javascript"></script>
    <style type="text/css">
    body{margin:0px;}
    div,table{box-sizing:border-box;}
    .cl{clear:both;}

    .tbl-top{height: 23mm;}
    .tbl-bottom{height: 15mm;}

    .idcard{width:90mm;height:50mm;}
    .idcard .content-div { position:relative;padding:3mm 5mm;height:100%;}
    .tbl{width: 90%;border:0px;}
    .tbl td{border:0px;text-align:center; font-family:'宋体'; font-size: 0.1mm; vertical-align:top}
    .tbl .td-label{}
    .tbl .td-content{text-align:left;font-size:11px;font-weight:bold;line-height: 0.1mm}


    .tbl-head .title{text-align:center;font-size:11px;font-weight:bold;color:#7B68EE;}
    .t2-left{float:left;height:40px;}
    .t2-right{float:right;height:40px;}
    .t2-tm-img{height:25px;}
    .t2-tm-code{text-align:center;height:15px;}

    .beizhu {padding:20px;}
    </style>
    <script type="text/javascript">
        $('#body').css('transform','rotateX(90deg)');
        $('#body').css('-webkit-transform','rotateX(90deg)');
        $('#body').css('-moz-transform','rotateX(90deg)');
     $(function(){
         var code1=$('#dv-code1').text();
        $("#barcode2").qrcode({width:50,height:50, "text":"http://localhost:8080/tijian"});
    })
    </script>
</head>
<body id="body">
 	<div class="idcard">
    <div class="content-div">
        <div class="tbl-top"> </div>  <!-- tbl-top end  -->

        <div class="tbl-bottom">
            <div class="tbl-head">
                <div class="title"></div>
            </div>

            <table class="tbl" cellspacing="0" cellpadding="0">
                <tr>
                    <td class=" " style="width:14mm;"></td>
                    <td class="td-content" style="width:22mm">${examRecord.name}</td>
                    <td class="" style="text-align:center;font-size:11px;font-weight:bold;line-height: 0.1mm;">${examRecord.strSex}</td>
                     <td rowspan="5"  style="width: 10mm; padding: 0; margin: 0"> <div id="barcode2"></div> </td>
                    <td rowspan="5" style="padding: 0; margin: 0"><img style="height:20mm;" src="${examRecord.headImg}"/></td>
                </tr>
                <tr>
                    <td ></td><td colspan="5" style="height: 0.1mm; margin: 0px ;padding: 0px; " class="td-content">${ examRecord.industryName}</td>
                 </tr>
                 <tr>
                     <td  ></td><td colspan="5" style="height: 0.1mm; margin: 0px ;padding: 0px ;" class="td-content">${examRecord.code}</td>
                  </tr>
                <tr>
                    <td  ></td><td colspan="5" style="height: 0.1mm; margin: 0px ;padding: 0px;" class="td-content"><fmt:formatDate value="${examRecord.zhizhengEndTime}" pattern="yyyy-MM-dd"/></td>
                 </tr>
                 <tr>
                     <td ></td><td colspan="5"  style="height: 0mm; margin: 0px ;padding: 0px;" class="td-content">${examRecord.organName}</td>
                  </tr>

            </table>
        </div>

   	</div>
    </div>
 </body>
</html>