$(document).ready(function(){
    $('.open-card').click(function(){
        $(this).css({'display': 'none'});
        $('.add-new-card').css({'display':'block'});
    });

    $('#cancel').click(function(){
        $('.add-new-card').css({'display':'none'});
        $('.open-card').css({'display':'block'});
    });
});
