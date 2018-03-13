<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="imgName" type="java.lang.String" required="true" description="图片名称"%>
<%@ attribute name="path" type="java.lang.String" required="true" description="上传图片的input控件name值"%>
<%@ attribute name="mainImgWidth" type="java.lang.String" required="true" description="主图片的宽度"%>
<%@ attribute name="mainImgHeight" type="java.lang.String" required="false" description="主图片的高度"%>
<c:if test="${mainImgHeight == null }">
    <c:set var="mainImgHeight" value="${mainImgWidth}"/>
</c:if>
<c:if test="${mainImgWidth == null }">
    <c:set var="mainImgWidth" value="${mainImgHeight}"/>
</c:if>
<div class="tailoring-content" id="content${path}">
    <div class="tailoring-content-two">
        <div class="tailoring-box-parcel" style="width:${mainImgWidth}px;height:${mainImgHeight}px">
            <img id="tailoringImg" width="${mainImgWidth-2}" height="${mainImgHeight-2}">
            <video id="tailoringVideo"  width="${mainImgWidth-2}" height="${mainImgHeight-2}" style="display:none"></video>
        </div>
        <div class="preview-box-parcel" style="width:${mainImgWidth/2}px;height:${mainImgHeight}px">
            <div style="padding:5px;width:100%;height:50%">
                <div class="square previewImg" style="width:100%;height:100%"></div></div>
            <div style="padding:5px;width:100%;height:50%">
                <div class="circular previewImg" style="width:100%;height:100%"></div></div>
        </div>
        <div style="clear:both"/>
    </div>
    <div class="tailoring-content-one">
        <label id="btn${path}Choose" title="上传${imgName}" for="chooseImg" class="btn btn-warning">
            <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden">
            本地选择${imgName}
        </label>
        <label id="btn${path}Cam" class="btn btn-warning">开启摄像头</label>
        <label id="btn${path}OK" class="btn btn-info disabled">保存图片</label>
    </div>
    <img name="img${path}" id="img${path}" style="width:100px;height:100px;display:none">
    <input type="hidden" name="${path}" id="up${path}"/>

</div>
<script>

$(function(){

    var ${path}CamState=0;
    var ${path}Track=null;

    init${path}Cropper();

    $("#content${path} #chooseImg").on("change",function(evt) {
        if (!evt.target.files || !evt.target.files[0]){
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt2) {
            var replaceSrc = evt2.target.result;
            //更换cropper的图片
            $('#content${path} #tailoringImg').cropper('replace', replaceSrc,false);//默认false，适应高度，不失真
        }
        reader.readAsDataURL(evt.target.files[0]);
    });

    $("#content${path} #btn${path}ReCrop").on('click',function(){
        $('#content${path} #tailoringImg').cropper("setDragMode","crop");
    });

    $("#content${path} #btn${path}Cam").on('click',function(){
        $('#content${path} #tailoringImg').cropper("clear");

        var video=$("#content${path} #tailoringVideo")[0];

        if(${path}CamState==1){

            // 设置为非拍照状态
            dealCamState();

            if(${path}Track!=null){
                ${path}Track.stop();
                ${path}Track=null;
            }

            return;
        }

        var videoObj = { "video": {width:${mainImgWidth-2},height:${mainImgHeight-2}},"audio":false };

         //  支持浏览器  谷歌,火狐,360,欧朋
         navigator.mediaDevices.getUserMedia(videoObj)
         .then(function(stream){
            ${path}Track=stream.getTracks()[0];
            video.srcObject=stream;
            video.onloadedmetadata = function(e) {
                video.play();

                // 设置拍照状态
                dealCamState();
            };
         })
         .catch(function(err){
            if(err.message=="Permission denied"){
                $.jBox.alert("权限不足，请可查看浏览器是否允许访问摄像头<br> 谷歌浏览器在地址栏右侧应显示摄像头的图标。");
                return;
            }

            $.jBox.alert("访问webRTC出现异常："+err.message);
         });

    });

    $("#content${path} #btn${path}OK").on('click',function(){
        cutImg();
        uploadImg();

        $('#content${path} #tailoringImg').cropper("clear");
    });

    function dealCamState(){

        if(${path}CamState==0){
            $("#content${path} #chooseImg").attr("disabled","disabled");
            $("#content${path}  #btn${path}Choose").addClass("disabled");
            $("#content${path}  #btn${path}OK").addClass("disabled");

            $("#content${path} #tailoringImg").hide();
            $("#content${path} .cropper-container").hide();

            $("#content${path} #tailoringVideo").show();

            $("#content${path} #btn${path}Cam").removeClass("btn-warning");
            $("#content${path} #btn${path}Cam").addClass("btn-danger");
            $("#content${path} #btn${path}Cam").text(" 拍   照 ");

            ${path}CamState=1;
        }else if(${path}CamState==1){
            $("#content${path} #chooseImg").removeAttr("disabled");
            $("#content${path}  #btn${path}Choose").removeClass("disabled");
            $("#content${path}  #btn${path}OK").removeClass("disabled");

            $("#content${path} #tailoringImg").show();
            $("#content${path} .cropper-container").show();
            $("#content${path} #tailoringVideo").hide();

            $("#content${path} #btn${path}Cam").addClass("btn-warning");
            $("#content${path} #btn${path}Cam").removeClass("btn-danger");
            $("#content${path} #btn${path}Cam").text("开启摄像头");

            // 取照片
            camPhoto();

            ${path}CamState=0;
        }
    }


    //cropper图片裁剪
    function init${path}Cropper(){
        $('#content${path} #tailoringImg').cropper({
            aspectRatio: 1/1,//默认比例
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

        $('#content${path} #tailoringImg').cropper("setDragMode","move");
    };

    // 执行切图
    function cutImg(){

        var cas=$('#content${path} #tailoringImg').cropper("getCroppedCanvas");
        var base64url = cas.toDataURL('image/png');
        $("#content${path} #img${path}").attr("src",base64url);
    }

    function uploadImg(){
        var base64=$("#content${path} #img${path}").attr("src");
        if(!base64){
            $.jBox.alert("没有获得${imgName}图片数据，无法上传");
            return;
        }

        var url="${ctx}/upfile/upbase64";
        var d1={base64:base64};
        $.post(url,d1,function(d1r){
            console.log(d1r);
            if(d1r.code=='0'){
                $("#up${path}").val(d1r.data.saveUrl);
                $.jBox.messager('${imgName}上传成功');
            }
        });

    }

    function camPhoto(){
        var canvas = document.createElement('canvas');
        var canvasContext = canvas.getContext('2d');
        var video=$("#content${path} #tailoringVideo")[0];

        canvas.width=video.width;
        canvas.height=video.height;

        canvasContext.drawImage(video,0,0,video.width,video.height);
        var base64url = canvas.toDataURL('image/png');

        $('#content${path} #tailoringImg').cropper("replace",base64url,false);

    }


})
</script>