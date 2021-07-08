$(document).on('ready turbolinks:load', function() {


    //------------- Create Tag with ajax // Method 2
    $('.form-add-tag form').submit(function(e) {
        e.preventDefault();
        datas = $(this).serializeArray();

        $.ajax({
            type: 'POST',
            url: '/tags',
            data: datas,
            success: function(data) {},
            error: function(response) {}
        });

    });


    //------------- Create Company with ajax // Method 2
    $('#createCompany').submit(function(e) {
        e.preventDefault();
        datas = $(this).serializeArray();

        $.ajax({
            type: 'POST',
            url: '/companies',
            data: datas,
            success: function(data) {},
            error: function(response) {}
        });

    });

    //------------- Chosen Library
    $('#engine_tag_ids, #engine_room_id').chosen({
        max_selected_options: 1,
        allow_single_deselect: true,
        width: '100%'
    });

    $('#select_name_engine').chosen({
        max_selected_options: 1,
    });

    //------------- Manipulate simple calendar next and previous month
    // Previous Link
    var firstLinkElem = $('.calendar-heading a:first-child');
    var hrefFirstLink = firstLinkElem.attr('href');
    var newFirstLink = hrefFirstLink + "#calendarTarget";
    firstLinkElem.attr('href', newFirstLink);

    // Next Link
    var secondLinkElem = $('.calendar-heading a:last-child');
    var hrefSecondLink = secondLinkElem.attr('href');
    var newSecondLink = hrefSecondLink + "#calendarTarget";
    secondLinkElem.attr('href', newSecondLink);

    //------------- Search by name engines index
    $('#select_name_engine').on('change', function() {
        var url = $(this).val();
        if (url) {
            window.location = url;
        }
        return false;
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