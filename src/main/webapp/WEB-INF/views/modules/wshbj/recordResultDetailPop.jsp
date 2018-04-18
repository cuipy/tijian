<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检项目明细</title>
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



        function setUserPro(data) {
            $('#userName').val(data.name);
            $('#userId').val(data.id);
            $('#idNumber').val(data.idNumber);
            $('#phoneNumber').val(data.phoneNumber);
            $('#birthday').val(data.birthday);

            $("#sex").attr("value", data.sex);
            $("#sex").trigger('change');

            $("#organId").attr("value", data.organId);
            $("#organId").trigger('change');

            $("#industryId").attr("value", data.industryId);
            $("#industryId").trigger('change');

            $("#postId").attr("value", data.postId);
            $("#postId").trigger('change');
        }

        function searchRecords() {
            var url = '${ctx}/wshbj/examinationRecord/getListMap4Result';
            $.ajax({
                url: url,
                type: "POST",
                data: $("#inputForm").serialize(),//核心代码，form表单序列化
                dataType: "JSON",
                success: function(data) {
                    $('#recordList').find('tr').remove();
                    recordRowIdx = 0;
                    $('#resultDictList').find('tr').remove();
                    resultDictRowIdx = 0;
                    if(data){
                        $.each(data,function (index,sample) {
                            addRow('#recordList', recordRowIdx, recordTpl, sample);
                            recordRowIdx = recordRowIdx + 1;
                        })

                        $('#recordList').find('[name=itemIdRadio]:radio')[0].click();
                    }
                }
            });

        }


        function addRow(list, idx, tpl, row){
            $(list).append(Mustache.render(tpl, {
                idx: idx, delBtn: false, row: row
            }));

            $(list+idx).find('td:gt(0):lt(2)').click(function () {
                $(list+idx).find('[name=itemIdRadio]:radio').click();

            });
        }


        function itemIdRadioChange(iddom) {
            $('#resultDictList').find('tr').remove();
            resultDictRowIdx = 0;

			var url = "${ctx}/wshbj/examinationRecord/getItemListMap4Result";
			$.post(url,{recordId:$(iddom).val()},function (data) {
                $.each(data,function (index,row) {
                    //增加对应结果tr
                    addRow2('#resultDictList', resultDictRowIdx, resultDictTpl, row);
                    resultDictRowIdx = resultDictRowIdx + 1;
                });
            });
        }

        function addRow2(list, idx, tpl, row){
            $(list).append(Mustache.render(tpl, {
                idx: idx, delBtn: false, row: row
            }));

            var resultSelect = $(list+idx).find("select")[0];
            var dictList = row.resultDictList;
            //结果下拉框
            $.each(dictList,function (index,dict) {
                var selected = '';
                if(dict.defaultFlag == '1'){
                    selected = 'selected="selected"'
                }
                $(resultSelect).append('<option value="'+dict.id+'" '+selected+'" remarks='+dict.remarks+'>'+dict.name+'</option>');
            });


            $('#resultList'+idx+'_resultRemarksId').val($(resultSelect).find("option:selected").attr('remarks'));

            if(row.recordItem.resultDictId && row.recordItem.resultDictId!=''){
                $(resultSelect).val(row.recordItem.resultDictId);
            }

            if(row.recordItem.resultRemarks && row.recordItem.resultRemarks!=''){
                $('#resultList'+idx+'_resultRemarksId').val(row.recordItem.resultRemarks);
            }
        }

        function resultChange(idx,selectDom) {
            $('#resultList'+idx+'_resultRemarksId').val($(selectDom).find("option:selected").attr('remarks'));
        }


        function saveResults() {
            var recordItemIdInputList = $("input[name='recordItemId']");
            var recordItemIds = new Array();
            var resultDictIds = new Array();
            var remarksArray = new Array();
            $.each(recordItemIdInputList,function (index,input) {
                recordItemIds.push($(input).val());
                var idx = $(input).attr('idx');
                resultDictIds.push($('#resultDictList'+idx+'_dictId').val());
                remarksArray.push($('#resultList'+idx+'_resultRemarksId').val());
            });
            if(recordItemIds.length<1){
                showTip('请选择体检项目','warning');
                return;
            }

            var url = '${ctx}/wshbj/examinationRecord/saveResult';
            var params = {
                recordItemIdArray:recordItemIds,
                resultDictIdArray:resultDictIds,
                resultRemarksArray:remarksArray
            }
            $.post(url,params,function (data) {
                if(data.code!='0'){
                    showTip(data.msg,'warning');
                }else{
                    showTip('保存结果成功','success');
                    setTimeout(function () {
                        location.href = '${ctx}/wshbj/examinationRecord/inputResult';
                    },2000);
                }
            });
        }
	</script>
</head>
<body>
<ul class="nav nav-tabs">
	<li class="active"><a href="javascript:void(0);">制卡</a></li>
</ul><br/>
<form id="inputForm" class="form-horizontal">
	<sys:message content="${message}"/>
	<div class="row">
		<div class="control-group span5">
			<label class="control-label">体检编号：</label>
			<div class="controls">
				<input  value="${record.code}" readonly class="input-medium"/>
			</div>
		</div>
		<div class="control-group span5">
			<label class="control-label">状态：</label>
			<div class="controls">
				<input value="${fns:getDictLabel(record.status,'examination_record_status','')}" readonly class="input-medium"/>
			</div>
		</div>
		<div class="control-group span5">
			<label class="control-label">身份证号：</label>
			<div class="controls">
				<input value="${record.idNumber}" readonly class="input-medium"/>
			</div>
		</div>
		<div class="control-group span5">
			<label class="control-label">用户：</label>
			<div class="controls">
				<input value="${record.name}" readonly class="input-medium"/>
			</div>
		</div>
		<div class="control-group span5">
			<label class="control-label">卡号：</label>
			<div class="controls">
				<input   class="input-medium"/>
			</div>
		</div>
	</div>


	<div class="form-actions">
		<shiro:hasPermission name="wshbj:certRecord:edit">
			<c:if test="${record.status eq '30' or record.status eq '40'}">
				<input id="btnSearch" class="btn btn-primary" type="button" value="制卡" onclick=""/>
			</c:if>
		</shiro:hasPermission>
		<input id="btnCancel" class="btn" type="button" value="返 回" onclick=""/>
	</div>
</form>
<form  class="form-horizontal">
	<div >
		<div style="width: 60%;float:left;">
			<table id="contentTable1" class="table table-striped table-bordered table-condensed" style="height: 50px">
				<thead>
					<tr>
						<th >项目</th>
						<th width="70">初/复检</th>
						<th width="90">结果</th>
						<th >结果描述</th>
					</tr>
				</thead>
				<tbody id="recordList" style="height: 50px;overflow-y: scroll">
					<c:forEach items="${recordItemList}" var="recordItem">
						<tr>
							<th >${recordItem.itemName}</th>
							<th >${recordItem.examinationFlag eq '1'?"初检":"复检"}</th>
							<th >
								<c:choose>
									<c:when test="${empty recordItem.resultDictId}">未录入结果</c:when>
									<c:otherwise>${recordItem.resultFlag eq '1'?"合格":"不合格"}</c:otherwise>
								</c:choose>
							</th>
							<th >${recordItem.resultRemarks}</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>


		</div>
		<div style="width: 38%;float:right;"><table id="contentTable2" class="table table-striped table-bordered table-condensed">
			<thead>
			<tr>
				<th width="150">不合格原因</th>
			</tr>
			</thead>
			<tbody id="resultDictList">
			<c:forEach items="${recordItemList}" var="recordItem">
				<c:if test="${recordItem.resultFlag eq '0' and recordItem.lastFlag eq '1'}">
					<tr>
						<th >
							${recordItem.itemName} &nbsp;&nbsp;
							${recordItem.examinationFlag eq '1'?"初检":"复检"}
						    &nbsp;&nbsp;
							不合格:${recordItem.resultRemarks}
						</th>
					</tr>
				</c:if>
			</c:forEach>
			</tbody>
		</table></div>
	</div>
</form>

</body>
</html>