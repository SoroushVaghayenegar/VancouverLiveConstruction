$(function(){
    $(".deleteIPConstr").click(function(){
        var elem_t = $(this).parent();
        $.ajax({
            url: '/delete_constr/',
            type: 'POST',
            data: {c_id: $(this).attr('id'), type: "IP"}
        });
        var i_count = +($(".badge_ip").text());
        $(".badge_ip").text(i_count-1);
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
        var i_count = +($(".badge_up").text());
        $(".badge_up").text(i_count-1);
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
        var i_count = +($(".badge_rc").text());
        $(".badge_rc").text(i_count-1);
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

$(function(){
    $(".load_btn").click(function(){
        $('#loading').css('display', 'inline');
        $.ajax({
            url: '/load_data/',
            type: 'POST'
        });
        location.reload();
    });
    $('#loading').css('display', 'none');
});
