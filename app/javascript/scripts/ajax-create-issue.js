//------------- Create Issue with ajax
$(document).on('ready turbolinks:load', function() {
    $('.sidebar-adding#formIssue form').submit(function(e) {
        e.preventDefault();
        $("#issue_engine_id").removeAttr('disabled');

        datas = $(this).serializeArray();

        //console.log(datas);

        $.ajax({
            type: 'POST',
            url: '/issues',
            data: datas,
            success: function(data) {},
            error: function(response) {}
        });


    });

});