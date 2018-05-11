<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
    String uri = request.getRequestURI();
    pageContext.setAttribute("uri",uri);
%>
<div id="header" class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="brand"><span id="productName">${fns:getConfig('productName')}</span></div>
        <ul id="userControl" class="nav pull-right">
            <li id="themeSwitch" class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="主题切换"><i class="icon-th-large"></i></a>
                <ul class="dropdown-menu">
                    <c:forEach items="${fns:getDictList('theme')}" var="dict">
                    <li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>
                    <li><a href="javascript:cookie('tabmode','${tabmode eq '1' ? '0' : '1'}');location=location.href">${tabmode eq '1' ? '关闭' : '开启'}页签模式</a></li>
                </ul>
                <!--[if lte IE 6]><script type="text/javascript">$('#themeSwitch').hide();</script><![endif]-->
            </li>
            <li id="userInfo" class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="个人信息">您好, ${fns:getUser().name}&nbsp;<span id="notifyNum" class="label label-info hide"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="${ctx}/sys/user/info" target="mainFrame"><i class="icon-user"></i>&nbsp; 个人信息</a></li>
                    <li><a href="${ctx}/sys/user/modifyPwd" target="mainFrame"><i class="icon-lock"></i>&nbsp;  修改密码</a></li>
                    <li><a href="${ctx}/oa/oaNotify/self" target="mainFrame"><i class="icon-bell"></i>&nbsp;  我的通知 <span id="notifyNum2" class="label label-info hide"></span></a></li>
                </ul>
            </li>
            <li><a href="${ctx}/logout" title="退出登录">退出</a></li>
            <li>&nbsp;</li>
        </ul>

        <div class="nav-collapse">
            <ul id="menu" class="nav" style="*white-space:nowrap;float:none;">
                <c:set var="firstMenu" value="true"/>
                <c:forEach items="${fns:listTopMenu(pageScope.uri)}" var="menu" varStatus="idxStatus">
                <c:if test="${ menu.isShow eq '1'}"><li class="menu ${menu.actived ? ' active' : ''}">
                   <a class="menu" href="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${menu.href}" data-id="${menu.id}" target="mainFrame"><span>${menu.name}</span></a>
                </li>
                <c:if test="${firstMenu}">
                    <c:set var="firstMenuId" value="${menu.id}"/>
                </c:if><c:set var="firstMenu" value="false"/>
                </c:if>
                </c:forEach>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>