$(document).ready(function(){
    $('.close-icon').on('click', function(){
        $('.bg').css({'display':'none'});
        $('.add-form').css({'display':'none'});
    });
    $('.create-board').on('click', function(){
        $('.bg').css({'display':'block'});
        $('.add-form').css({'display':'block'});
    });
});
