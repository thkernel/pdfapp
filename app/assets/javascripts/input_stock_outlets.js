$(document).on('turbolinks:load', function(){


    $('#input-stock-outlet-modal').on('shown.bs.modal', function() {
        

        // Get inputs
        ajaxFilterPost("#input_stock_outlet_input_type_id", "/input_stock_outlets/get_inputs", "GET");

        

    
    })


    



})