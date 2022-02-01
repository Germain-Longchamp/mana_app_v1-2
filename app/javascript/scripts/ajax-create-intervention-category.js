//------------- Create Intervention Category with ajax
$(document).on('ready turbolinks:load', function() {
    $('.sidebar-adding#formInterventionCategory form').submit(function(e) {
        e.preventDefault();
        datas = $(this).serializeArray();

        console.log(datas);

        $.ajax({
            type: 'POST',
            url: '/intervention_categories',
            data: datas,
            success: function(data) {},
            error: function(response) {}
        });


    });
});