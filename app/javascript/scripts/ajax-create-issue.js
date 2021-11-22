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


    // Delete multiple selected elements
    $('#deleteSelectionIssues').click(function() {
        $('.issue-delete-checkbox.selected').each(function() {
            let issueCard = $(this).parents('.card-issue');
            let dataId = issueCard.attr('data-id');

            $.ajax({
                type: 'DELETE',
                url: '/issues/' + dataId,
                success: function(data) {
                    issueCard.fadeOut();
                    $('#numberSelectedIssues').html('0');
                    $('.selected-issues').fadeOut();
                },
                error: function(response) {}
            });
        });
    });
});