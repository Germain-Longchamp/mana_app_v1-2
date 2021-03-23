$(document).on('ready turbolinks:load', function() {
    //------------- Chosen Library
    $('#engine_tag_ids, #engine_room_id').chosen({
        max_selected_options: 1,
        allow_single_deselect: true,
        width: '100%'
    });

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
    // Manage when click on button
    $(selectBtn).each(function() {
        $(this).click(function(e) {
            var dataSelectBtn = $(this).attr('data-select');
            var dropdownSelect = $(".filter-item-select__dropdown[data-select=" + dataSelectBtn + "]");

            dropdownSelect.toggleClass('visible');

            dropdownSelect.closest('.mod-engines-index__filter').siblings().find('.filter-item-select__dropdown').removeClass('visible');;
            e.stopPropagation();
        });
    });

    // Manage when click outside
    $(document).on("click", function(e) {
        if ($(e.target).is('.mod-engines-index__filter') === false) {
            $('.filter-item-select__dropdown').removeClass('visible');
        }
    });
});