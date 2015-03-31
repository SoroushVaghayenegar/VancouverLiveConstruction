/**
 * Created by RYFFV on 30.03.15.
 */

$(function(){
    $(".deleteIPConstr").click(function(){
        var elem_t = $(this).parent();
        $.ajax({
            url: '/delete_constr/',
            type: 'POST',
            data: {c_id: $(this).attr('id'), type: "IP"}
        });
        $(elem_t).fadeOut(300);
    });
});

$(function(){
    $(".deleteUPConstr").click(function(){
        var elem_t = $(this).parent();
        $.ajax({
            url: '/delete_constr/',
            type: 'POST',
            data: {c_id: $(this).attr('id'), type: "UP"}
        });
        $(elem_t).fadeOut(300);
    });
});

$(function(){
    $(".deleteRCConstr").click(function(){
        var elem_t = $(this).parent();
        $.ajax({
            url: '/delete_constr/',
            type: 'POST',
            data: {c_id: $(this).attr('id'), type: "RC"}
        });
        $(elem_t).fadeOut(300);
    });
});

$(function(){
    $(".save_pref").click(function(){
        var rc_pref = $('.rc_checkbox').prop('checked', true);
        var og_pref = $('.og_checkbox').prop('checked', true);
        var fc_pref = $('.fc_checkbox').prop('checked', true);
        $(this).fadeOut(200)
    });
});


