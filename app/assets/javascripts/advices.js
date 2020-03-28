$(document).on('turbolinks:load', function(){
    // On Selection change
    $("#advice_consultation_type_id").on('change', function(){

        ajaxFilterPost("#advice_consultation_type_id", "/advices/get_doctors", "GET");
    });
});