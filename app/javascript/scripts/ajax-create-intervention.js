//------------- Create Intervention with ajax
$(document).on('ready turbolinks:load', function() {
    $('.sidebar-adding#formIntervention form').submit(function(e) {
        e.preventDefault();
        datas = $(this).serializeArray();

        console.log(datas);


        $.ajax({
            type: 'POST',
            url: '/interventions',
            data: datas,
            success: function(data) {},
            error: function(response) {}
        });



    });
});