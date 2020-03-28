$(document).on('turbolinks:load', function(){


    $('#doctor-availability-modal').on('shown.bs.modal', function() {
        // Get doctor by service
        ajaxFilterPost("#doctor_availability_service_id", "/doctor_availabilities/get_doctors", "GET");

    });
});