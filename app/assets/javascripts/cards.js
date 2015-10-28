var ready = function (){
    var option = {  trigger : $("a.card-description-add"),
                    type : "textarea",
                    action : "click"};

    $("p#card-desc").editable(option, function(e){
        update_data = {id: $('.card-detail-title-name').data('id'), description: e.value }
        $.ajax({
            type: "PUT",
            url: '/cards/description',
            data: {card: update_data}
        });
    });

    $('h2.card-detail-title-name').editable('click', function(e){
        update_data = {id: $('.card-detail-title-name').data('id'), title: e.value }
        $.ajax({
            type: "PUT",
            url: '/cards/title',
            data: {card: update_data}
        });
    });
};


$(document).ready(ready)

$(window).bind('page:change', ready)

