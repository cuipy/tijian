<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检记录管理</title>
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
            $("input[name='itemType']:radio").change(function() {
                if($(this).val()=='1'){
                    $('#packageIdDiv').show();
                    $('#itemsDiv').hide();
				}else {
                    $('#packageIdDiv').hide();
                    $('#itemsDiv').show();
				}
            });
            <c:choose>
				<c:when test="${not empty examinationRecord.id}">
					 $("input[name='itemType'][value=${examinationRecord.itemType}]").attr("checked",true);
				</c:when>
				<c:otherwise>
					$("input[name='itemType'][value='1']").attr("checked",true);
				</c:otherwise>
            </c:choose>



            $('#examinationCode').bind('keypress',function(event){
                if(event.keyCode == 13) {
                    loadRecord();
                    //防止form提交
                    return false;
                }
            });
        });

		function loadRecord() {
            var examinationCode = $('#examinationCode').val();
            if(examinationCode==''){
                return;
			}
            var examinationFlag = $("input[name='examinationFlag']:checked").val();
            var url = '${ctx}/wshbj/examinationRecord/getMapByCode4Result';
            $.post(url,{code:examinationCode,examinationFlag:examinationFlag},function (data) {
                if(data){
                    $('#recordId').val(data.id);
                    $('#userName').val(data.name);
                    $('#sex').val(data.sexLabel);
                    $('#organ').val(data.organName);
                    $('#examinationRecordItemList').empty();
                    examinationRecordItemRowIdx = 0;
                    if(data.examinationRecordItemList){
                        for (var i=0; i<data.examinationRecordItemList.length; i++){
                            addRow('#examinationRecordItemList', examinationRecordItemRowIdx, examinationRecordItemTpl, data.examinationRecordItemList[i]);
                            examinationRecordItemRowIdx = examinationRecordItemRowIdx + 1;
                        }
					}

                }
            });
        }

		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: false, row: row
			}));
			var dicSelect = $('#examinationRecordItem'+idx).find("select")[0];
			var dictList = row.dictList;
			$.each(dictList,function (index,dict) {
			    var selected = dict.defaultFlag == '1';
				$(dicSelect).append('<option value="'+dict.id+'" selected="'+selected+'">'+dict.name+'</option>');

                //$('#examinationRecordItem'+idx+'_remarks').val(dict.remarks);
            });
			if(row.examinationFlag=='1'){
                $('#examinationRecordItem'+idx+'_examinationFlag').text('初检');
			}else if(row.examinationFlag=='2'){
                $('#examinationRecordItem'+idx+'_examinationFlag').text('复检');
            }
		}

		function submitForm() {
			if(examinationRecordItemRowIdx==0){
                showTip('缺少体检项目','error');
			    return;
			}

			var recordItemIds = [],resultDictIds = [],remarksArray = [];
			for (var i=0;i<examinationRecordItemRowIdx;i++){
                recordItemIds.push($('#examinationRecordItem'+i+'_recordItemId').val());
                resultDictIds.push($('#examinationRecordItem'+i+'_resultId').val());
                remarksArray.push($('#examinationRecordItem'+i+'_remarks').val());
			}
			var url = '${ctx}/wshbj/examinationRecord/saveResult';
			var params = {
			    recordId:$('#recordId').val(),
                recordItemIds:recordItemIds,
                resultDictIds:resultDictIds,
                remarksArray:remarksArray
			}
			$.post(url,params,function (data) {
				if(data.code=='0'){
                    showTip('保存成功','success');
				}else{
                    showTip(data.msg,'error');
				}
            });
        }


	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/inputResult">体检结果录入</a></li>
	</ul><br/>
	<form:form id="inputForm"   class="form-horizontal">
		<input type="hidden" id="recordId"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">编号：</label>
			<div class="controls">
				<input id="examinationCode" name="examinationCode" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"></label>
			<div class="controls">
				<input type="radio" id="examinationFlag1" name="examinationFlag" value="1" CHECKED onchange="loadRecord();"/><label for="examinationFlag1">初检</label>
				<input type="radio" id="examinationFlag2" name="examinationFlag" value="2" onchange="loadRecord();"/><label for="examinationFlag2">复检</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<input id="userName" name="userName" readonly class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
				<input id="sex" name="sex" readonly class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">单位：</label>
			<div class="controls">
				<input id="organ" name="organ" readonly class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="itemsDiv" >
			<label class="control-label">检查项目列表：</label>
			<div class="controls">
				<table id="contentTable" class="table table-striped table-bordered table-condensed">
					<thead>
					<tr>
						<th width="150">检查项目</th>
						<th width="100">初检/复检</th>
						<th width="100">结果</th>
						<th>结果备注</th>
					</tr>
					</thead>
					<tbody id="examinationRecordItemList">
					</tbody>
				</table>
				<script type="text/template" id="examinationRecordItemTpl">//<!--
					<tr id="examinationRecordItem{{idx}}">
						<td>
							<input id="examinationRecordItem{{idx}}_recordItemId" name="examinationRecordItem[{{idx}}]_recordItemId" type="hidden" value="{{row.recordItemId}}"/>
							<input id="examinationRecordItem{{idx}}_itemName" name="examinationRecordItem[{{idx}}]_itemName" type="text" value="{{row.itemName}}"/>
						</td>
						<td>
							<span id="examinationRecordItem{{idx}}_examinationFlag"></span>
						</td>
						<td>
							<select id="examinationRecordItem{{idx}}_resultId" name="examinationRecordItem[{{idx}}]_resultId"  class="input-small required">
							</select>
						</td>
						<td>
							<input id="examinationRecordItem{{idx}}_remarks" name="examinationRecordItem[{{idx}}]_remarks" type="text"  class="input-xlarge ">{{row.remarks}}</textarea>
						</td>

					</tr>//-->
				</script>
				<script type="text/javascript">
                    var examinationRecordItemRowIdx = 0, examinationRecordItemTpl = $("#examinationRecordItemTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
				</script>
			</div>
		</div>




		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="submitForm();" value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>