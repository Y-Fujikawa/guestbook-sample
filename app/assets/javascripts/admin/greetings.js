$(function() {
    $("#change_enable").on("ajax:success", function(event, xhr, settings) {
        alert("hoge");
        console.log("ajax:success!")
    });
});
