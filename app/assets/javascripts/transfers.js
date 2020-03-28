$(document).on('turbolinks:load', function(){


    $('#transfer-modal').on('shown.bs.modal', function() {
        // Get doctor by service
        ajaxFilterPost("#transfer_service_id", "/transfers/get_doctors", "GET");

    });
});