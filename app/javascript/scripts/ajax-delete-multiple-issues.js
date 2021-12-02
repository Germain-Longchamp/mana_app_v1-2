// ------------------------ Fake selected archived issue card and delete with ajax
$(document).on('ready turbolinks:load', function() {
    //------ Init number of selected cards
    let numberSelected = 0;
    let singleSelected = false;

    //------ Manage click on fake checkbox for css and update number selected
    $('.issue-delete-checkbox').click(function() {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            $('.issue-delete-all-checkbox').removeClass('selected');
            numberSelected--
        } else {
            $(this).addClass('selected');
            numberSelected++
        }

        // Manage sidebar visibility for button delete if selected > 0
        if (numberSelected > 0) {
            $('.selected-issues').fadeIn();
            $('#numberSelectedIssues').html(numberSelected);

            singleSelected = true;
        } else {
            $('.selected-issues').fadeOut();

            singleSelected = false;
        }

    });

    //------ Manage click for selecting all issues cards
    $('.issue-delete-all-checkbox').click(function() {

        if (singleSelected) {
            numberSelected = 0;
        }

        if ($(this).hasClass('selected')) {

            $(this).removeClass('selected');
            $('.card-issue').each(function() {
                numberSelected--
                $(this).find('.issue-delete-checkbox').removeClass('selected');
            });

        } else {

            $(this).addClass('selected');
            $('.card-issue').each(function() {
                numberSelected++
                $(this).find('.issue-delete-checkbox').addClass('selected');
            });
        }

        // Manage sidebar visibility for button delete if selected > 0
        if (numberSelected > 0) {
            $('.selected-issues').fadeIn();
            $('#numberSelectedIssues').html(numberSelected);
        } else {
            $('.selected-issues').fadeOut();
        }

        singleSelected = false;
    });

    //------ Delete multiple selected elements
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