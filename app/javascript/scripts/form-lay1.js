$(document).on('ready turbolinks:load', function() {

    // ------------ Manipulate input type File
    $('input#issue_validation_file').on('input', function() {
        var newFileName = $(this).val().replace(/C:\\fakepath\\/i, '');
        $('.form-lay1__input.file label span').html(newFileName);

        $('.pop-up-issue-update form input[type="submit"]').prop('disabled', false);
    });

});