<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新增制证数量编号</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		 // ajax form方式提交保存
        function do_sumbit(status){
             $("#msg").hide().html('');
            $("#inputForm").ajaxSubmit(function(d1r){
                if(d1r == null||d1r.state==null){
                     $("#msg").show();
                     $("#msg").html('由于未知原因，提交失败\n'+d1r);
                    return;
                }
                if(d1r.state != 1){
                    $("#msg").show();
                    $("#msg").html(d1r.state+":"+d1r.msg);
                    return;
                }
                alert(d1r.state+":"+d1r.msg);
                location.href="${ctx}/wshbj/zhizhengAddRecord/list";
            });
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/zhizhengAddRecord/list">制证数管理列表</a></li>
		<shiro:hasPermission name="wshbj:zhizhengAddRecord:edit">
			<li  class="active"><a href="${ctx}/wshbj/zhizhengAddRecord/add">增加制证数</a></li>
		</shiro:hasPermission>
	</ul>

	<div class="box1">
	<div id="msg" class="alert alert-danger" style="display:none" ></div>

	<form:form id="inputForm" modelAttribute="zhizhengAddRecord" action="${ctx}/wshbj/zhizhengAddRecord/ajax_add" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group span12">
            <label class="control-label">体检中心ID：</label>
            <div class="controls">
                ${ownerId}
                <span class="help-inline"> </span>
            </div>
        </div>
        <div class="cl"></div>
        <div class="control-group span12">
            <label class="control-label">种子编码：</label>
            <div class="controls">
                ${currAddCode}
                <span class="help-inline"> </span>
            </div>
        </div>
        <div class="cl"></div>
        <div class="control-group span12">
            <label class="control-label">剩余制证数量：</label>
            <div class="controls">
                ${currResultCount}
                <span class="help-inline"> </span>
            </div>
        </div>
        <div class="cl"></div>
		<div class="control-group span12">
			<label class="control-label">制证编号：</label>
			<div class="controls">
				<form:input path="add_code" htmlEscape="false" maxlength="45" class="input-xxlarge"  />
				<span class="help-inline"> </span>
			</div>
		</div>

		<div class="form-actions span12">
			<shiro:hasPermission name="wshbj:zhizhengAddRecord:edit">
			<input id="btnSubmit" class="btn btn-primary" type="button" onclick="do_sumbit()" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		<div class="cl"></div>
	</form:form>
    </div>

    </div>

</body>
</html>