
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
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

        var canvas = $('#canvas'),
            context = canvas.getContext('2d'),
            video = $('video'),
            snap = $('#snap'),
            close = $('#close'),
            upload = $('#upload'),
            uploaded = $('#uploaded'),
            mediaStreamTrack;

        // 获取媒体方法（新方法）
        // 使用新方法打开摄像头
        if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
            alert('3333');
            navigator.mediaDevices.getUserMedia({
                video: true,
                audio: true
            }).then(function(stream) {
                console.log(stream);

                mediaStreamTrack = typeof stream.stop === 'function' ? stream : stream.getTracks()[1];

                video.src = (window.URL || window.webkitURL).createObjectURL(stream);
                video.play();
            }).catch(function(err) {
                console.log(err);
            })
        }
        // 使用旧方法打开摄像头
        else if (navigator.getMedia) {
            navigator.getMedia({
                video: true
            }, function(stream) {
                mediaStreamTrack = stream.getTracks()[0];

                video.src = (window.URL || window.webkitURL).createObjectURL(stream);
                video.play();
            }, function(err) {
                console.log(err);
            });
        }

        // 截取图像
        snap.addEventListener('click', function() {
            context.drawImage(video, 0, 0, 200, 150);
        }, false);

        // 关闭摄像头
        close.addEventListener('click', function() {
            mediaStreamTrack && mediaStreamTrack.stop();
        }, false);

        // 上传截取的图像
        upload.addEventListener('click', function() {
            jQuery.post('/uploadSnap.php', {
                snapData: canvas.toDataURL('image/png')
            }).done(function(rs) {
                rs = JSON.parse(rs);

                console.log(rs);

                uploaded.src = rs.path;
            }).fail(function(err) {
                console.log(err);
            });
        }, false);

        //选择用户返回
        function userTreeselectCallBack(v, h, f) {
			if('ok'==v){
				var euserId = $('#userId').val();
				var url = '${ctx}/wshbj/examinationUser/getById';
				$.post(url,{id:euserId},function (data) {
					if(data){
					    $('#idNumber').val(data.idNumber);
                        $('#phoneNumber').val(data.phoneNumber);
                        $('#birthday').val(data.birthday);
                        $('#sex').val(data.sex);

                        $("#organId").attr("value", data.organId);
                        $("#organId").trigger('change');

                        $("#industryId").attr("value", data.industryId);
                        $("#industryId").trigger('change');

                        $("#postId").attr("value", data.postId);
                        $("#postId").trigger('change');
					}
                },'json');
			}else if('clear'==v){

			}
        }

	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wshbj/examinationRecord/">体检记录列表</a></li>
		<li class="active"><a href="${ctx}/wshbj/examinationRecord/form?id=${examinationRecord.id}">体检记录<shiro:hasPermission name="wshbj:examinationRecord:edit">${not empty examinationRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wshbj:examinationRecord:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="examinationRecord" action="${ctx}/wshbj/examinationRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<c:if test="${not empty examinationRecord.id}">
			<div class="control-group">
				<label class="control-label">状态：</label>
				<div class="controls">
					<form:select path="status" cssStyle="width: 100px">
						<form:option value="">
							请选择
						</form:option>
						<form:options items="${fns:getDictList('examination_record_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
		</c:if>
		<div class="control-group">
			<div>
				<label class="control-label">用户头像：</label>
				<div class="controls">
					<sys:cropper mainImgWidth="360" imgName="头像" path="head1"/>
				</div>

			</div>
		</div>
		<div style="float:left; width:100%;">
			<div style="float:left; width:60%;">
				<div class="control-group">
					<label class="control-label">体检用户：</label>
					<div class="controls">
						<wshbj:euserTreeSelect id="user" name="user.id" value="${examinationRecord.user.id}" labelName="user.name" labelValue="${examinationRecord.user.name}"
											   title="用户" url="/wshbj/organ/treeData" allowInput="true" dataMsgRequired="必填信息"
											   cssClass="input-xlarge required" allowClear="true" notAllowSelectParent="true"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">身份证号：</label>
					<div class="controls">
						<form:input path="idNumber" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">联系电话：</label>
					<div class="controls">
						<form:input path="phoneNumber" htmlEscape="false" maxlength="45" autocomplete="true" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">出生日期：</label>
					<div class="controls">
						<form:input path="birthday" htmlEscape="false" maxlength="45" autocomplete="true" readonly="true" class="input-medium Wdate required"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>

						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">性别：</label>
					<div class="controls">
						<form:select path="sex" cssStyle="width: 100px">
							<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
			</div>
			<div style="float:left; width:40%;position: relative;">
				<div style="position: absolute;margin:auto; top: 0;left: 0;right: 0;bottom: 0;vertical-align:middle;">

				</div>
			</div>
		</div>
		<div style="float:left; width:100%;">
		<div class="control-group" >
			<label class="control-label">单位：</label>
			<div class="controls">
				<form:select  path="organId"  class="input-xlarge">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${organList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">行业：</label>
			<div class="controls">
				<form:select path="industryId"  class="input-xlarge">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${industryList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">岗位：</label>
			<div class="controls">
				<form:select path="postId" class="input-xlarge">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${postList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">体检套餐：</label>
			<div class="controls">
				<form:select path="packageId" class="input-xlarge">
					<form:option value="">
						请选择
					</form:option>
					<form:options items="${packageList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wshbj:examinationRecord:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		</div>
	</form:form>
</body>
</html>