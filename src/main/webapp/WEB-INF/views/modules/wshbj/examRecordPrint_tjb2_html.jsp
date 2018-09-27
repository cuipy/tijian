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

    .tbl-top{height: 191mm;}
    .tbl-bottom{height: 80mm;}

    .a4{width:210mm;height:297mm;border:solid 1px #ccc;}
    .a4 .content-div { position:relative;padding:12.7mm;height:100%;}
    .tbl{width:100%;border-left:solid 0px #333;border-top:solid 0px #333}
    .tbl td{border-right:solid 0px #333;border-bottom:solid 0px #333;line-height:28px;text-align:center;}
    .tbl .td-label{width:10%;}
    .tbl .td-content{width:10%;}
    .tb2{width:100%;border-left:solid 1px #333;border-top:solid 1px #333}
    .tb2 td{border-right:solid 1px #333;border-bottom:solid 1px #333;line-height:28px;text-align:center;}
    .tb2 .td-label{width:10%;}
    .tb2 .td-content{width:10%;}

    .tbl-head{height:20mm;}
    .tbl-head .title{text-align:center;font-size:22px;font-weight:bold;}
    .t2-left{float:left;height:50px;}
    .t2-right{float:right;height:50px;}
    .t2-tm-img{height:30px;}
    .t2-tm-code{text-align:center;height:20px;}

    .beizhu {padding:20px;}
    </style>

    <script type="text/javascript">
    $(function(){
        var code1=$('#dv-code1').text();
        JsBarcode(".img-code", code1, {
        			  format:"CODE128",
        			  displayValue:false,
        			  height:30,margin:0
        			});
    })
    </script>
</head>
<body>

	<div class="a4"  contenteditable="true">
    <div class="content-div">
        <div class="tbl-top">
        <div class="tbl-head">
            <div class="title">河北省从业人员健康检查表</div>
            <div class="title2">
                <div class="t2-left">体检日期：<fmt:formatDate pattern='yyyy-MM-dd' value='${examRecord.examTime}' /></div>
                <div class="t2-right">
                    <div><img class="t2-tm-img img-code"></div>
                    <div class="t2-tm-code" >编号： <font id="dv-code1" >${examRecord.code}</font></div>
                </div>
                <div class="cl"></div>
            </div>
        </div>
<br>
        <table class="tbl" cellspacing="0" cellpadding="0">
            <tr> <td> 单位</td><td colspan="7" style="text-align:left;padding-left:10px;border-bottom:solid 1px #333;">${examRecord.organName}</td>
                <td>单位性质</td><td colspan="1" style="text-align:left;padding-left:10px;border-bottom:solid 1px #333;"></td>
            </tr>

            <tr>
                <td class="td-label"> 姓名</td><td class="td-content" style="border-bottom:solid 1px #333;">${examRecord.name}</td>
                <td class="td-label">性别</td><td class="td-content" style="border-bottom:solid 1px #333;">${examRecord.strSex}</td>
                <td class="td-label"> 年龄</td><td class="td-content" style="border-bottom:solid 1px #333;">${examRecord.age}</td>
                <td class="td-label"> 民族</td><td class="td-content" style="border-bottom:solid 1px #333;"> &nbsp;</td>
                <td class="td-label"> 文化程度</td><td class="td-content" style="border-bottom:solid 1px #333;"> &nbsp;</td>
             </tr>
             <tr>
                 <td>岗位</td><td colspan="2" style="border-bottom:solid 1px #333;">${examRecord.postName}</td>
                 <td> 工龄</td><td colspan="2" style="border-bottom:solid 1px #333;"> &nbsp;</td>
                 <td> 身份证号</td><td colspan="3" style="border-bottom:solid 1px #333;">${examRecord.idNumber}&nbsp;</td>
             </tr>
        </table>
<br>
            <table class="tb2" cellspacing="0" cellpadding="0">
                <tr>
                    <td rowspan="2" class="td-content"> 既往史</td>
                    <td class="td-content">病名</td>
                    <td class="td-content">肝类</td>
                    <td class="td-content">痢疾</td>
                    <td class="td-content">伤寒</td>
                    <td class="td-content">肺结核</td>
                    <td class="td-content">皮肤病</td>
                    <td class="td-content">其它</td>
                </tr>

                <tr>
                    <td class="td-content">患病时间</td>
                    <td class="td-content">&nbsp;</td>
                    <td class="td-content">&nbsp;</td>
                    <td class="td-content">&nbsp;</td>
                    <td class="td-content">&nbsp;</td>
                    <td class="td-content">&nbsp;</td>
                    <td class="td-content">&nbsp;</td>

                </tr>
                <tr>
                    <td colspan="1" rowspan="4" class="td-content"> 体征</td>
                    <td class="td-content">心</td>
                    <td colspan="2" class="td-content">&nbsp;</td>
                    <td class="td-content">肝</td>
                    <td colspan="3" class="td-content">&nbsp;</td>
                 </tr>
                <tr>
                    <td class="td-content">肺</td>
                    <td colspan="2" class="td-content">&nbsp;</td>
                    <td class="td-content">脾</td>
                    <td colspan="3" class="td-content">&nbsp;</td>
                </tr>
                <tr>
                    <td class="td-content">皮肤</td>
                    <td colspan="6" class="td-content">&nbsp;</td>
                  </tr>
                <tr>
                    <td class="td-content">其它</td>
                    <td colspan="2" class="td-content">&nbsp;</td>
                    <td class="td-content">医师签字</td>
                    <td colspan="3" class="td-content">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="1" rowspan="2" class="td-content"> 视力及辨色力（直接接触药品质量检验.验收.养护人员）
                    </td>
                    <td class="td-content">视力</td>
                    <td colspan="6" class="td-content">&nbsp;</td>
                </tr>
                <tr>
                    <td class="td-content">辨色力</td>
                    <td colspan="2" class="td-content">&nbsp;</td>
                    <td class="td-content">医师签字</td>
                    <td colspan="3" class="td-content">&nbsp;</td>
                </tr>

                <tr>
                    <td colspan="1" class="td-content">X线胸透或胸部拍片</td>
                    <td colspan="3" class="td-content">&nbsp;</td>
                    <td class="td-content">医师签字</td>
                    <td colspan="3" class="td-content">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="1" rowspan="8" class="td-content">实验室检查化验单附后</td>
                    <td colspan="2" class="td-content">检查项目</td>
                    <td colspan="2" class="td-content">检查结果</td>
                    <td colspan="3" class="td-content">检验师签字</td>
                 </tr>
                <tr>
                     <td rowspan="3" class="td-content">大便培养</td>
                    <td colspan="1" class="td-content">痢疾杆菌</td>
                    <td colspan="2" class="td-content">&nbsp;</td>
                    <td colspan="3" rowspan="3" class="td-content">&nbsp;</td>
                </tr>
                <tr>
                     <td colspan="1" class="td-content" style="font-size: 14px">伤寒或副伤寒</td>
                    <td colspan="2" class="td-content">&nbsp;</td>
                 </tr>
                <tr>
                     <td colspan="1" class="td-content">阿米巴原虫</td>
                    <td colspan="2" class="td-content">&nbsp;</td>
                 </tr>

                <tr>
                    <td rowspan="3" class="td-content">肝功能</td>
                    <td colspan="1" class="td-content">谷丙转氨酶</td>
                    <td colspan="2" class="td-content">&nbsp;</td>
                    <td colspan="3" rowspan="4" class="td-content">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="1" class="td-content">HAV-IgM*</td>
                    <td colspan="2" class="td-content">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="1" class="td-content">HEV-IgM*</td>
                    <td colspan="2" class="td-content">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" class="td-content">梅毒</td>
                     <td colspan="2" class="td-content">&nbsp;</td>
                 </tr>
                <tr>
                    <td class="td-content" height="100px;">检查结论</td>
                    <td colspan="9" class="td-content" style="text-align: right; vertical-align: bottom; ">&nbsp;主检医师签名：
                        年              月                日</td>
                </tr>
            </table>

            <div class="beizhu">
             <div style="display:inline-block;height:50px;vertical-align:top;">
                *说明：发现谷丙转氨酶异常的，方加做HAV-IgM,HEV-IgM两个指标。
            </div>
        </div>
        </div>


   	</div>



</body>
</html>