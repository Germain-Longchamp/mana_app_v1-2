$(document).on('ready turbolinks:load', function() {

    $('#startSignUp').click(function() {
        $('#screenStart').hide();
        $('#screenCompany').show();
    });

    //------------- Create Tag with ajax // Method 2
    $('.form-add-tag form').submit(function(e) {
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

    //------------- Create Company with ajax // Method 2
    $('#createCompany').submit(function(e) {
        e.preventDefault();
        datas = $(this).serializeArray();

        $.ajax({
            type: 'POST',
            url: '/companies',
            data: datas,
            success: function(data) {
                $('#screenCompany').hide();
                $('#screenWaiting').show();

                setTimeout(
                    function() {
                        $('#screenWaiting').hide();
                        $('#screenUser').show();
                    }, 3000);
            },
            error: function(response) {}
        });

    });
});