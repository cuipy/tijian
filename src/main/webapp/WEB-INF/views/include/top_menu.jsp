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
        <c:forEach items="${fns:listTopMenu(pageScope.uri)}" var="menu" varStatus="idxStatus">
            <c:if test="${ menu.isShow eq '1'}"><li><a data-id="${menu.id}"
                class="${menu.actived ? ' selected' : ''}" href="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${menu.href}">
                <img src="${ctxStatic}/images/style2/icon0${idxStatus.count}.png" title="${menu.name}" /><h2>${menu.name}</h2></a></li></c:if>
        </c:forEach>
    </ul>

    <div class="topright">
        <ul>
            <li><span><img src="${ctxStatic}/images/style2/help.png" title="帮助"  class="helpimg"/></span>
                <a href="#">帮助</a></li>
            <li><a href="#">关于</a></li>
            <li><a href="${ctx}/logout" title="注销登录">退出</a></li>
        </ul>

        <div class="user">
            <span>${fns:getUser().name}</span>
            <i>消息</i>
            <b>5</b>
        </div>

    </div>
    <div class="cl"></div>

</div>