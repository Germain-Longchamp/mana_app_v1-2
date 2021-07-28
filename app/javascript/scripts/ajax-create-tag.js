//------------- Create Tag with ajax
$(document).on('ready turbolinks:load', function() {
    $('.sidebar-adding#formTag form').submit(function(e) {
        e.preventDefault();
        datas = $(this).serializeArray();

        $.ajax({
            type: 'POST',
            url: '/tags',
            data: datas,
            success: function(data) {},
            error: function(response) {}
        });

    });
});