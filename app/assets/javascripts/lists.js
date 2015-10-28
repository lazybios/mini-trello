$(document).ready(function(){
    $('.main').on('click', '.open-card', function(){
        $(this).css({'display': 'none'});
        $('#new-card-'+ $(this).data('id')).css({'display':'block'});
    });

    $('.cancel').click(function(e){
        id = $(this).data('id')
        $('#open-card-'+id).css({'display': 'block'});
        $('#new-card-'+id).css({'display':'none'});
        e.preventDefault();
    });

});
