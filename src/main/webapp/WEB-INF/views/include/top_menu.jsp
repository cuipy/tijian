<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
    String uri = request.getRequestURI();
    pageContext.setAttribute("uri",uri);
%>
<div id="header" class="navbar navbar-fixed-top" style="background: url(${ctxStatic}/images/style2/topbg.gif) repeat-x;">
    <div class="topleft">
        <a href="main.html" target="_parent"><img src="${ctxStatic}/images/style2/logo.png" title="系统首页" /></a>
    </div>

    <ul class="nav-top">
        <li><a href="default.html" target="rightFrame" class="selected"><img src="${ctxStatic}/images/style2/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
        <li><a href="imgtable.html" target="rightFrame"><img src="${ctxStatic}/images/style2/icon02.png" title="模型管理" /><h2>模型管理</h2></a></li>
        <li><a href="imglist.html"  target="rightFrame"><img src="${ctxStatic}/images/style2/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
        <li><a href="tools.html"  target="rightFrame"><img src="${ctxStatic}/images/style2/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
        <li><a href="computer.html" target="rightFrame"><img src="${ctxStatic}/images/style2/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
        <li><a href="tab.html"  target="rightFrame"><img src="${ctxStatic}/images/style2/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>
    </ul>

    <div class="topright">
        <ul>
            <li><span><img src="${ctxStatic}/images/style2/help.png" title="帮助"  class="helpimg"/></span>
                <a href="#">帮助</a></li>
            <li><a href="#">关于</a></li>
            <li><a href="login.html" target="_parent">退出</a></li>
        </ul>

        <div class="user">
            <span>admin</span>
            <i>消息</i>
            <b>5</b>
        </div>

    </div>
    <div class="cl"></div>

</div>