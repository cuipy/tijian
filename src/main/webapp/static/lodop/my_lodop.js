// a4打印的打印机 索引数据 放在 LocalStorage中   a4_print_index
// 条码打印的打印机  索引数据放在  LocalStorage中  barcode_print_index

// 显示当前打印机的名字
function lodop_check(){

    // 检查LODOP是否安装
    if(getCLodop()==undefined){
        $('#lodop_check').show();
        return;
    }

    var arr=lodop_getPrintNames();
    for(var i in arr){
        $('#sltA4Print').append("<option value='"+i+"'>"+arr[i]+"</option>");
        $('#sltBarcodePrint').append("<option value='"+i+"'>"+arr[i]+"</option>");
        $('#sltCardPrint').append("<option value='"+i+"'>"+arr[i]+"</option>");
    }

    // A4打印机索引
    var a4Index= localStorage.getItem('a4-print-index');
    if(a4Index.length>0){
        $("#sltA4Print").val(a4Index).trigger('change');
        $('#sltA4Print').change();
    }
    // 条码打印机索引
    var barcodeIndex= localStorage.getItem('barcode-print-index');
    $("#sltBarcodePrint").val(barcodeIndex).trigger('change');
    $('#sltBarcodePrint').change();

    // 制卡打印机索引
    var cardIndex= localStorage.getItem('card-print-index');
    $("#sltCardPrint").val(cardIndex).trigger('change');
    $('#sltCardPrint').change();
}
// 获得打印机列表
function lodop_getPrintNames(){
    var arr=[];
    var LODOP = getCLodop();
    var cnt=LODOP.GET_PRINTER_COUNT();
    for(var i=0;i<cnt;i++){
        arr.push(LODOP.GET_PRINTER_NAME(i));
    }
    return arr;
}

// 设置当前A4的打印用哪个打印机
function lodop_setA4PrintIndex(){
     var ind=$('#sltA4Print').val();
     localStorage.setItem('a4-print-index',ind);
}

// 设置条码打印机
function lodop_setBarcodePrintIndex(){
     var ind=$('#sltBarcodePrint').val();
     localStorage.setItem('barcode-print-index',ind);
}

// 设置条码打印机
function lodop_setCardPrintIndex(){
     var ind=$('#sltCardPrint').val();
     localStorage.setItem('card-print-index',ind);
}

// 直接A4打印，单页打印
function lodop_printA4(title,url){
    var LODOP = getCLodop();

    LODOP.PRINT_INIT(title);
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    if(localStorage.getItem('a4-print-index')>=0){
        LODOP.SET_PRINTER_INDEX(localStorage.getItem('a4-print-index'));
    }
    LODOP.SET_PRINT_MODE("PRINT_END_PAGE",1);
    LODOP.ADD_PRINT_HTM(0,0,"210mm","297mm","URL:"+url);
    LODOP.PRINT();
}

// 直接Barcode打印，单页打印
function lodop_printBarcode(title,url){
    var LODOP = getCLodop();

    LODOP.PRINT_INIT(title);
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "50mm","10mm");
    if(localStorage.getItem('barcode-print-index')>=0){
        LODOP.SET_PRINTER_INDEX(localStorage.getItem('barcode-print-index'));
    }
    LODOP.SET_PRINT_MODE("PRINT_END_PAGE",1);
    LODOP.ADD_PRINT_HTM(0,0,"50mm","10mm","URL:"+url);
    LODOP.PRINT();
}

// 直接Barcode打印，单页打印
function lodop_printCard(title,url){
    var LODOP = getCLodop();

    LODOP.PRINT_INIT(title);
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "90mm","57mm");
    if(localStorage.getItem('card-print-index')>=0){
        LODOP.SET_PRINTER_INDEX(localStorage.getItem('card-print-index'));
    }
    LODOP.SET_PRINT_MODE("PRINT_END_PAGE",1);
    LODOP.ADD_PRINT_HTM(0,0,"90mm","57mm","URL:"+url);
    LODOP.PRINT();
}

// A4 预览并打印
function lodop_view_printA4(title,url){
    var LODOP = getCLodop();

    LODOP.PRINT_INIT(title);
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    if(localStorage.getItem('a4-print-index')>=0){
        LODOP.SET_PRINTER_INDEX(localStorage.getItem('a4-print-index'));
    }
    LODOP.SET_PRINT_MODE("PRINT_END_PAGE",1);
    LODOP.ADD_PRINT_HTM(0,0,"210mm","297mm","URL:"+url);
    LODOP.PREVIEW();
}


// 直接Barcode打印，单页打印
function lodop_view_printBarcode(title,url){
    var LODOP = getCLodop();

    LODOP.PRINT_INIT(title);
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "50mm","10mm");
    if(localStorage.getItem('barcode-print-index')>=0){
        LODOP.SET_PRINTER_INDEX(localStorage.getItem('barcode-print-index'));
    }
    LODOP.SET_PRINT_MODE("PRINT_END_PAGE",1);
    LODOP.ADD_PRINT_HTM(0,0,"50mm","10mm","URL:"+url);
    LODOP.PREVIEW();
}

// 直接Barcode打印，单页打印
function lodop_view_printCard(title,url){
    var LODOP = getCLodop();

    LODOP.PRINT_INIT(title);
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "90mm","57mm");
    if(localStorage.getItem('card-print-index')>=0){
        LODOP.SET_PRINTER_INDEX(localStorage.getItem('card-print-index'));
    }
    LODOP.SET_PRINT_MODE("PRINT_END_PAGE",1);
    LODOP.ADD_PRINT_HTM(0,0,"90mm","57mm","URL:"+url);
    LODOP.PREVIEW();
}