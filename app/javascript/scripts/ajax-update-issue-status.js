$(document).on('ready turbolinks:load', function() {
    // ------------AJAX UPDATE ISSUE
    $('.up-issue').click(function() {
        var idIssue = $(this).attr('data-id');
        var patchUrl = '/issues/' + idIssue;
        var datas = [{
            "name": "issue[id]",
            "value": idIssue,
        }, {
            "name": "issue[status]",
            "value": "resolu"
        }];
        $.ajax({
            type: 'PATCH',
            url: patchUrl,
            data: datas,
            success: function(data) {},
            error: function(response) {}
        });
    });
});