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

        });




        //选择用户返回
        function userTreeselectCallBack(v, h, f) {
            if('ok'==v){
                var euserId = $('#userId').val();
                var url = '${ctx}/wshbj/examinationUser/getById';
                $.post(url,{id:euserId},function (data) {
                    if(data){
                        setUserPro(data);
                    }
                },'json');
            }else if('clear'==v){

            }
        }

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
	<li class="active"><a href="${ctx}/wshbj/examinationRecord/inputResult">结果录入</a></li>
</ul><br/>
<form id="inputForm" class="form-horizontal">
	<sys:message content="${message}"/>
	<div class="control-group">
		<label class="control-label">登记日期：</label>
		<div class="controls">
			<input name="startDate"  readonly="true" class="input-medium Wdate"
				   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
			--
			<input name="endDate"  readonly="true" class="input-medium Wdate"
				   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">体检编号：</label>
		<div class="controls">
			<input id="examinationCode" name="examinationCode" class="input-medium"/>
		</div>
	</div>
	<div class="control-group" >
		<label class="control-label">单位：</label>
		<div class="controls">
			<select  name="organId"  class="input-xlarge">
				<option value="">
					全部
				</option>
				<c:forEach items="${organList}" var="organ">
					<option value="${organ.id}">${organ.name}</option>
				</c:forEach>
			</select>
		</div>
	</div>



	<div class="form-actions">
		<input id="btnSearch" class="btn btn-primary" type="button" value="查询" onclick="searchRecords();"/>
		<input id="btnSubmit" class="btn btn-primary" type="button" value="保 存" onclick="saveResults();"/>
		<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
	</div>
</form>
<form  class="form-horizontal">
	<div>
		<div style="width: 38%;float:left;">
			<table id="contentTable1" class="table table-striped table-bordered table-condensed" style="height: 50px">
				<thead>
				<tr>
					<th width="50"></th>
					<th >体检编号</th>
					<th width="150">用户</th>
				</tr>
				</thead>
				<tbody id="recordList" style="height: 50px;overflow-y: scroll">

				</tbody>
			</table>
			<script type="text/template" id="recordTpl">//<!--
					<tr id="recordList{{idx}}">
						<td>
							<input type="radio" name="itemIdRadio" value="{{row.id}}" idx="{{idx}}" onchange="itemIdRadioChange(this);">
						</td>
						<td>
							<span  type="text" maxlength="64" class="input-small" >{{row.code}}</span>
						</td>
						<td>
							<span  type="text" maxlength="64" class="input-small" >{{row.name}}</span>
						</td>

					</tr>//-->
			</script>
			<script type="text/template" id="resultDictTpl">//<!--
					<tr id="resultDictList{{idx}}">
						<td >
							<input type="hidden" name="recordItemId" value="{{row.recordItem.id}}" idx="{{idx}}"/>
							<span  type="text"class="input-small" >{{row.recordItem.itemName}}</span>
						</td>
						<td>
							<select id="resultDictList{{idx}}_dictId" name="resultDictList[{{idx}}]._dictId"  onchange="resultChange({{idx}},this);" class="input-small">
							</select>
						</td>
						<td>
							<input type="text" class="input-xlarge" id="resultList{{idx}}_resultRemarksId" name="resultList{{idx}}_resultRemarksName" value="{{row.recordItem.resultRemarks}}"/>
						</td>

					</tr>//-->
			</script>
			<script type="text/javascript">
                var recordRowIdx = 0, recordTpl = $("#recordTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
                var resultDictRowIdx = 0, resultDictTpl = $("#resultDictTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			</script>
		</div>
		<div style="width: 58%;float:right;"><table id="contentTable2" class="table table-striped table-bordered table-condensed">
			<thead>
			<tr>
				<th width="150">名称</th>
				<th width="100">结果</th>
				<th>结果备注</th>
			</tr>
			</thead>
			<tbody id="resultDictList">

			</tbody>
		</table></div>
	</div>
</form>

</body>
</html>