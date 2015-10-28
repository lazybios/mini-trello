var set_list_positions;

set_list_positions = function(){
    $('.cards').each(function(i){
        $(this).attr("data-post", i+1);
    });
}

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

    set_list_positions();
    $('.sortable-outer').sortable({items: ':not(.disabled)'});
    $('.sortable-outer').sortable().bind('sortupdate', function(e, ui){
        update_order = [];
        set_list_positions();

        $('.cards').each(function(i){
            update_order.push({ id: $(this).data("id"), position: i+1});
        });

        $.ajax({
            type: "PUT",
            url: "/lists/sort",
            data: {order: update_order}
        });
    });
}


$(document).ready(ready);

$(window).bind('page:change', ready);
