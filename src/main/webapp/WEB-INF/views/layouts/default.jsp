<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
	<title><sitemesh:title/> </title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
<style type="text/css">
    #header {margin:0 0;position:static;}
    #footer {margin:8px 0 0 0;padding:3px 0 0 0;font-size:11px;text-align:center;border-top:2px solid #0663A2;}
    #footer, #footer a {color:#999;} #left{overflow-x:hidden;overflow-y:auto;} #left .collapse{position:static;}
    #userControl>li>a{/*color:#fff;*/text-shadow:none;} #userControl>li>a:hover, #user #userControl>li.open>a{background:transparent;}
    #left{vertical-align:top;}
    #right{vertical-align:top;background-image:url('${ctxStatic}/images/bg1.jpg');background-size:100% }
</style>
	<sitemesh:head/>
</head>
<body>
	<div id="main">
        <%@include file="/WEB-INF/views/include/top_menu.jsp" %>

        <div id="content">
            <table style="width:100%" border="0" cellspacing="0"  cellpadding="0">
                <tr><td id="left" style="width:160px;"> <%@include file="/WEB-INF/views/include/left_menu.jsp" %> </td>
            <td id="right">
            <sitemesh:body/>
            </td>
            </table>
            <div class="cl"></div>
        </div>
         <div id="footer" class="row-fluid">
            Copyright &copy; 2012-${fns:getConfig('copyrightYear')} ${fns:getConfig('productName')}
        </div>
    </div>


</body>
</html>