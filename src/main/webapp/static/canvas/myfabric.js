
$(function(){
    cvsInit2();
});

function cvsInit2(){

    var opt={width:1248,height:768,backgroundColor:'#eee'};
    var cvsMain = new fabric.Canvas('cvs-main',opt);
    cvsMain.items={};

    fabricAddButton(cvsMain,'/wshbj/static/images/icons/icon08.png','体检用户','/wshbj/a/wshbj/examinationUser/list',80,100,120,{'zoom1':true});

    fabricAddButton(cvsMain,'/wshbj/static/images/icons/icon07.png','体检单位','/wshbj/a/wshbj/organ/list',80,100,280,{'zoom1':true});

    fabricAddButton(cvsMain,'/wshbj/static/images/icons/icon06.png','体检套餐','/wshbj/a/wshbj/examinationPackage/list',80,100,440,{'zoom1':true});

    fabricAddButton(cvsMain,'/wshbj/static/images/icons/icon04.png','医生',null,100,600,360);

    fabricAddButton(cvsMain,'/wshbj/static/images/icons/icon12.png','1 信息登记','/wshbj/a/wshbj/examinationRecord/form',80,600,120,{'zoom1':true});

    fabricAddButton(cvsMain,'/wshbj/static/images/icons/icon10.png','2 样品采集','/wshbj/a/wshbj/examinationSamples/form',80,860,260,{'zoom1':true});

    fabricAddButton(cvsMain,'/wshbj/static/images/icons/icon10.png','3 样品结果','/wshbj/a/wshbj/examinationRecord/inputSamplesResult',80,790,570,{'zoom1':true});

     fabricAddButton(cvsMain,'/wshbj/static/images/icons/icon09.png','4 样本结果录入','/wshbj/a/wshbj/examinationRecord/inputResult',80,450,600,{'zoom1':true});

     fabricAddButton(cvsMain,'/wshbj/static/images/icons/icon13.png','5 制卡','/wshbj/a/wshbj/certRecord/form',80,300,360,{'zoom1':true});

    fabricLine(cvsMain,'#666',{'x':200,'y':50},{'x':200,'y':520},6);


    fabricArraw(cvsMain,'#f60',{x:600,y:280},{x:600,y:190},10,20,40,40);
    fabricArraw(cvsMain,'#f60',{x:665,y:320},{x:810,y:280},10,20,40,40);
    fabricArraw(cvsMain,'#f60',{x:640,y:415},{x:754,y:546},10,20,40,40);
    fabricArraw(cvsMain,'#f60',{x:562,y:418},{x:477,y:556},10,20,40,40);
    fabricArraw(cvsMain,'#f60',{x:545,y:343},{x:352,y:346},10,20,40,40);


    fabricEvent(cvsMain);
}

function fabricEvent(_canvas){
    _canvas.on('mouse:up',function(evt){
        var item= evt.target;
        if(item==null){
            return;
        }

        // 点击事件处理超级链接
        if(item.linkURL!=null){
            window.open(item.linkURL,'mainFrame');
        }

    })

    function mouseForOver(evt){
        mouseEvent(evt,'over');
    }
    function mouseForOut(evt){
        mouseEvent(evt,'out');
    }

    function mouseEvent(evt,evtType){

        var item=evt.target;
        if(item==null||item.evtKeys==null){
            return
        }

        // 验证对象绑定的事件
        if(item.evtKeys.zoom1){
            var _w=item.width;
            var _startWidth = evtType=='over'?_w:_w*1.1;
            var _endWidth = evtType=='over'?_w*1.1:_w;

            fabric.util.animate({
                startValue:_startWidth,
                endValue:_endWidth,
                duration:300,
                ease:'easeInOutBounce',
                onChange:function(val){
                    item.scaleToWidth(val);
                    _canvas.renderAll();
                }
            });
        }

        if(item.evtKeys.change_fill!=null){
            var clr1 = item.evtKeys.change_fill.color1;
            var clr2 = item.evtKeys.change_fill.color2;

            var clr= evtType == 'over'? clr2:clr1;

            item.setColor(clr);
            _canvas.renderAll();
        }

        if(item.evtKeys.change_stroke_color!=null){
            var clr1 = item.evtKeys.change_stroke_color.color1;
            var clr2 = item.evtKeys.change_stroke_color.color2;

            var clr= evtType == 'over'? clr2:clr1;

            item.stroke=clr;
            _canvas.renderAll();
        }
    }

    function mouseForMove(evt){
        console.log(evt.e.x+"  "+evt.e.y);
    }



    _canvas.on('mouse:over',mouseForOver);
    _canvas.on('mouse:out',mouseForOut);
    _canvas.on('mouse:move',mouseForMove);
}


function fabricAddButton(_canvas,_imgUrl,_title,_linkURL,_width,_left,_top,_evtKeys){
    // 装载护士图片
    fabric.Image.fromURL(_imgUrl,function(img){
        img.selectable = img.hasControls = img.hasBorders = false;
        img.set({left:0,top:0});
        img.scaleToWidth(_width);

        // 获取图片原 width height
        var imgSrcWidth= img.width;
        var imgSrcHeight= img.height;

       // get image scale height
        var scaleHeight= _width/imgSrcWidth*imgSrcHeight;

        // get title top
        var titleTop= scaleHeight-10;
        var titleLeft = _width/2;

        var txt = new fabric.Text(_title,{top:titleTop,left:titleLeft,originX:'center',fontFamily:'微软雅黑',stroke:"#333",strokeWidth:0.5,
        shadow: 'rgba(0,0,0,0.3) 5px 5px 5px' ,fontSize:16,textAlign:'center',fill:'#f50',fontWeight:800});
        txt.selectable = txt.hasControls = txt.hasBorders = false;

        // 创建护士图标组
        var grpButton=new fabric.Group([img,txt],{left:_left,top:_top,originX:'center',originY:'center'});
        grpButton.selectable = grpButton.hasControls = grpButton.hasBorders = false;
        grpButton.scaleToWidth(_width);
        grpButton.evtKeys=_evtKeys;
        grpButton.linkURL = _linkURL;

        _canvas.hoverCursor = 'pointer';
        _canvas.add(grpButton);
    });
}



/*** 绘制一条线  **/
function fabricLine(_canvas,_stroke,_startPoint,_endPoint,_width){
    var ps=[_startPoint.x,_startPoint.y,_endPoint.x,_endPoint.y];
    var l=new fabric.Line(ps,{strokeWidth:_width,stroke:_stroke});

    l.evtKeys={'change_stroke_color':{'color1':_stroke,'color2': '#ccc'}};
    _canvas.add(l);
}

/*** 绘制箭头  **/
function fabricArraw(_canvas,_fill,_startPoint,_endPoint,_ganWidth1,_ganWidth2,_headLong,_headWidth){

    var angle = getAngle(_startPoint.x,_startPoint.y,_endPoint.x,_endPoint.y)+270;

    // 根据开始点和结束点，获得斜度的sin 和 cos 值
    var _cos=Math.cos(angle*Math.PI/180);
    var _sin=Math.sin(angle*Math.PI/180);

    if(Math.abs(_cos)==1){
        _sin=0;
    }

    if(Math.abs(_sin)==1){
        _cos=0;
    }

    // 计算总长度，可能会出现负值
    var _long= Math.abs(_cos ==0? _endPoint.y-_startPoint.y :(_endPoint.x-_startPoint.x)/_cos);
    var _ganLong = _long - _headLong ;

    var sx=_startPoint.x;
    var sy=_startPoint.y;

    // 杆儿的终止点的坐标
    var px2 = sx+_ganLong*_cos;
    var py2 = sy+_ganLong*_sin;

    var p1={x:sx,y:sy};
    var p2={x:sx+_ganWidth1/2*_sin,y:sy-_ganWidth1/2*_cos};
    var p3={x:px2+_ganWidth2/2*_sin ,y:py2-_ganWidth2/2*_cos};
    var p4={x:px2+_headWidth/2*_sin,y:py2-_headWidth/2*_cos};
    var p5={x:sx+_long*_cos,y:sy+_long*_sin};
    var p6={x:px2-_headWidth/2*_sin,y:py2+_headWidth/2*_cos};
    var p7={x:px2-_ganWidth2/2*_sin,y:py2+_ganWidth2/2*_cos};
    var p8={x:sx-_ganWidth1/2*_sin,y:sy+_ganWidth1/2*_cos};
    var p9={x:sx,y:sy};

    console.log(angle+"   "+_long+"  "+_ganLong);

    console.log(px2+"   "+py2);

    var ps=[p1,p2,p3,p4,p5,p6,p7,p8,p9];
    var polygon=new fabric.Polygon(ps,{fill:_fill});
    polygon.evtKeys={'change_fill':{'color1':_fill,'color2':'#f90'}};

    _canvas.add(polygon);

}


/***********  基础函数  **************/

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