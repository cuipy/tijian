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
			<label class="control-label">检查类别：</label>
			<div class="controls">
				<form:select path="categoryId" class="input-xlarge required" dataMsgRequired="必填信息">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${examinationCategoryList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
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
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>检查项目</th>
								<th>备注</th>
								<shiro:hasPermission name="wshbj:examinationPackage:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="packageItemList">
						</tbody>
						<shiro:hasPermission name="wshbj:examinationPackage:edit"><tfoot>
							<tr><td colspan="4"><a href="javascript:" onclick="addRow('#packageItemList', packageItemRowIdx, packageItemTpl);packageItemRowIdx = packageItemRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="packageItemTpl">//<!--
						<tr id="packageItemList{{idx}}">
							<td class="hide">
								<input id="packageItemList{{idx}}_id" name="packageItemList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="packageItemList{{idx}}_delFlag" name="packageItemList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<select id="packageItemList{{idx}}_itemId" name="packageItemList[{{idx}}].itemId" data-value="{{row.itemId}}" class="input-small required">
									<option value="">请选择</option>
									<c:forEach items="${examinationItemList}" var="examinationItem">
										<option value="${examinationItem.id}">${examinationItem.name}</option>
									</c:forEach>
								</select>
							</td>
							<td>
								<input id="packageItemList{{idx}}_remarks" name="packageItemList[{{idx}}].remarks" type="text" value="{{row.remarks}}" maxlength="255" class="input-xxlarge "/>
							</td>
							<shiro:hasPermission name="wshbj:examinationPackage:edit"><td class="text-center" width="20">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#packageItemList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var packageItemRowIdx = 0, packageItemTpl = $("#packageItemTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(examinationPackage.packageItemList)};
							for (var i=0; i<data.length; i++){
								addRow('#packageItemList', packageItemRowIdx, packageItemTpl, data[i]);
								packageItemRowIdx = packageItemRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationPackage:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>