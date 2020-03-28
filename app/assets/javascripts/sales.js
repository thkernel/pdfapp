$(document).on('turbolinks:load', function(){


    $('#sale-modal').on('shown.bs.modal', function() {
        function displayPatient(){
            patient_type = $('#sale_patient_type').val();

            if (patient_type != null && patient_type == "Interne"){
                $(".sale_patient_id").css("display", "block");
                
            }
            else{
                
                $(".sale_patient_id").css("display", "none");
            
            }
        }
        displayPatient();
        // On patient type Selection change
        $("#sale_patient_type").on('change', function(){
        displayPatient();
        })

        // Filter medicament by medicament family.
        ajaxFilterPost("#sale_medicament_family_id", "/sales/get_medicaments", "GET");

        // Get medicament price.
        ajaxFilterPost("#sale_medicament_id", "/sales/get_medicament_price", "GET");

        // Calcul amount.
        $("#sale_quantity").on('focusout', function(){
            quantity = parseFloat($("#sale_quantity").val());
            unit_price = parseFloat($("#sale_unit_price").val());
            total_amount = unit_price * quantity;
            $("#sale_total_amount").val(total_amount);
        })

    
    })


    



})