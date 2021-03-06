$(document).on('ready turbolinks:load', function() {

    // ------------AJAX UPDATE ISSUE TO ARCHIVED
    $('.ar-issue').click(function() {
        var cardIssue = $(this).parents('.card-issue');

        var idIssue = $(this).attr('data-id');
        var patchUrl = '/issues/' + idIssue;
        var datas = [{
            "name": "issue[id]",
            "value": idIssue,
        }, {
            "name": "issue[status]",
            "value": "archived"
        }];

        $.ajax({
            type: 'PATCH',
            url: patchUrl,
            data: datas,
            success: function(data) {
                // Just remove from the list
                cardIssue.remove();
            },
            error: function(response) {}
        });

    });
});