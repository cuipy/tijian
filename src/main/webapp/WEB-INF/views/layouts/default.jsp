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
        </style>
	<sitemesh:head/>
</head>
<body>
	<div id="main">
        <%@include file="/WEB-INF/views/include/top_menu.jsp" %>

        <div id="content">
            <table style="width:100%" border="0" cellspacing="0"  cellpadding="0">
                <tr><td id="left" style="width:160px;"> <%@include file="/WEB-INF/views/include/left_menu.jsp" %> </td>
            <td id="right" style="float:left">
            <sitemesh:body/>
            </td>
            </table>
            <div class="cl"></div>
        </div>
         <div id="footer" class="row-fluid">
            Copyright &copy; 2012-${fns:getConfig('copyrightYear')} ${fns:getConfig('productName')}
        </div>
    </div>
    	<script type="text/javascript">
    	var leftWidth = 160; // 左侧窗口大小
    	var tabTitleHeight = 33; // 页签的高度
        var htmlObj = $("html"), mainObj = $("#main");
        var headerObj = $("#header"), footerObj = $("#footer");
        var frameObj = $("#left, #openClose");
        function wSize(){
            var minHeight = 500, minWidth = 980;
            var strs = getWindowSize().toString().split(",");
            wSizeWidth();
        }
        function wSizeWidth(){
            if (!$("#openClose").is(":hidden")){
                var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
                $("#right").width($("#content").width()- leftWidth - $("#openClose").width() -30);
            }else{
                $("#right").width("100%");
            }
        }

        function wSize2(){
            if(window.leftWidth2 == undefined){
                return;
            }
            var inHeight= $("#right2 #officeContent").contents().find('html').height();
            var frameObj = $("#right2 #officeContent");
            $("#left2").width(leftWidth2);
            frameObj.width($('#right').width()-$('#left2').width()-30);
            frameObj.height(inHeight+20);
            $(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
        }
        $(function(){
            wSize2();
            $(window).on("resize",wSize2);
            $("#right2 #officeContent").on("load",wSize2);

        })

    	</script>
    	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>

</body>
</html>