
$(function(){
    // cvsInit();
    cvsInit2();
});
var userWidth=120;

function cvsInit2(){

    var opt={width:1024,height:768,backgroundColor:'#eee'};
    var cvsMain = new fabric.Canvas('cvs-main',opt);
    cvsMain.items={};

    //  fabricDrawArray(_canvas,fill,left,top,ganLong,ganWidth1,ganWidth2,headLong,headWidth)
    fabricDrawArray(cvsMain,'#f70',300,300,100,20,30,40,40);

    fabricArraw(cvsMain,'#7f0',{x:520,y:220},{x:150,y:230},10,20,40,40);

    // 装载护士图片
    fabric.Image.fromURL('/wshbj/static/images/icons/icon01.png',function(img){
        img.selectable = img.hasControls = img.hasBorders = false;
        img.set({left:0,top:0});
        img.scaleToWidth(100);

        var txt = new fabric.Text('护士',{top:110,left:50,originX:'center',fontFamily:'微软雅黑',stroke:"#333",strokeWidth:0.5,
        shadow: 'rgba(0,0,0,0.3) 5px 5px 5px' ,fontSize:20,textAlign:'center',fill:'#f50',fontWeight:800});
        txt.selectable = txt.hasControls = txt.hasBorders = false;


        // 创建护士图标组
        var groupNurse=new fabric.Group([img,txt],{left:200,top:200,originX:'center',originY:'center'});
        groupNurse.selectable = groupNurse.hasControls = groupNurse.hasBorders = false;
        groupNurse.scaleToWidth(120);
        groupNurse.evtKeys=['zoom1'];
        groupNurse.linkURL = '/wshbj/a/wshbj/examinationSamples/form';

        cvsMain.hoverCursor = 'pointer';
        cvsMain.add(groupNurse);
    });

    cvsMain.on('mouse:up',function(evt){
        var item= evt.target;
        if(item==null){
            return;
        }

        // 点击事件处理超级链接
        if(item.linkURL!=null){
            window.open(item.linkURL,'mainFrame');
        }

    })

    function zoomForOver(evt){
        zoomEvent(evt,'over');
    }
    function zoomForOut(evt){
        zoomEvent(evt,'out');
    }

    function zoomEvent(evt,evtType){
        var item=evt.target;
        if(item==null||item.evtKeys==null){
            return
        }
        var _startWidth = evtType=='over'?userWidth:userWidth*1.1;
        var _endWidth = evtType=='over'?userWidth*1.1:userWidth;

        // 验证对象绑定的事件
        if(item.evtKeys.contains('zoom1')){
            fabric.util.animate({
                startValue:_startWidth,
                endValue:_endWidth,
                duration:300,
                ease:'easeInOutBounce',
                onChange:function(val){
                    item.scaleToWidth(val);
                    cvsMain.renderAll();
                }
            });
        }
    }

    cvsMain.on('mouse:over',zoomForOver);
    cvsMain.on('mouse:out',zoomForOut);

}

function fabricDrawArray(_canvas,fill,left,top,ganLong,ganWidth1,ganWidth2,headLong,headWidth){
    var px=left;
    var py=top+ganWidth1/2;

    var ps=[{x:px,y:py},{x:px,y:py-ganWidth1/2},{x:px+ganLong,y:py-ganWidth2/2},{x:px+ganLong,y:py-headWidth/2},{x:px+ganLong+headLong,y:py},{x:px+ganLong,y:py+headWidth/2},{x:px+ganLong,y:py+ganWidth2/2}
    ,{x:px,y:py+ganWidth1/2},{x:px,y:py}];
    var polygon=new fabric.Polygon(ps,{left:left,top:top,fill:fill});
    _canvas.add(polygon);
}

function fabricArraw(_canvas,_fill,_startPoint,_endPoint,_ganWidth1,_ganWidth2,_headLong,_headWidth){

    var angle = getAngle(_startPoint.x,_startPoint.y,_endPoint.x,_endPoint.y)+270;

    var _cos=Math.cos(angle*Math.PI/180);
    var _sin=Math.sin(angle*Math.PI/180);

    var _long= Math.abs((_endPoint.x-_startPoint.x)/_cos);
    var _ganLong = _long - _headLong;

    var px2 = _ganLong*_cos;
    var py2 = _ganLong*_sin;

    var p1={x:0,y:0};
    var p2={x:_ganWidth1/2*_sin,y:-_ganWidth1/2*_cos};
    var p3={x:px2+_ganWidth2/2*_sin ,y:py2-_ganWidth2/2*_cos};
    var p4={x:px2+_headWidth/2*_sin,y:py2-_headWidth/2*_cos};
    var p5={x:_long*_cos,y:_long*_sin};
    var p6={x:px2-_headWidth/2*_sin,y:py2+_headWidth/2*_cos};
    var p7={x:px2-_ganWidth2/2*_sin,y:py2+_ganWidth2/2*_cos};
    var p8={x:-_ganWidth1/2*_sin,y:_ganWidth1/2*_cos};
    var p9={x:0,y:0};

console.log(angle+"   "+_long);
console.log(_cos+"  "+_sin);
console.log(px2+"  "+py2);
    console.log(p2);
    console.log(p3);
    console.log(p4);
    console.log(p5);
    console.log(p6);
    console.log(p7);console.log(p8);console.log(p9);


    var ps=[p1,p2,p3,p4,p5,p6,p7,p8,p9];
    var polygon=new fabric.Polygon(ps,{left:_startPoint.x,top:_startPoint.y,fill:_fill});
    _canvas.add(polygon);

}
//
//var sw=90;
//var ew=100;
//
//function cvsInit(){
//    var opt={width:1000,height:700};
//    var cvsMain = new fabric.Canvas('cvs-main',opt);
//
//    fabricLoadImg(cvsMain,'/wshbj/static/images/icons/icon01.png',"img1",100,100,sw,['scale']);
//    fabricLoadImg(cvsMain,'/wshbj/static/images/icons/icon02.png',"img2",100,240,sw,['no_scale']);
//
//    fabricAddText(cvsMain,"护士","txtNurse",100,150,['scale']);
//
//    fabricAniScale(cvsMain,['scale'],'mouse:over',sw,ew,300);
//    fabricAniScale(cvsMain,['scale'],'mouse:out',ew,sw,300);
//
//    var f=fabricGetById(cvsMain,'txtNurse');
//    f.fontFamily = '黑体';
//    f.fontWeight = 700;
//    f.fontSize = 50;
//    f.fill= '#f30';
//
//    cvsMain.hoverCursor="pointer";
//
//}
//
//function fabricGetById(_canvas,_id){
//    if(_canvas.objects==null){
//        return null;
//    }
//    return _canvas.objects[_id];
//}
//
//// 装载一张图片
//function fabricLoadImg(_canvas,_imgUrl,_id,_left,_top,_width,_evtKeys){
//    if(_canvas.objects==null){
//        _canvas.objects={};
//    }
//
//    if(_canvas.objects[_id] != null){
//        console.log("已经存在元素的id="+ _id);
//        return ;
//    }
//
//    fabric.Image.fromURL(_imgUrl, function(img) {
//        img.set({
//          left: _left,top: _top,originX:'center',originY:'center'
//        });
//        img.scaleToWidth(_width);
//
//        if(_evtKeys!=null&&_evtKeys.contains('no_scale')){
//            try{
//                img.filters.push(new fabric.Image.filters.Grayscale());
//                img.applyFilters();
//            }catch(err){
//                console.log(err);
//            }
//        }
//
//        img.hasControls = img.hasBorders = img.selectable = false;
//        img.evtKeys = _evtKeys;
//
//        // 在画布对象中添加一个json对象，存储所有的对象
//        _canvas.objects[_id] = img;
//
//        _canvas.add(img);
//    });
//}
//
//function fabricAddText(_canvas,_text,_id,_left,_top,_height,_evtKeys){
//    if(_canvas.objects==null){
//        _canvas.objects={};
//    }
//
//    if(_canvas.objects[_id] != null){
//        console.log("已经存在元素的id="+ _id);
//        return ;
//    }
//
//    var txt=new fabric.Text(_text,{left:_left,top:_top ,originX:'center',originY:'center'});
//    txt.scaleToHeight(16);
//    txt.hasControls = txt.hasBorders = txt.selectable = false;
//
//    _canvas.objects[_id]=txt;
//    _canvas.add(txt);
//
//}
//
//function fabricAniScale(_canvas,_evtKeys,_evt,_startWidth,_endWidth,_duration){
//   _canvas.on(_evt,function(evt){
//       var tgt=evt.target;
//
//       if(tgt==null){
//           return false;
//       }
//
//       if(tgt.evtKeys==null||!tgt.evtKeys.contains('scale')){
//           return false;
//       }
//       fabric.util.animate({
//           startValue:_startWidth,
//           endValue:_endWidth,
//           duration:_duration,
//           ease:fabric.util.ease.easeInOutBounce,
//           onChange:function(val){
//               tgt.scaleToWidth(val);
//               _canvas.renderAll();
//           }
//       });
//    });
//}

Array.prototype.contains = function ( needle ) {
  for (i in this) {
    if (this[i] == needle) return true;
  }
  return false;
}

function getAngle(px,py,mx,my){//获得人物中心和鼠标坐标连线，与y轴正半轴之间的夹角
    var x = Math.abs(px-mx);
    var y = Math.abs(py-my);
    var z = Math.sqrt(Math.pow(x,2)+Math.pow(y,2));
    var cos = y/z;
    var radina = Math.acos(cos);//用反三角函数求弧度
    var angle = Math.floor(180/(Math.PI/radina));//将弧度转换成角度

    if(mx>px&&my>py){//鼠标在第四象限
        angle = 180 - angle;
    }

    if(mx==px&&my>py){//鼠标在y轴负方向上
        angle = 180;
    }

    if(mx>px&&my==py){//鼠标在x轴正方向上
        angle = 90;
    }

    if(mx<px&&my>py){//鼠标在第三象限
        angle = 180+angle;
    }

    if(mx<px&&my==py){//鼠标在x轴负方向
        angle = 270;
    }

    if(mx<px&&my<py){//鼠标在第二象限
        angle = 360 - angle;
    }
    return angle;
}