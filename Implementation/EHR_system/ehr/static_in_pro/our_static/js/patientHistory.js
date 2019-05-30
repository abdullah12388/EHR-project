$(document).ready(function () {
    var elements = $(".elements");
    var medicine_body = $(".medicine_body");
    var arr_1 = [];
    var arr_2 = [];
    for( i=0; i<elements.length; i++ ) {
        arr_1.push($(".elements:eq("+ i +")"));
    }
    for( i=0; i<medicine_body.length; i++ ) {
        arr_2.push($(".medicine_body:eq("+ i +")"));
    }
    for( i=0; i<12; i++ ) {
        // console.log("i = ", i);
        // console.log(arr_1[i]);
        arr_1[i].click(function(){
            console.log(i);
        });
    }
    // var tehaTest = $("#tehaTest");
    // elements.each(function () {
    //     for( i=0; i<12; i++ ) {
    //     $(this).click(function () {
    //
    //           arr_2[i].css("background-color", "red");
    //
    //     });
    //     }
    // });

    console.log(arr_1[10], arr_2.length);
    arr_1[0].click(function(){
        arr_2[0].slideToggle(400);
    });
    arr_1[1].click(function(){
        arr_2[1].slideToggle(400);
    });
    arr_1[2].click(function(){
        arr_2[2].slideToggle(400);
    });
    arr_1[3].click(function(){
        arr_2[3].slideToggle(400);
    });
    arr_1[4].click(function(){
        arr_2[4].slideToggle(400);
    });
    arr_1[5].click(function(){
        arr_2[5].slideToggle(400);
    });
    arr_1[6].click(function(){
        arr_2[6].slideToggle(400);
    });
    arr_1[7].click(function(){
        arr_2[7].slideToggle(400);
    });
    arr_1[8].click(function(){
        arr_2[8].slideToggle(400);
    });
    arr_1[9].click(function(){
        arr_2[9].slideToggle(400);
    });
    arr_1[10].click(function(){
        arr_2[10].slideToggle(400);
    });
    arr_1[11].click(function(){
        arr_2[11].slideToggle(400);
    });
    arr_1[12].click(function(){
        arr_2[12].slideToggle(400);
    });
    arr_1[13].click(function(){
        arr_2[13].slideToggle(400);
    });


});