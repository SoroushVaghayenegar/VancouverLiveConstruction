/**
 * Created by RYFFV on 31.03.15.
 */

$(function(){
    $(".ip_butt").click(function(){
        var ip = $("#IP");
        if ($(ip).css("display") == 'block') {
            $(ip).css("display", "none");
        }
        else {
            $("#IP").css("display", "block");
            $("#UP").css("display", "none");
            $("#RC").css("display", "none");
        }
    });
});

$(function(){
    $(".up_butt").click(function(){
        if ($("#UP").css("display") == 'block') {
            $("#UP").css("display", "none");
        }
        else {
            $("#IP").css("display", "none");
            $("#UP").css("display", "block");
            $("#RC").css("display", "none");
        }
    });
});

$(function(){
    $(".rc_butt").click(function(){
        if ($("#RC").css("display") == 'block') {
            $("#RC").css("display", "none");
        }
        else {
            $("#IP").css("display", "none");
            $("#UP").css("display", "none");
            $("#RC").css("display", "block");
        }
    });
});