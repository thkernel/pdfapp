$(document).on('turbolinks:load', function(){


    $('#guard-list-modal').on('shown.bs.modal', function() {
        // Get doctor by service
        ajaxFilterPost("#guard_list_service_id", "/guard_lists/get_doctors", "GET");

    });
});