<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
        var tree;
		$(document).ready(function(){
			var setting = {check:{enable:true,nocheckInherit:true},view:{selectedMulti:false},
					data:{simpleData:{enable:true}},callback:{beforeClick:function(id, node){
						tree.checkNode(node, !node.checked, true, true);
						return false;
					}}};
			
			// 用户-菜单
			var zNodes=[
					<c:forEach items="${itemList}" var="eitem">{id:"${eitem.id}", pId:"${eitem.pid}", name:"${eitem.name}", checked:"${eitem.checked}"},
		            </c:forEach>];
			// 初始化树结构
			tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
			// 不选择父节点
			tree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
			// 默认选择节点
			var ids = "${role.menuIds}".split(",");
			for(var i=0; i<ids.length; i++) {
				var node = tree.getNodeByParam("id", ids[i]);
				try{tree.checkNode(node, true, false);}catch(e){}
			}
			// 默认展开全部节点
			tree.expandAll(true);
            $("#roleId").attr("value", '${roleId}');
            $("#roleId").trigger('change');

		});


		function saveAssigning() {
		    var roleId = $('#roleId').val();
		    if(roleId==''){
                showTip('请选择角色', 'error');
                return false;
			}

            var itemIds = [], nodes = tree.getCheckedNodes(true);
            for(var i=0; i<nodes.length; i++) {
                if(!nodes[i].isParent){
                    itemIds.push(nodes[i].id);
				}
            }
            if(itemIds.length==0){
                showTip('请选择项目', 'error');
                return false;
            }
			var url = '${ctx}/wshbj/examinationItem/saveAssigning';
            $.post(url,{roleId:roleId,itemIds:itemIds},function (data) {
				if(data.code!=0){
                    showTip(data.msg, 'error');
				}else{
                    showTip(data.msg);
				}
            });
        }

        function roleOnChange(roleId) {
			if(roleId){
                tree.checkAllNodes(false);
                var url = '${ctx}/wshbj/examinationItem/getAuthorisedList';
                $.post(url,{roleId:roleId},function (data) {
                    if(data){
                        for(var i=0; i<data.length; i++) {
                            var node = tree.getNodeByParam("id", data[i].id);
                            try{tree.checkNode(node, true, false);}catch(e){}
                        }
                    }
                });
			}
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li  class="active"><a href="${ctx}/sys/role/">项目授权</a></li>
		<li><a href="${ctx}/wshbj/examinationItem/assigningList">授权列表</a></li>
	</ul><br/>
	<form:form id="inputForm" action="${ctx}/wshbj/examinationItem/saveAssigning" method="post" class="form-horizontal">
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">角色：</label>
			<div class="controls">
				<select id="roleId" class="input-xlarge required" onchange="roleOnChange(this.value);">
					<option value="">请选择</option>
					<c:forEach items="${roleList}" var="role">
						<option value="${role.id}">${role.name}</option>
					</c:forEach>
				</select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目授权:</label>
			<div class="controls">
				<div id="menuTree" class="ztree" style="margin-top:3px;float:left;"></div>
			</div>
		</div>
		<input type="hidden" name="itemIds" id="itemIds">
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationItem:assigning"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="saveAssigning();" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>