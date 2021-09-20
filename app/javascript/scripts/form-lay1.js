$(document).on('ready turbolinks:load', function() {

    // ------------ Manipulate input type File -- Update issue
    $('.mod-edit-issue form input[type="submit"]').prop('disabled', true);

    $('.mod-edit-issue form input#issue_validation_file').on('input', function() {
        var newFileName = $(this).val().replace(/C:\\fakepath\\/i, '');
        $('.form-lay1__input.file label span').html(newFileName);

        $('.mod-edit-issue form input[type="submit"]').prop('disabled', false);
    });

});