<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>体检记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">

		$(document).ready(function() {
            $('#checkedAll').click(function() {
                $('[name=samplesCheckbox]:checkbox').prop('checked', this.checked);
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
        
		function searchSamples() {
		    var url = '${ctx}/wshbj/examinationSamples/getListMap4Result';
            $.ajax({
                url: url,
                type: "POST",
                data: $("#inputForm").serialize(),//核心代码，form表单序列化
                dataType: "JSON",
                success: function(data) {
                    $('#samplesList').find('tr').remove();
                    samplesRowIdx = 0;
                    if(data){
                        $.each(data,function (index,sample) {
                            sample.idx = samplesRowIdx;

                            addRow('#samplesList', samplesRowIdx, samplesTpl, sample);
                            samplesRowIdx = samplesRowIdx + 1;
                        })


                    }
                }
            });

        }

        function addRow(list, idx, tpl, row){
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

            if(row.resultDictId && row.resultDictId!=''){
                $(resultSelect).val(row.resultDictId);
            }

            if(row.resultRemarks && row.resultRemarks!=''){
                $('#resultList'+idx+'_resultRemarksId').val(row.resultRemarks);
            }

            $(list+idx).find('td:gt(0):lt(4)').click(function () {
                var checked = $(list+idx).find('input[name=samplesCheckbox]').prop('checked');
                $(list+idx).find('[name=samplesCheckbox]:checkbox').prop('checked', !checked);
            });
        }

		function resultChange(idx,selectDom) {
            $('#resultList'+idx+'_resultRemarksId').val($(selectDom).find("option:selected").attr('remarks'));
        }


        function saveResults() {
			var checkedList = $("input[name='samplesCheckbox']:checked");
			var samplesIdArray = new Array();
            var resultDictIdArray = new Array();
            var resultRemarksArray = new Array();
			$.each(checkedList,function (index,checkbox) {
                samplesIdArray.push($(checkbox).val());
			    var idx = $(checkbox).attr('idx');
                resultDictIdArray.push($('#resultList'+idx+'_dictId').val());
                resultRemarksArray.push($('#resultList'+idx+'_resultRemarksId').val());
            });
			if(samplesIdArray.length<1){
			    showTip('请选择样本结果','warning');
			    return;
			}

            var url = '${ctx}/wshbj/examinationRecord/saveSamplesResult';
            var params = {
                samplesIdArray:samplesIdArray,
                resultDictIdArray:resultDictIdArray,
                resultRemarksArray:resultRemarksArray
			}
			$.post(url,params,function (data) {
				if(data.code!='0'){
                    showTip(data.msg,'warning');
				}else{
                    showTip('保存结果成功','success');
				    setTimeout(function () {
						location.href = '${ctx}/wshbj/examinationRecord/inputSamplesResult';
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
	<form id="inputForm"   method="post" class="form-horizontal">
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">体检编号：</label>
			<div class="controls">
				<input id="examinationCode" name="examinationCode" class="input-medium"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">采集项目：</label>
			<div class="controls">
				<select id="itemId" name="itemId" class="input-medium">
					<option value="">全部</option>
					<c:forEach items="${itemList}" var="item">
						<option value="${item.id}">${item.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样本号：</label>
			<div class="controls">
				<input id="sampleCode" name="sampleCode" class="input-medium"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样本日期：</label>
			<div class="controls">
				<input name="startDate"  readonly="true" class="input-medium Wdate"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
				--
				<input name="endDate"  readonly="true" class="input-medium Wdate"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
			</div>
		</div>


		<div class="form-actions">
			<input id="btnSearch" class="btn btn-primary" type="button" value="查询" onclick="searchSamples();"/>
			<input id="btnSubmit" class="btn btn-primary" type="button" value="保存选中" onclick="saveResults();"/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form>
	<form:form   method="post" class="form-horizontal">
		<div>
			<table id="contentTable1" class="table table-striped table-bordered table-condensed" style="height: 50px">
				<thead>
					<tr>
						<th width="5%"><input type="checkbox" id="checkedAll"></th>
						<th width="15%">体检编号</th>
						<th width="10%">用户</th>
						<th width="15%">样本编号</th>
						<th width="15%">名称</th>
						<th width="15%">结果</th>
						<th width="25%">结果备注</th>
					</tr>
				</thead>
				<tbody id="samplesList" style="height: 50px;overflow-y: scroll">

				</tbody>
			</table>
			<script type="text/template" id="samplesTpl">//<!--
				<tr id="samplesList{{idx}}">
					<td><input type="checkbox" id="{{row.id}}" name="samplesCheckbox" value="{{row.id}}" idx="{{row.idx}}"></td>
					<td >
						<span  type="text" maxlength="64" class="input-small" >{{row.examinationCode}}</span>
					</td>
					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.userName}}</span>
					</td>
					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.code}}</span>
					</td>

					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.itemName}}</span>
					</td>
					<td>
						<select id="resultList{{idx}}_dictId" name="resultList[{{idx}}]._dictId" data-value="{{row.itemId}}" onchange="resultChange({{idx}},this);" class="input-small">

						</select>
					</td>
					<td>
						<input type="text" id="resultList{{idx}}_resultRemarksId" name="resultList{{idx}}_resultRemarksName" value="{{row.resultRemarks}}" class="input-large" />
					</td>
				</tr>//-->
			</script>

			<script type="text/javascript">
				var samplesRowIdx = 0, samplesTpl = $("#samplesTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			</script>

		</div>
	</form:form>

</body>
</html>