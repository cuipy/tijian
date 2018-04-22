<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检套餐管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/examinationPackage/">体检套餐列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationPackage/form?id=${examinationPackage.id}">体检套餐<shiro:hasPermission name="wshbj:examinationPackage:edit">${not empty examinationPackage.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationPackage:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>

	<div class="row">
	<form:form id="inputForm" modelAttribute="examinationPackage" action="${ctx}/wshbj/examinationPackage/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">价格：</label>
			<div class="controls">
				<form:input path="price" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><font color="red">*</font> 检查类别：</label>
			<div class="controls">

					<c:forEach items="${examinationCategoryList}" var="ec">
					<input type="radio" id="categoryId${ec.id}" name="categoryId" value="${ec.id}" class="required"
					<c:if test="${ec.id==examinationPackage.categoryId}">checked="checked"</c:if>
					/>
					<label for="categoryId${ec.id}">${ec.name}</label>&nbsp;&nbsp;&nbsp;
					</c:forEach>
				<span class="help-inline"> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">包含检查项目：</label>
				<div class="controls">

					<c:forEach items="${examinationItemList}" var="ei">
                    <input type="checkbox" id="itemId${ei.id}" name="itemId" value="${ei.id}" class="required"
                    <c:if test="${packageItems != null}">
                        <c:forEach items="${packageItems}" var="pi">
                            <c:if test="${pi.itemId== ei.id}">checked="checked"</c:if>
                        </c:forEach>
                    </c:if>
                    />
                    <label for="itemId${ei.id}">${ei.name}</label>&nbsp;&nbsp;&nbsp;
                    </c:forEach>

				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationPackage:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	</div>


</body>
</html>