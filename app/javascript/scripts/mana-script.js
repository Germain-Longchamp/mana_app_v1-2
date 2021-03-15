$(document).on('ready turbolinks:load', function() {
    // Manage Device Notice Visibility
    var deviseMsg = $('#notice');
    var deviseBox = $('.devise-msg');
    var deviseClose = $('.devise-msg__close');

    if (deviseMsg.is(':empty')) {
        deviseBox.removeClass('displayed');
    } else {
        deviseBox.addClass('displayed');
    }

    deviseClose.click(function() {
        deviseBox.hide();
    });

    // Manage click on filter Engines Index
    var selectBtn = $('.filter-item-select__btn');
    var selectDrop = $('.filter-item-select__dropdown');

    $(selectBtn).click(function() {
        selectDrop.toggleClass('visible');
    });
});