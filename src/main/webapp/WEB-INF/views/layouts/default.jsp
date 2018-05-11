<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
	<title><sitemesh:title/> </title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
		<style type="text/css">
            #main {padding:0;margin:0;} #main .container-fluid{padding:0 4px 0 6px;}
            #header {margin:0 0 8px;position:static;} #header li {font-size:14px;_font-size:12px;}
            #header .brand {font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:26px;padding-left:33px;}
            #footer {margin:8px 0 0 0;padding:3px 0 0 0;font-size:11px;text-align:center;border-top:2px solid #0663A2;}
            #footer, #footer a {color:#999;} #left{overflow-x:hidden;overflow-y:auto;} #left .collapse{position:static;}
            #userControl>li>a{/*color:#fff;*/text-shadow:none;} #userControl>li>a:hover, #user #userControl>li.open>a{background:transparent;}
        </style>
	<sitemesh:head/>
</head>
<body>
	<div id="main">
        <%@include file="/WEB-INF/views/include/top_menu.jsp" %>

        <div class="container-fluid">
            <div id="content" class="row-fluid">
                <div id="left" style="width:160px;min-height:300px;">
                <%@include file="/WEB-INF/views/include/left_menu.jsp" %>
                </div>
                <div id="openClose" class="close" style="min-height:300px;">&nbsp;</div>
                <div id="right" style="float:left">
	            <sitemesh:body/>
	            </div>
                <div class="cl"></div>
    		</div>
    		 <div id="footer" class="row-fluid">
                Copyright &copy; 2012-${fns:getConfig('copyrightYear')} ${fns:getConfig('productName')}
            </div>
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

	<script type="text/javascript">//<!-- 无框架时，左上角显示菜单图标按钮。
		if(!(self.frameElement && self.frameElement.tagName=="IFRAME")){
			$("body").prepend("<i id=\"btnMenu\" class=\"icon-th-list\" style=\"cursor:pointer;float:right;margin:10px;\"></i><div id=\"menuContent\"></div>");
			$("#btnMenu").click(function(){
				top.$.jBox('get:${ctx}/sys/menu/treeselect;JSESSIONID=<shiro:principal property="sessionid"/>', {title:'选择菜单', buttons:{'关闭':true}, width:300, height: 350, top:10});
				//if ($("#menuContent").html()==""){$.get("${ctx}/sys/menu/treeselect", function(data){$("#menuContent").html(data);});}else{$("#menuContent").toggle(100);}
			});
		}//-->

	</script>
</body>
</html>