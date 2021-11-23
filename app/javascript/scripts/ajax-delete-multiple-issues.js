// ------------------------ Fake selected archived issue card and delete with ajax
$(document).on('ready turbolinks:load', function() {
    // Init number of selected cards
    let numberSelected = 0;

    // Manage click on fake checkbox for css and update number selected
    $('.issue-delete-checkbox').click(function() {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            numberSelected--
        } else {
            $(this).addClass('selected');
            numberSelected++
        }

        // Manage sidebar visibility for button delete if selected > 0
        if (numberSelected > 0) {
            $('.selected-issues').fadeIn();
            $('#numberSelectedIssues').html(numberSelected);
        } else {
            $('.selected-issues').fadeOut();
        }

    });

    // Delete multiple selected elements
    $('#deleteSelectionIssues').click(function() {

        // Loop on each selected cards
        $('.issue-delete-checkbox.selected').each(function() {
            let issueCard = $(this).parents('.card-issue');
            let dataId = issueCard.attr('data-id');

            // Ajax delete request
            $.ajax({
                type: 'DELETE',
                url: '/issues/' + dataId,
                success: function(data) {
                    numberSelected = 0;
                    issueCard.fadeOut(300, function() {
                        $(this).remove();
                    });
                    $('#numberSelectedIssues').html('0');
                    $('.selected-issues').fadeOut();
                },
                error: function(response) {}
            });
        });
    });
});