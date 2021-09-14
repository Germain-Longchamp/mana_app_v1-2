//------------- Create Tag with ajax
$(document).on('ready turbolinks:load', function() {
    $('.sidebar-adding#formIssueCategory form').submit(function(e) {
        e.preventDefault();
        datas = $(this).serializeArray();

        $.ajax({
            type: 'POST',
            url: '/types',
            data: datas,
            success: function(data) {},
            error: function(response) {}
        });

    });
});