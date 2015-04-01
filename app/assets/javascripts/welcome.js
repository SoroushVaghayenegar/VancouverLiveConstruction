$(function(){
    $(".deleteIPConstr").click(function(){
        var elem_t = $(this).parent();
        $(this).prop('disabled', true);
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
        $(this).prop('disabled', true);
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
        $(this).prop('disabled', true);
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
        $(this).prop('disabled', true);
        $(".deleteIPConstr").prop('disabled', true);
        $(".deleteUPConstr").prop('disabled', true);
        $(".deleteRCConstr").prop('disabled', true);
        $.ajax({
            url: '/load_data/',
            type: 'POST',
            success: function(){
                location.reload();
            }
        });
    });
    $('#loading').css('display', 'none');
});
