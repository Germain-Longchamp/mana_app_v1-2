$(document).on('ready turbolinks:load', function() {

    // ------------Init tabs on engine show
    $('.tabs-elem__tab').each(function() {
        $(this).click(function() {
            let dataTab = $(this).attr('data-tab');
            let otherTabs = $(this).siblings();
            let tabContent = $('.tabs-elem__tab-content[data-target="' + dataTab + '"]');
            let otherTabContent = $('.tabs-elem__tab-content:not([data-target="' + dataTab + '"])');

            // Manage tabs nav appearance
            $(this).addClass('active');
            otherTabs.removeClass('active');

            // Manage tab contents
            tabContent.show();
            otherTabContent.hide();
        });
    });

    // ------------Close panel add tag
    $('.sidebar-adding__close').click(function() {
        $('#formTag').removeClass('slided');
        $('#formRoom').removeClass('slided');
        $('#formUser').removeClass('slided');
        $('#formIssue').removeClass('slided');
        $('#formIssueCategory').removeClass('slided');
        $('.overlay-sidebar').hide();
    });

    //------------- Open List engines on click tags
    $('.sp-list-actions__item').each(function() {
        var triggerBtn = $(this).find('.open-engines');
        var popInfo = $(this).find('.sp-list-actions__item-info__pop');
        var othersPop = $(this).siblings().find('.sp-list-actions__item-info__pop');

        triggerBtn.click(function() {
            if (popInfo.hasClass('opened')) {
                triggerBtn.html('Voir');
                popInfo.removeClass('opened');
            } else {
                triggerBtn.html('Fermer');
                popInfo.addClass('opened');
                othersPop.removeClass('opened');
            }

        });
    });

    // ---------- Open Pop Up
    $('.js-pop-open').each(function() {
        var dataTrigger = $(this).attr('data-name');
        var popToOpen = $(".js-screen-open[data-open=" + dataTrigger + "]");
        var triggerClose = popToOpen.find('.js-screen__close');

        // Open Pop Up on click
        $(this).click(function() {
            popToOpen.addClass('open');
        });

        // Close Pop Up on click 
        triggerClose.click(function() {
            popToOpen.removeClass('open');
        });
    });

    //------------- Chosen Library
    // Override placeholder tags chosen
    $('select#engine_tag_ids').attr('data-placeholder', 'Sélectionner une famille');

    $('#engine_tag_ids, #engine_room_id').chosen({
        max_selected_options: 1,
        allow_single_deselect: true,
        width: '100%'
    });



    $('#select_name_engine').chosen({
        max_selected_options: 1,
        allow_single_deselect: true,
    });

    $('#issue_engine_id').chosen({
        max_selected_options: 1,
        allow_single_deselect: true,
        width: '100%',
        disable_search_threshold: 1
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