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
    .tbl-bottom{height: 29mm;}

    .idcard{width:90mm;height:57mm;}
    .idcard .content-div { position:relative;padding:3mm 5mm;height:100%;}
    .tbl{width:100%;border:0px;}
    .tbl td{border:0px;text-align:center; font-family:'宋体'; vertical-align:top}
    .tbl .td-label{font-size:5pt;height:14pt;}
    .tbl .td-content{text-align:left;font-size:5pt;font-weight:bold;}


    .tbl-head .title{text-align:center;font-size:15px;font-weight:bold;color:#7B68EE}
    .t2-left{float:left;height:50px;}
    .t2-right{float:right;height:50px;}
    .t2-tm-img{height:30px;}
    .t2-tm-code{text-align:center;height:20px;}

    .beizhu {padding:20px;}
    </style>

    <script type="text/javascript">
    $(function(){
        var code1=$('#dv-code1').text();
        $("#barcode2").qrcode({width:54,height:54, "text":"http://c.guoxue.com/d?code=${examRecord.code}"});
    })
    </script>
</head>
<body>

	<div class="idcard">
    <div class="content-div">
        <div class="tbl-top"> </div>  <!-- tbl-top end  -->

        <div class="tbl-bottom">
            <div class="tbl-head">
                <div class="title">河北省食品药品从业人员健康合格证明</div>
            </div>

            <table class="tbl" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="td-label" style="width:14mm;">姓&nbsp;&nbsp;名:</td><td class="td-content">${examRecord.name}</td>
                    <td class="td-label"  style="width:14mm;">性&nbsp;&nbsp;别:</td><td class="td-content">${examRecord.strSex}</td>
                    <td rowspan="3" class="td-barcard2" style="width:14mm;"> <div id="barcode2"></div> </td>
                    <td rowspan="5" class="td-headimg" style="width:16mm;">
                    <img style="width:100%;" src="${examRecord.headImg}"></td>
                </tr>
                <tr>
                    <td class="td-label">从业类别:</td><td colspan="3" class="td-content">${examRecord.industryName}&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="td-label">证&nbsp;&nbsp;号:</td><td colspan="3" class="td-content">${examRecord.code}&nbsp;</td>
                  </tr>
                <tr>
                    <td class="td-label">有效期至:</td><td colspan="4" class="td-content">${examRecord.age}&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="td-label">体检单位:</td><td colspan="4" class="td-content">${examRecord.organName}&nbsp;</td>
                  </tr>

            </table>
        </div>

   	</div>

</body>
</html>