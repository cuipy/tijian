<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="imgName" type="java.lang.String" required="true" description="图片名称"%>
<%@ attribute name="path" type="java.lang.String" required="true" description="上传图片的input控件name值"%>
<%@ attribute name="value" type="java.lang.String" required="false" description="图片的路径地址"%>
<%@ attribute name="mainImgWidth" type="java.lang.String" required="true" description="主图片的宽度"%>
<%@ attribute name="mainImgHeight" type="java.lang.String" required="false" description="主图片的高度"%>
<c:if test="${mainImgHeight == null }">
    <c:set var="mainImgHeight" value="${mainImgWidth}"/>
</c:if>
<c:if test="${mainImgWidth == null }">
    <c:set var="mainImgWidth" value="${mainImgHeight}"/>
</c:if>
<c:if test="${cropperInited == null}">
<c:set var="cropperInited" value="1" scope="request"/>
<style type="text/css">

</style>
</c:if>

<div class="tailoring-content" id="content${path}">
    <div class="tailoring-content-two">
        <div class="tailoring-box-parcel" style="width:${mainImgWidth}px;height:${mainImgHeight}px">
            <img id="${path}Img" src="${value}" style="display:none;height:${mainImgHeight-2}px;max-width:${mainImgWidth-2}px;max-height:${mainImgHeight-2}px;"/>
            <img id="${path}Cropper" width="${mainImgWidth-2}" height="${mainImgHeight-2}"  style="display:none"/>
            <div id="${path}Jqcam"  width="${mainImgWidth-2}" height="${mainImgHeight-2}" style="display:none"></div>
            <video id="${path}Video"  width="${mainImgWidth-2}" height="${mainImgHeight-2}" style="display:none"></video>
        </div>
        <div class="cl"></div>
    </div>
    <div class="tailoring-content-one">
        <label id="btn${path}Choose" title="上传${imgName}" for="${path}ChooseImg" class="btn btn-warning btn-mini">
            <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="${path}ChooseImg" class="hidden">
            选择图片
        </label>
        <label id="btn${path}Cam" class="btn btn-warning btn-mini">拍照</label>
        <label id="btn${path}Capture" class="btn btn-warning btn-mini">取像</label>
        <label id="btn${path}Cancel" class="btn btn-info btn-mini">取消</label>
        <label id="btn${path}OK" class="btn btn-info  btn-mini">保存</label>
    </div>
    <input type="hidden" name="${path}" id="up${path}" value=""/>

</div>
<script type="text/javascript">
/**
状态说明：
1  init  初始状态 。 本地选择、拍照 。可以选择本地图片、可以拍照，没有取消和保存；
2  croppering  Cropper状态。取消、保存。  进入cropper切图状态，可以取消，可以保存；没有选择图片，和拍照；
3  jqcaming   jqcam拍照状态。 截图、取消。  进入拍照状态
4  webrtcing   webrtc 拍照状态。 截图、取消。
*/
$(function(){
    var ${path}Inited=0;
    var ${path}State=0;
    var ${path}Track=null;

    dealState('init');

    // 选择本地图片
    $("#content${path} #${path}ChooseImg").on("change",function(evt) {
        if (!evt.target.files || !evt.target.files[0]){
            return;
        }

        // 初始cropper控件
        init${path}Cropper();
        // 状态为croppering
        dealState("croppering");

        var reader = new FileReader();
        reader.onload = function (evt2) {
            var replaceSrc = evt2.target.result;
            //更换cropper的图片
            $('#content${path} #${path}Cropper').cropper('replace', replaceSrc,false);//默认false，适应高度，不失真
        }
        reader.readAsDataURL(evt.target.files[0]);
    });

    // 拍照按钮点击
    $("#content${path} #btn${path}Cam").on('click',function(){

        var video=$("#content${path} #${path}Video")[0];

        // 初始状态
        if(${path}State=="init"){

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
                    dealState("webrtcing");
                };
            }

            function getUserMediaCatch(err){
                if(err.message=="Permission denied"){
                  console.warn("权限不足，请可查看浏览器是否允许访问摄像头<br> 谷歌浏览器在地址栏右侧应显示摄像头的图标。");
                }else{
                  console.warn("访问webRTC出现异常：name["+err.name+"] - "+err.message);
                }
                doWebcam();
            }
        }

    });

    // 取消按钮，将拍照状态取消。
    $("#content${path} #btn${path}Cancel").on('click',function(){

        // 如果当前在切图
        if(${path}State=="croppering"){
            $('#content${path} #${path}Cropper').cropper("clear");
        }

        // 如果当前在 webrtc 取像
        if(${path}State=="webrtcing"){
            if(${path}Track!=null){
                ${path}Track.stop();
                ${path}Track=null;
            }
            $('#content${path} #${path}Video').empty();
        }

        // 如果当前在 jqcaming 取像
        if(${path}State=="jqcaming"){
            $('#content${path} #${path}Jqcam').empty();
        }

        dealState("init");

    });

    // 当点击取像操作按钮
    $("#content${path}  #btn${path}Capture").click(function(){
        if(${path}State=="webrtcing"){
            var canvas = document.createElement('canvas');
            var canvasContext = canvas.getContext('2d');
            var video=$("#content${path} #${path}Video")[0];

            canvas.width=video.width;
            canvas.height=video.height;

            canvasContext.drawImage(video,0,0,video.width,video.height);
            var base64url = canvas.toDataURL('image/png');

            $('#content${path} #${path}Cropper').cropper("replace",base64url,false);

            $('#content${path} #${path}Video').empty();
            ${path}Track.stop();
            ${path}Track = null;

            dealState("croppering");
        }
    });

    $("#content${path} #btn${path}OK").on('click',function(){
        // 执行切图
        var cas=$('#content${path} #${path}Cropper').cropper("getCroppedCanvas");
        var base64url = cas.toDataURL('image/png');
        $("#content${path} #${path}Img").attr("src",base64url);
        $("#content${path} #up${path}").val(base64url);

        dealState("init");
    });

    function dealState(st){

        if(st=='init'){
            $("#content${path} #${path}Img").show();
            $("#content${path} #${path}Cropper").hide();
            $("#content${path} .cropper-container").hide();
            $("#content${path} #${path}Video").hide();
            $("#content${path} #${path}Jqcam").hide();

            $("#content${path}  #btn${path}Choose").show();
            $("#content${path}  #btn${path}Capture").hide();
            $("#content${path}  #btn${path}Cam").show();
            $("#content${path}  #btn${path}Cancel").hide();
            $("#content${path}  #btn${path}OK").hide();

            $("#content${path} #btn${path}Cam").text("拍照");

        }else if(st=='croppering'){
             $("#content${path} #${path}Img").hide();
             $("#content${path} #${path}Cropper").show();
             $("#content${path} .cropper-container").show();
             $("#content${path} #${path}Video").hide();
             $("#content${path} #${path}Jqcam").hide();

             $("#content${path}  #btn${path}Choose").hide();
             $("#content${path}  #btn${path}Capture").hide();
             $("#content${path}  #btn${path}Cam").hide();
             $("#content${path}  #btn${path}Cancel").show();
             $("#content${path}  #btn${path}OK").show();

        }else if(st=='webrtcing'){
             $("#content${path} #${path}Img").hide();
             $("#content${path} .cropper-container").hide();
             $("#content${path} #${path}Cropper").hide();
             $("#content${path} #${path}Video").show();
             $("#content${path} #${path}Jqcam").hide();

             $("#content${path}  #btn${path}Choose").hide();
             $("#content${path}  #btn${path}Capture").show();
             $("#content${path}  #btn${path}Cam").hide();
             $("#content${path}  #btn${path}Cancel").show();
             $("#content${path}  #btn${path}OK").hide();
            $("#content${path} #btn${path}Cam").text("取像");
        }else if(st=='jqcaming'){
             $("#content${path} #${path}Img").hide();
             $("#content${path} .cropper-container").hide();
             $("#content${path} #${path}Cropper").hide();
             $("#content${path} #${path}Video").hide();
             $("#content${path} #${path}Jqcam").show();

             $("#content${path}  #btn${path}Choose").hide();
             $("#content${path}  #btn${path}Capture").show();
             $("#content${path}  #btn${path}Cam").hide();
             $("#content${path}  #btn${path}Cancel").show();
             $("#content${path}  #btn${path}OK").hide();
            $("#content${path} #btn${path}Cam").text("取像");
        }

        ${path}State=st;

    }


    //cropper图片裁剪
    function init${path}Cropper(){
        if(!${path}Inited){
            ${path}Inited=1;
        }else{
            return;
        }
        $('#content${path} #${path}Cropper').cropper({
            minContainerWidth:${mainImgWidth},minContainerHeight:${mainImgHeight},
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

    function doWebcam(){

        dealState("jqcaming");
        var canvas=document.createElement("canvas");
        var ctx=canvas.getContext("2d");
        canvas.width=${mainImgWidth};
        canvas.height=${mainImgHeight};

        var pos=0;

        var img1 = null;

        // 正在 jqCam 拍照状态
        $("#content${path}  #btn${path}Capture").click(function(){
            if(${path}State=="jqcaming"){
                webcam.capture();

            }
        });


        $("#${path}Jqcam").webcam({
            width: ${mainImgWidth},
            height: ${mainImgHeight},
            mode: "callback",
            swffile: "${ctxStatic}/jquery-webcam/jscam.swf", // canvas only doesn't implement a jpeg encoder, so the file is much smaller

            onTick: function(remain) {
                if (0 == remain) {
                    console.log("Cheese!");
                } else {
                    console.log(remain + " seconds remaining...");
                }
            },

            onSave: function(data) {

                var col = data.split(";");
                if(img1==null){
                    img1=ctx.getImageData(0, 0, col.length, ${mainImgHeight});
                }

                for(var i = 0; i < col.length; i++) {
                    var tmp = parseInt(col[i]);
                    img1.data[pos + 0] = (tmp >> 16) & 0xff;
                    img1.data[pos + 1] = (tmp >> 8) & 0xff;
                    img1.data[pos + 2] = tmp & 0xff;
                    img1.data[pos + 3] = 0xff;
                    pos += 4;
                }

                if(pos >= 4 * col.length * ${mainImgHeight}) {

                    ctx.putImageData(img1, 0,0);

                    // 取得图片的base64码
                    var base64 = canvas.toDataURL("image/png");

                    // 将图片base64码设置给img
                    init${path}Cropper();
                    $('#content${path} #${path}Cropper').cropper("replace",base64,false);

                    $('#content${path} #${path}Jqcam').empty();
                    dealState("croppering");

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