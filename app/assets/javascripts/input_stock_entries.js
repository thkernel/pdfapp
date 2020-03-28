$(document).on('turbolinks:load', function(){


    $('#input-stock-entry-modal').on('shown.bs.modal', function() {
        

        // Get inputs
        ajaxFilterPost("#input_stock_entry_input_type_id", "/input_stock_entries/get_inputs", "GET");

        

    
    })


    



})