<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/canvas/fabric.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
<style type="text/css">

</style>
</head>
<body>

	<canvas id="cvs-main" style="border:1px solid #ccc"></canvas>

<script type="text/javascript">
$(function(){
    cvsInit();

});

function cvsInit(){
    var opt={width:1000,height:700};
    var cvsMain = new fabric.Canvas('cvs-main',opt);

    fabric.Image.fromURL('${ctxStatic}/images/icons/icon01.png', function(img) {
        img.scale(0.3).set({
          left: 100,
          top: 100,
        });
         img.hasControls = img.hasBorders  = false;
        cvsMain.add(img).setActiveObject(img);
      });

    fabric.Image.fromURL('${ctxStatic}/images/icons/icon02.png', function(img) {
      img.scale(0.3).set({
        left: 100,
        top: 200
      });
       img.hasControls = img.hasBorders = false;
      cvsMain.add(img).setActiveObject(img);
    });

}

</script>

</body>
</html>