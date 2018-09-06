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

    .tbl-top{height: 22mm;}
    .tbl-bottom{height: 15mm;}

    .idcard{width:90mm;height:50mm;}
    .idcard .content-div { position:relative;padding:3mm 5mm;height:100%;}
    .tbl{width: 83%;border:0px;}
    .tbl td{border:0px;text-align:left; font-family:'宋体'; font-size: 0.1mm;  }
    .tbl .td-label{}
    .tbl .td-content{text-align:left;font-size:11px;font-weight:bold;line-height: 0.2mm}


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

            <table  class="tbl" cellspacing="0" cellpadding="0">
                <tr>
                    <td class=" "  style="width:19mm;"></td>
                    <td class="td-content" style="width:15mm;line-height: 1mm">${examRecord.industryName}</td>
                    <td class="" style="text-align:center;font-size:11px;font-weight:bold;line-height: 0.1mm;"> </td>

                    <td rowspan="5" width="55px" style="padding-left: 0mm;margin-left: 0mm;"  > <img width="60px" height="70px;"  src="${examRecord.headImg}"/></td>
                    <td rowspan="5" width="50px"   style=" margin-left:-3mm; padding-left: -3mm"> <div id="barcode2"  ></div> </td>
                </tr>
                <tr>
                    <td ></td><td colspan="5" style="line-height: 1mm; margin: 0px ;padding: 0px; " class="td-content">${ examRecord.name}</td>
                 </tr>
                 <tr>
                     <td  ></td>
                     <td colspan="5" style="line-height: 1mm;; margin: 0px ;padding: 0px ;" class="td-content">${examRecord.strSex  }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${examRecord.age}</td>

                 </tr>
                <tr>
                    <td  ></td><td colspan="5" style="line-height: 1mm;; margin: 0px ;padding: 0px;" class="td-content"><fmt:formatDate value="${examRecord.zhizhengEndTime}" pattern="yyyy-MM-dd"/></td>
                 </tr>
                <tr><td style="line-height: 20mm" ></td></tr>

                <tr>
                    <td colspan="5"  style="text-align:left;font-size:11px;font-weight:bold;line-height: 6mm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${examRecord.code}</td>
                </tr>


            </table>
        </div>

   	</div>
    </div>
 </body>
</html>