<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="imgName" type="java.lang.String" required="true" description="图片名称"%>
<%@ attribute name="inputName" type="java.lang.String" required="true" description="上传图片的input控件name值"%>
<%@ attribute name="mainImgWidth" type="java.lang.String" required="true" description="主图片的宽度"%>
<%@ attribute name="mainImgHeight" type="java.lang.String" required="false" description="主图片的高度"%>
<c:if test="${mainImgHeight == null }">
    <c:set var="mainImgHeight" value="${mainImgWidth}"/>
</c:if>
<c:if test="${mainImgWidth == null }">
    <c:set var="mainImgWidth" value="${mainImgHeight}"/>
</c:if>
<div class="tailoring-content" id="content${inputName}">
    <div class="tailoring-content-two">
        <div class="tailoring-box-parcel" style="width:${mainImgWidth}px;height:${mainImgHeight}px">
            <img id="tailoringImg">
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
        <label title="上传${imgName}" for="chooseImg" class="btn btn-warning">
            <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden">
            本地选择${imgName}
        </label>
        <label id="btn${inputName}OK" class="btn btn-info">确 定</label>
    </div>
    <input type="hidden" name="${inputName}" id="hid${inputName}" style="width:100px;height:100px">
</div>
<script>

$(function(){

    init${inputName}Cropper();

    $("#content${inputName} #chooseImg").on("change",function(evt) {
        if (!evt.target.files || !evt.target.files[0]){
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt2) {
            var replaceSrc = evt2.target.result;
            //更换cropper的图片
            $('#content${inputName} #tailoringImg').cropper('replace', replaceSrc,false);//默认false，适应高度，不失真
        }
        reader.readAsDataURL(evt.target.files[0]);
    });

    $("#content${inputName} #btn${inputName}ReCrop").on('click',function(){
        $('#content${inputName} #tailoringImg').cropper("setDragMode","crop");
    });

    $("#content${inputName} #btn${inputName}OK").on('click',function(){
        cutImg();

        $('#content${inputName} #tailoringImg').cropper("clear");
    });

    //cropper图片裁剪
    function init${inputName}Cropper(){
        $('#content${inputName} #tailoringImg').cropper({
            aspectRatio: 1/1,//默认比例
            preview: '#content${inputName} .previewImg',//预览视图
            guides: false,  //裁剪框的虚线(九宫格)
            autoCropArea: 0.8,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
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

        $('#content${inputName} #tailoringImg').cropper("setDragMode","move");
    };

    function cutImg(){

        var cas=$('#content${inputName} #tailoringImg').cropper("getCroppedCanvas");
        var base64url = cas.toDataURL('image/png');
        $("#content${inputName} #hid${inputName}").val(base64url);
    }


})
</script>