$(document).on('turbolinks:load', function(){


    $('#hospitalization-modal').on('shown.bs.modal', function() {
        // Get doctor by service
        ajaxFilterPost("#hospitalization_service_id", "/hospitalizations/get_doctors", "GET");

    });
});