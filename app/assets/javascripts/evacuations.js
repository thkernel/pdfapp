$(document).on('turbolinks:load', function(){


    $('#evacuation-modal').on('shown.bs.modal', function() {
        // Get doctor by service
        ajaxFilterPost("#evacuation_service_id", "/evacuations/get_doctors", "GET");

    });
});