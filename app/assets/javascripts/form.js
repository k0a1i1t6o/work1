$(function() {
    $('#r_select').click(function(){
        $(this).blur();

        pointY = $(window).scrollTop();

        $('html').css({
            'position': 'fixed',
            'width': '100%',
            'top': -pointY,
        });

        $('#form').fadeIn("slow");
    });

    $('#search').click(function(){
        $(this).blur();

        pointY = $(window).scrollTop();

        $('html').css({
            'position': 'fixed',
            'width': '100%',
            'top': -pointY,
        });        
        $('#search_result').fadeIn("slow");
        $("#form").fadeOut("slow");
    });

    $(".close-btn").click(function(){
        $("#form").fadeOut("slow");
        //背景固定を解除する
        releaseScrolling();    
    });

});

  //背景固定解除
function releaseScrolling(){
    $('html').css({
        'position': 'relative',
        'width': '',
        'top': ''
    });
    $(window).scrollTop(pointY);
}