var ready = function(){
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

    $('span#board-name').editable("click", function(e){
        update_data = {id: $('span#board-name').data('id'), name: e.value }
        $.ajax({
            type: "PUT",
            url: '/boards/name',
            data: {board: update_data}
        });
    });
}


$(document).ready(ready);

$(window).bind('page:change', ready);
