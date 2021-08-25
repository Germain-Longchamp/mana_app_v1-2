//------------- Create Issue with ajax
$(document).on('ready turbolinks:load', function() {
    $('.sidebar-adding#formIssue form').submit(function(e) {
        e.preventDefault();
        datas = $(this).serializeArray();

        $.ajax({
            type: 'POST',
            url: '/issues',
            data: datas,
            success: function(data) {},
            error: function(response) {}
        });

    });
});