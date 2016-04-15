$(function() {
    $(".change_enable").on("click", function() {
        var btn = $(this);
        btn.prop('disabled', true);
        $.ajax({
            url: "/ja/admin/greetings/" + $(this).next("input").val() + "/enable",
        }).done(function(data) {
            if (btn.text() == "非公開") {
                btn.text("公開");
            } else {
                btn.text("非公開");
            }
        }).fail(function(data) {
            alert("error!");
        }).always(function(data) {
            btn.prop('disabled', false);
        });
    });
});
