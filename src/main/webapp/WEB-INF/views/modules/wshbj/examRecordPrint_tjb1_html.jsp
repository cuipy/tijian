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
    .tbl{width:100%;border-left:solid 1px #333;border-top:solid 1px #333}
    .tbl td{border-right:solid 1px #333;border-bottom:solid 1px #333;line-height:28px;text-align:center;}
    .tbl .td-label{width:12%;}
    .tbl .td-content{width:21.33%;}


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

	<div contenteditable="true" class="a4">
    <div class="content-div">
        <div class="tbl-top">
        <div class="tbl-head">
            <div class="title">石家庄市食品从业人员健康检查流程表</div>
            <div class="title2">
                <div class="t2-left">体检日期：<fmt:formatDate pattern='yyyy-MM-dd' value='${examRecord.examTime}' /></div>
                <div class="t2-right">
                    <div><img class="t2-tm-img img-code"></div>
                   <div class="t2-tm-code">${examRecord.code}</div>
                </div>
                <div class="cl"></div>
            </div>
        </div>

        <table class="tbl" cellspacing="0" cellpadding="0">
            <tr>
                <td class="td-label"> 姓名</td><td class="td-content">${examRecord.name}</td><td class="td-label">性别</td><td class="td-content">${examRecord.strSex}</td>
                <td class="td-label"> 年龄</td><td class="td-content">${examRecord.age}&nbsp;</td>
             </tr>
             <tr>
                <td> 行业</td><td>${examRecord.industryName}</td><td>岗位</td><td>${examRecord.postName}</td>
                <td> 联系电话</td><td>${examRecord.phoneNumber}&nbsp;</td>
             </tr>
              <tr> <td> 单位</td><td colspan="5" style="text-align:left;padding-left:10px;">${examRecord.organName}</td> </tr>

              <tr> <td> 序号</td> <td>检查项目</td><td colspan="3" >检查结果</td>  <td> 医师签名</td></tr>
              <c:forEach items="${examRecord.items}" var="it" varStatus="stat">
              <tr> <td> ${stat.count} </td> <td>${it.itemName}</td><td colspan="3" ></td>  <td> </td></tr>
              </c:forEach>
              <tr><td colspan="6" >
                <div style="padding-left:10px;padding-top:10px;line-height:30px;text-align:left;">便标本留样情况:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 已留 &nbsp; &nbsp; <input type="checkbox" disabled> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;未留 &nbsp; &nbsp; <input type="checkbox" disabled></div>

                 <div style="padding-right:50px;line-height:40px;text-align:right;">由服务台工作人员负责问询填写</div>

              </td></tr>
        </table>
        <div class="beizhu">
            <div style="display:inline-block;width:50px;height:60px;vertical-align:top;">注意：</div>
            <div style="display:inline-block;height:50px;vertical-align:top;">
                1、此流程表是您本次健康检查的项目，各项检查完毕后请将此表交回服务台。<br>
                2、体检机构应将此表存档备查。<br>
                3、交表时，请在表格相关位置填写联系电话。
            </div>
        </div>
        </div>  <!-- tbl-top end  -->

        <div class="tbl-bottom">
            <div class="tbl-head">
                <div class="title">石家庄市食品从业人员健康证领取凭证</div>
                <div class="title2">
                    <div class="t2-left">体检日期：<fmt:formatDate pattern='yyyy-MM-dd' value='${examRecord.examTime}' /></div>
                    <div class="t2-right">
                        <div><img id="img-code1" class="t2-tm-img img-code" ></div>
                         <div id="dv-code1" class="t2-tm-code">${examRecord.code}</div>
                    </div>
                    <div class="cl"></div>
                </div>
            </div>

            <table class="tbl" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="td-label"> 姓名</td><td class="td-content">${examRecord.name}</td><td class="td-label">性别</td><td class="td-content">${examRecord.strSex}</td>
                    <td class="td-label"> 年龄</td><td class="td-content">${examRecord.age}&nbsp;</td>
                 </tr>
                 <tr>
                    <td> 行业</td><td>${examRecord.industryName}</td><td>岗位</td><td>${examRecord.postName}</td>
                    <td> 联系电话</td><td>${examRecord.phoneNumber}&nbsp;</td>
                 </tr>
                  <tr> <td> 单位</td><td colspan="5" style="text-align:left;padding-left:10px;">${examRecord.organName}</td> </tr>
                  <tr> <td> 注意<br>事项</td><td colspan="5" style="text-align:left;padding-left:10px;">
                  1、凭此证领取健康合格证。<br>
                  2、健康合格证需由本人领取，单位组织体检领取健康合格证需出示代领人的有效证件。<br>
                  3、自体检次日起，五个工作日后领取健康合格证。<br>
                  4、如有疑问请拨打咨询电话：<br>
                  </td> </tr>

            </table>
        </div>

   	</div>



</body>
</html>