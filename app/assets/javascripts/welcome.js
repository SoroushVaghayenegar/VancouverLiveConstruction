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
        $.ajax({
            url: '/pref/',
            type: 'POST',
            data: {pref_ip: $('input[name="og_checkbox"]').is(":checked"), pref_up: $('input[name="fc_checkbox"]').is(":checked"), pref_rc: $('input[name="rc_checkbox"]').is(":checked"), user_id: $(this).attr('id')}
        });
    });
});


