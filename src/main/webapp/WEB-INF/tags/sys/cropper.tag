<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="imgName" type="java.lang.String" required="true" description="图片名称"%>
<%@ attribute name="path" type="java.lang.String" required="true" description="上传图片的input控件name值"%>
<%@ attribute name="value" type="java.lang.String" required="false" description="图片的路径地址"%>
<%@ attribute name="mainImgWidth" type="java.lang.String" required="true" description="主图片的宽度"%>
<%@ attribute name="mainImgHeight" type="java.lang.String" required="false" description="主图片的高度"%>
<%@ attribute name="showPreview" type="java.lang.Boolean" required="false" description="是否显示预览图"%>
<c:if test="${mainImgHeight == null }">
    <c:set var="mainImgHeight" value="${mainImgWidth}"/>
</c:if>
<c:if test="${mainImgWidth == null }">
    <c:set var="mainImgWidth" value="${mainImgHeight}"/>
</c:if>
<c:if test="${cropperInited == null}">
<c:set var="cropperInited" value="1" scope="request"/>
<style type="text/css">
#CamBox {
	-moz-border-radius: 10px;
	border-radius: 10px;
	left: 50%;
	top: 30%;
	position: fixed;
	-moz-box-shadow: 5px 5px 10px 0 #3b3b3f;
	box-shadow: 5px 5px 10px 0 #3b3b3f;
	z-index: 1250;
	display: none;
	background: url(${ctxStatic}/jquery-webcam/images/cam_bg.jpg) #d5d5d5;
}

#CamBox #CamFlash {
	width: 100%;
	margin: 0 auto;
	background: #fff;
}

#CamBox #timing {
	color: #F60;
	display: none;
	font-size: 36px;
	font-weight: 700;
	height: 200px;
	left: 50%;
	line-height: 200px;
	position: absolute;
	text-align: center;
	top: 50%;
	width: 200px;
	margin: -100px 0 0 -100px;
}

#CamBox .cambar {
	height: 50px;
	padding-top: 10px;
	margin: 0px;
	text-align:center;
}

#CamBox .cambar a {
	background: url(${ctxStatic}/jquery-webcam/images/btn5.jpg) no-repeat;
	display:inline-block;
	height: 31px;
	line-height: 31px;
	text-align: center;
	width: 79px
}

#CamBox .lens {
	background: url(${ctxStatic}/jquery-webcam/images/cam.png) no-repeat 50%;
	height: 50px;
	width: 100%;
	margin:0px;
}

#CamBox .cambar #camClose,
#CamBox .cambar #setCam {
	color: #333;
}

#CamBox .cambar #setCam {
	margin-right: 30px;
}

#CamBox .cambar #camClose:hover,
#CamBox .cambar #setCam:hover {
	background-position: 0 -31px;
}

#CamBox .cambar #CamOk {
	background-position: -79px 0;
	color: #fff;
	margin-right: 30px;
}

#CamBox .cambar #CamOk:hover {
	background-position: -79px -31px;
}
</style>
</c:if>

<div class="tailoring-content" id="content${path}">
    <div class="tailoring-content-two">
        <div class="tailoring-box-parcel" style="width:${mainImgWidth}px;height:${mainImgHeight}px">
            <img id="tailoringImg" width="${mainImgWidth-2}" height="${mainImgHeight-2}" src="${value}"/>
            <video id="tailoringVideo"  width="${mainImgWidth-2}" height="${mainImgHeight-2}" style="display:none"></video>
        </div>
        <c:if test="${showPreview}">
        <div class="preview-box-parcel" style="width:${mainImgWidth/2}px;height:${mainImgHeight}px">
            <div style="padding:5px;width:100%;height:50%">
                <div class="square previewImg" style="width:100%;height:100%"></div></div>
            <div style="padding:5px;width:100%;height:50%">
                <div class="circular previewImg" style="width:100%;height:100%"></div></div>
        </div>
        </c:if>
        <div class="cl"></div>
    </div>
    <div class="tailoring-content-one">
        <label id="btn${path}Choose" title="上传${imgName}" for="chooseImg" class="btn btn-warning btn-mini">
            <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden">
            选择图片
        </label>
        <label id="btn${path}Cam" class="btn btn-warning btn-mini">拍照</label>
        <label id="btn${path}Cancel" class="btn btn-info btn-mini">取消</label>
        <label id="btn${path}OK" class="btn btn-info  btn-mini disabled">保存</label>
    </div>

    <div id="CamBox">
        <p class="lens"></p>
        <div id="CamFlash"></div>
        <p class="cambar">
            <a href="javascript:;" id="CamOk">拍照</a>
            <a href="javascript:;" id="camClose">关闭</a>
            <span style="clear:both;"></span>
        </p>
        <div id="timing"></div>
    </div>

    <img name="img${path}" id="img${path}" style="width:100px;height:100px;display:none">
    <input type="hidden" name="${path}" id="up${path}" value="${value}"/>

</div>
<script type="text/javascript">

$(function(){
    var ${path}Inited=0;
    var ${path}CropperState=0;
    var ${path}CamState=0;
    var ${path}Track=null;

    $("#content${path} #chooseImg").on("change",function(evt) {
        if (!evt.target.files || !evt.target.files[0]){
            return;
        }
        init${path}Cropper();
        ${path}CropperState=1;

        var reader = new FileReader();
        reader.onload = function (evt2) {
            var replaceSrc = evt2.target.result;
            //更换cropper的图片
            $('#content${path} #tailoringImg').cropper('replace', replaceSrc,false);//默认false，适应高度，不失真
        }
        reader.readAsDataURL(evt.target.files[0]);
    });

// 拍照按钮点击
    $("#content${path} #btn${path}Cam").on('click',function(){

        var video=$("#content${path} #tailoringVideo")[0];

        if(${path}CamState==1){

            // 设置为非拍照状态
            dealCamState(1);

            // 取照片
            camPhoto();

            if(${path}Track!=null){
                ${path}Track.stop();
                ${path}Track=null;
            }

            return;
        }

        var videoObj = { "video": {width:${mainImgWidth-2},height:${mainImgHeight-2}},"audio":false };

        //  支持浏览器  谷歌,火狐,360,欧朋
        if(navigator.mediaDevices&&navigator.mediaDevices.getUserMedia){
            navigator.mediaDevices.getUserMedia(videoObj)
            .then(getUserMediaThen)
            .catch(getUserMediaCatch);
        }else if(navigator.mediaDevices&&navigator.mediaDevices.webkitGetUserMedia){
            navigator.mediaDevices.webkitGetUserMedia(videoObj)
            .then(getUserMediaThen)
            .catch(getUserMediaCatch);
        }else if(navigator.mediaDevices&&navigator.mediaDevices.mozGetUserMedia){
            navigator.mediaDevices.mozGetUserMedia(videoObj)
            .then(getUserMediaThen)
            .catch(getUserMediaCatch);
        }else if(navigator.getUserMedia){
          navigator.getUserMedia(videoObj)
          .then(getUserMediaThen)
          .catch(getUserMediaCatch);
        }else if(navigator.webkitGetUserMedia){
          navigator.webkitGetUserMedia(videoObj)
          .then(getUserMediaThen)
          .catch(getUserMediaCatch);
        }else if(navigator.mozGetUserMedia){
          navigator.mozGetUserMedia(videoObj)
          .then(getUserMediaThen)
          .catch(getUserMediaCatch);
        }else{
           doWebcam();
        }


         function getUserMediaThen(stream){
             ${path}Track=stream.getTracks()[0];
             video.srcObject=stream;
             video.onloadedmetadata = function(e) {
                 video.play();

                 // 设置拍照状态
                 dealCamState(0);
             };
          }

          function getUserMediaCatch(err){
              dealCamState(1);
              if(err.message=="Permission denied"){
                  console.warn("权限不足，请可查看浏览器是否允许访问摄像头<br> 谷歌浏览器在地址栏右侧应显示摄像头的图标。");
              }else{
                  console.warn("访问webRTC出现异常：name["+err.name+"] - "+err.message);
              }
              doWebcam();
           }

    });

    $("#content${path} #btn${path}Cancel").on('click',function(){


        // 保存按钮禁用
        $("#content${path} #btn${path}OK").addClass("disabled");
        if(${path}CropperState){
            $('#content${path} #tailoringImg').cropper("clear");
            ${path}CropperState=0;

        }

        if(${path}CamState){
            if(${path}Track!=null){
                ${path}Track.stop();
                ${path}Track=null;
            }
            ${path}CamState=0;
        }

        dealCamState(1);

    });

    $("#content${path} #btn${path}OK").on('click',function(){
        // 保存按钮禁用
        $("#content${path} #btn${path}OK").addClass("disabled");
        ${path}CropperState=0;

        cutImg();
        // uploadImg();

        $('#content${path} #tailoringImg').cropper("clear");
    });

    function dealCamState(st){

        if(st==0){
            $("#content${path} #chooseImg").attr("disabled","disabled");
            $("#content${path}  #btn${path}Choose").addClass("disabled");
            $("#content${path}  #btn${path}OK").addClass("disabled");

            $("#content${path} #tailoringImg").hide();
            $("#content${path} .cropper-container").hide();

            $("#content${path} #tailoringVideo").show();

            $("#content${path} #btn${path}Cam").removeClass("btn-warning");
            $("#content${path} #btn${path}Cam").addClass("btn-danger");
            $("#content${path} #btn${path}Cam").text("取图");

            ${path}CamState=1;
        }else if(st==1){
            $("#content${path} #chooseImg").removeAttr("disabled");
            $("#content${path}  #btn${path}Choose").removeClass("disabled");
            $("#content${path}  #btn${path}OK").removeClass("disabled");

            $("#content${path} #tailoringImg").show();
            $("#content${path} .cropper-container").show();
            $("#content${path} #tailoringVideo").hide();

            $("#content${path} #btn${path}Cam").addClass("btn-warning");
            $("#content${path} #btn${path}Cam").removeClass("btn-danger");
            $("#content${path} #btn${path}Cam").text("拍照");

            ${path}CamState=0;
        }
    }


    //cropper图片裁剪
    function init${path}Cropper(){
        if(!${path}Inited){
            ${path}Inited=1;
        }else{
            return;
        }
        $('#content${path} #tailoringImg').cropper({
            aspectRatio: ${mainImgWidth}/${mainImgHeight},//默认比例
            preview: '#content${path} .previewImg',//预览视图
            guides: false,  //裁剪框的虚线(九宫格)
            autoCropArea: 0.9,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
            movable: true, //是否允许移动剪裁框
            dragCrop: false,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
            movable: true,  //是否允许移动剪裁框
            resizable: true,  //是否允许改变裁剪框的大小
            zoomable: true,  //是否允许缩放图片大小
            mouseWheelZoom: true,  //是否允许通过鼠标滚轮来缩放图片
            touchDragZoom: true,  //是否允许通过触摸移动来缩放图片
            rotatable: true,  //是否允许旋转图片
            crop: function(e) {

            }
        });

    };

    // 执行切图
    function cutImg(){

        var cas=$('#content${path} #tailoringImg').cropper("getCroppedCanvas");
        var base64url = cas.toDataURL('image/png');
        $("#content${path} #img${path}").attr("src",base64url);
        $("#content${path} #up${path}").val(base64url);

        ${path}CropperState=0;
    }

    function uploadImg(){
        var base64=$("#content${path} #img${path}").attr("src");
        if(!base64){
            $.jBox.alert("没有获得${imgName}图片数据，无法上传");
            return;
        }

/**
        var url="${ctx}/upfile/upbase64";
        var d1={base64:base64};
        $.post(url,d1,function(d1r){
            if(d1r.code=='0'){
                $("#up${path}").val(d1r.data.saveUrl);
                $.jBox.messager('${imgName}上传成功');
            }else{
                // 提交失败
                $.jBox.messager('${imgName}上传失败:'+d1r.code+" - "+d1r.msg);
                $("#content${path} #btn${path}OK").removeClass("disabled");
            }
        });
**/

    }

    function camPhoto(){

        init${path}Cropper();

        ${path}CropperState=1;

        var canvas = document.createElement('canvas');
        var canvasContext = canvas.getContext('2d');
        var video=$("#content${path} #tailoringVideo")[0];

        canvas.width=video.width;
        canvas.height=video.height;

        canvasContext.drawImage(video,0,0,video.width,video.height);
        var base64url = canvas.toDataURL('image/png');

        $('#content${path} #tailoringImg').cropper("replace",base64url,false);

    }

    function doWebcam(){
        dealCamState(0);

        var CamFlash = document.getElementById("CamFlash");
        var timing = document.getElementById("timing");
        var CamOk = document.getElementById("CamOk");
        var CamBox = document.getElementById("CamBox");
        var camerasImage = document.getElementById("camerasImage");
        var camClose = document.getElementById("camClose");
        var setCam = document.getElementById("setCam");

        var canvas=document.createElement("canvas");
        var ctx=canvas.getContext("2d");
        canvas.width=${mainImgWidth};
        canvas.height=${mainImgHeight};

        var pos=0;

        var img = new Image();
        img.onload = function() {
            ctx.drawImage(img, ${mainImgWidth}, ${mainImgHeight});
        }
        var image = ctx.getImageData(0, 0, ${mainImgWidth}, ${mainImgHeight});


        camClose.onclick = function() { //拍照点关闭后
            CamBox.style.display = "none";
            $("#CamFlash").empty();

            dealCamState(1);
        };

        CamOk.onclick=function(){
            if(webcam.capture){
                webcam.capture();
                dealCamState(1);
            }else{
                 $.jBox.messager('未能找到摄像头。');
            }

        }
        CamBox.style.display = "block";
        CamBox.style.width = "${mainImgWidth}px";
        CamBox.style.height = "${mainImgHeight+100}px";
        CamBox.style.margin = "-${mainImgWidth/2}px 0 0 -${mainImgHeight/2}px";

        CamFlash.style.height="${mainImgHeight}px";

        $("#CamFlash").webcam({
            width: ${mainImgWidth},
            height: ${mainImgHeight},
            mode: "callback",
            swffile: "${ctxStatic}/jquery-webcam/jscam_canvas_only.swf", // canvas only doesn't implement a jpeg encoder, so the file is much smaller

            onTick: function(remain) {

                if (0 == remain) {
                    console.log("Cheese!");
                } else {
                    console.log(remain + " seconds remaining...");
                }
            },

            onSave: function(data) {

                var col = data.split(";");
                var img1=image;

                for(var i = 0; i < ${mainImgWidth}; i++) {
                    var tmp = parseInt(col[i]);
                    img1.data[pos + 0] = (tmp >> 16) & 0xff;
                    img1.data[pos + 1] = (tmp >> 8) & 0xff;
                    img1.data[pos + 2] = tmp & 0xff;
                    img1.data[pos + 3] = 0xff;
                    pos += 4;
                }

                if(pos >= 4 * ${mainImgWidth} * 240) {

                    var x=(${mainImgWidth}-320)/2;
                    var y=(${mainImgHeight}-240)/2;
                    ctx.putImageData(img1, x,y,0,0,320,240);

                    // 取得图片的base64码
                    var base64 = canvas.toDataURL("image/png");

                    // 将图片base64码设置给img
                    init${path}Cropper();
                    $('#content${path} #tailoringImg').cropper("replace",base64,false);

                    pos = 0;
                    camClose.onclick();

                }
            },

            onCapture: function (d) {
                webcam.save();
            },

            debug: function (type, string) {
                // Write debug information to console.log() or a div, ...
            },

            onLoad: function () {
                console.log(webcam.height);
            }
        });
    }


})
</script>