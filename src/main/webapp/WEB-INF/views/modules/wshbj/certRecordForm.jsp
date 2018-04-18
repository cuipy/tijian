<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>制卡记录管理</title>
	<meta name="decorator" content="default"/>

	<script type="text/javascript">
		$(document).ready(function() {
            $('#checkedAll').click(function() {
                $('[name=recordCheckbox]:checkbox').prop('checked', this.checked);
            });
		});

        function searchRecords() {
            var url = '${ctx}/wshbj/examinationRecord/getList4CertForm';
            $.ajax({
                url: url,
                type: "POST",
                data: $("#inputForm").serialize(),//核心代码，form表单序列化
                dataType: "JSON",
                success: function(data) {
                    $('#recordsList').find('tr').remove();
                    recordsRowIdx = 0;
                    if(data){
                        $.each(data,function (index,record) {
                            record.idx = recordsRowIdx;

                            addRow('#recordsList', recordsRowIdx, recordsTpl, record);
                            recordsRowIdx = recordsRowIdx + 1;
                        })


                    }
                }
            });

        }

        function addRow(list, idx, tpl, row){
            $(list).append(Mustache.render(tpl, {
                idx: idx, delBtn: false, row: row
            }));


            $(list+idx).find('td:gt(1):lt(11)').click(function () {
                var checked = $(list+idx).find('input[name=recordCheckbox]').prop('checked');
                $(list+idx).find('[name=recordCheckbox]:checkbox').prop('checked', !checked);
            });
            $('#recordsList'+idx+'_createDate').text(timestampToDate(row.createDate));
        }

        function openResultDetail(recordId) {
            var url = '${ctx}/wshbj/examinationRecord/recordResultDetailPop?recordId='+recordId;
            windowOpen(url,'体检结果',800,500);

			//addTabPage('123',url,true,this,false);
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wshbj/certRecord/form?id=${certRecord.id}">制卡记录<shiro:hasPermission name="wshbj:certRecord:edit">${not empty certRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:certRecord:edit">查看</shiro:lacksPermission></a></li>
		<%--<li><a href="${ctx}/wshbj/certRecord/">制卡记录列表</a></li>--%>
	</ul><br/>
	<form id="inputForm"   method="post" class="form-horizontal">
		<div class="control-group">
			<label class="control-label">体检编号：</label>
			<div class="controls">
				<input id="examinationCode" name="examinationCode" class="input-medium"/>
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

		<div class="control-group" >
			<label class="control-label">单位：</label>
			<div class="controls">
				<select  name="organId"  class="input-medium">
					<option value="">全部</option>
					<c:forEach items="${organList}" var="organ">
						<option value="${organ.id}">${organ.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<input name="userName" class="input-medium"/>
			</div>
		</div>
		<div class="control-group" >
			<label class="control-label">状态：</label>
			<div class="controls">
				<select  name="status"  class="input-medium">
					<option value="">全部</option>
					<c:forEach items="${statusDictList}" var="statusDict">
						<option value="${statusDict.value}">${statusDict.label}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSearch" class="btn btn-primary" type="button" value="查询" onclick="searchRecords();"/>
			<input id="btnSubmit" class="btn btn-primary" type="button" value="制卡" onclick=""/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form>
	<form:form   method="post" class="form-horizontal">
		<div>
			<table id="contentTable1" class="table table-striped table-bordered table-condensed" style="height: 50px">
				<thead>
				<tr>
					<th width="30"><input type="checkbox" checked id="checkedAll"></th>
					<th width="130">编号</th>
					<th >用户</th>
					<th >性别</th>
					<th width="90">生日</th>
					<th >是否制证</th>
					<th >身份证号</th>
					<th >单位</th>
					<th >行业</th>
					<th >岗位</th>
					<th >联系电话</th>
					<th >状态</th>
					<th >登记日期</th>
				</tr>
				</thead>
				<tbody id="recordsList" style="height: 50px;overflow-y: scroll">

				</tbody>
			</table>
			<script type="text/template" id="recordsTpl">//<!--
				<tr id="recordsList{{idx}}">
					<td><input type="checkbox" id="{{row.id}}" name="recordCheckbox" checked value="{{row.id}}" idx="{{row.idx}}"></td>
					<td >
						<a href="javascript:openResultDetail('{{row.id}}');">{{row.code}}</a>
					</td>
					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.name}}</span>
					</td>
					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.sexLabel}}</span>
					</td>
					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.birthday}}</span>
					</td>
					<td >
						<span  type="text" maxlength="64" class="input-small" >{{row.status}}</span>
					</td>
					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.idNumber}}</span>
					</td>
					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.organName}}</span>
					</td>
					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.industryName}}</span>
					</td>
					<td >
						<span  type="text" maxlength="64" class="input-small" >{{row.jobPostName}}</span>
					</td>
					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.phoneNumber}}</span>
					</td>
					<td>
						<span  type="text" maxlength="64" class="input-small" >{{row.statusLabel}}</span>
					</td>
					<td>
						<span  id="recordsList{{idx}}_createDate" type="text" maxlength="64" class="input-small" ></span>
					</td>
				</tr>//-->
			</script>

			<script type="text/javascript">
                var recordsRowIdx = 0, recordsTpl = $("#recordsTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			</script>

		</div>
	</form:form>
</body>
</html>