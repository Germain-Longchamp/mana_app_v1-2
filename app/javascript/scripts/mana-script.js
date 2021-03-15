$(document).on('ready turbolinks:load', function() {
    // ------------ Manage Device Notice Visibility
    var deviseMsg = $('#notice');
    var deviseBox = $('.devise-msg');
    var deviseClose = $('.devise-msg__close');
    // Manage devise box notics
    if (deviseMsg.is(':empty')) {
        deviseBox.removeClass('displayed');
    } else {
        deviseBox.addClass('displayed');
    }
    // Manage close button
    deviseClose.click(function() {
        deviseBox.hide();
    });

    // ------------- Manage click on filter Engines Index
    var selectBtn = $('.filter-item-select__btn');
    var selectDrop = $('.filter-item-select__dropdown');
    // Manage when click on button
    $(selectBtn).click(function(e) {
        selectDrop.toggleClass('visible');
        e.stopPropagation();
    });
    // Manage when click outside
    $(document).on("click", function(e) {
        if ($(e.target).is('.mod-engines-index__filter') === false) {
            $(selectDrop).removeClass('visible');
        }
    });
});