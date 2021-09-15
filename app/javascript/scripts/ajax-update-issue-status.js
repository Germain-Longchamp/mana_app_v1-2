$(document).on('ready turbolinks:load', function() {
    // ------------AJAX UPDATE ISSUE TO RESOLVED
    const cloudinaryURL = 'https://api.cloudinary.com/v1_1/hwerhj1ii/image/upload';
    /*
    $('form#updateIssue').submit(function(e) {

    });
    */

    window.ajaxSuccess = function() {
        console.log('on a reussi');
    };
    window.AJAXSubmit = function(formElement) {
        console.log(formElement);
        var xhr = new XMLHttpRequest();
        xhr.open("post", "https://api.cloudinary.com/v1_1/hwerhj1ii/image/upload/");
        xhr.send(new FormData(formElement));

        /*
        var cardIssue = $(this).parents('.card-issue');

        var idIssue = cardIssue.attr('data-id');
        var patchUrl = '/issues/' + idIssue;

        var fileIssue = $(this).find('input[type="file"]').val();

        var datas = [{
            "name": "issue[id]",
            "value": idIssue,
        }, {
            "name": "issue[status]",
            "value": "resolu"
        }];

        console.log(datas);


        $.ajax({
            type: 'PATCH',
            url: patchUrl,
            data: datas,
            success: function(data) {
                // Close Pop Up
                $('.js-screen-open.open').removeClass('open');

                // Remove from the list and add to resolved              
                cardIssue.remove();
                cardIssue.find('.up-issue').hide();
                $('#renderResolvedIssues').prepend(cardIssue);
            },
            error: function(response) {}
        });
        */

    };


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