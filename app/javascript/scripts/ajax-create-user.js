//------------- Create Room with ajax
$(document).on('ready turbolinks:load', function() {
    $('.sidebar-adding#formUser form').submit(function(e) {
        e.preventDefault();
        datas = $(this).serializeArray();

        $.ajax({
            type: 'POST',
            url: '/users',
            data: datas,
            success: function(data) {},
            error: function(response) {}
        });

    });
});