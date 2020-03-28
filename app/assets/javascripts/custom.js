
$(document).on('turbolinks:load', function(){
    $('#medicament-modal').on('shown.bs.modal', function() {

        // On Unit price
        $("#medicament_unit_price").on('focusout', function(){
            medicament_unit_price = $('#medicament_unit_price').val();
            medicament_total_price = medicament_unit_price
            $("#medicament_total_price").val(medicament_total_price );
        });

        // On VAT field
        $("#medicament_vat").on('focusout', function(){
            var medicament_vat = parseFloat($("#medicament_vat").val());

            var medicament_unit_price = parseFloat($('#medicament_unit_price').val());
            
            var medicament_total_vat = parseFloat((medicament_unit_price * medicament_vat) / 100);
            console.log("VAT VAlue: ", medicament_total_vat);
            medicament_total_price = medicament_unit_price + medicament_total_vat
            console.log("VAT VAlue: ", medicament_total_price);

            $("#medicament_total_price").val(medicament_total_price );
        });
    })


    //Insurance limit age 
    $('#insurance-modal').on('shown.bs.modal', function() {
        // On modal show


        function deplayLimitAge(){
            limited = $('#insurance_limited').val();
            if (limited != null && limited == "Oui"){
                $(".insurance_limit_age").css("display", "block");

            }
            else{
                $(".insurance_limit_age").css("display", "none");

            }
        }
        deplayLimitAge()
        // On Selection change
        $("#insurance_limited").on('change', function(){
            deplayLimitAge()
        })


    })



    // Patient insured?
    $('#patient-modal').on('shown.bs.modal', function() {

        function displayInsuranceInfos(){

            insured = $('#patient_insured').val();

            if (insured != null && insured == "Oui"){
                $(".patient_insurance").css("display", "block");
                

            }
            else{
                $(".patient_insurance").css("display", "none");
                $(".patient_dependent").css("display", "none");
                $(".patient_dependent_person_names").css("display", "none");
                $(".patient_insurance_identifier").css("display", "none");
                $(".patient_insurance_start_date").css("display", "none");
                $(".patient_insurance_end_date").css("display", "none");



            }
        }

        displayInsuranceInfos();

         // On insured Selection change
         $("#patient_insured").on('change', function(){
            displayInsuranceInfos();
        })

        // On insured Selection change
        $("#patient_insurance_id").on('change', function(){
            //displayInsuranceInfos();

            insurance_id = $('#patient_insurance_id').val();

            if (insurance_id != null){
               
                //$(".patient_insurance").css("display", "none");
                $(".patient_dependent").css("display", "block");
                //$(".patient_dependent_person_names").css("display", "none");
                $(".patient_insurance_identifier").css("display", "block");
                $(".patient_insurance_start_date").css("display", "block");
                $(".patient_insurance_end_date").css("display", "block");



            }
            else{
                $(".patient_dependent").css("display", "none");
                $(".patient_dependent_person_names").css("display", "none");
                $(".patient_insurance_identifier").css("display", "none");
                $(".patient_insurance_start_date").css("display", "none");
                $(".patient_insurance_end_date").css("display", "none");

            }

        })

        // On dependent Selection change
        $("#patient_dependent").on('change', function(){
            dependent = $('#patient_dependent').val();

            if (dependent != null && dependent == "Oui"){
                $(".patient_dependent_person_names").css("display", "block");
                

            }
            else{
                
                $(".patient_dependent_person_names").css("display", "none");
               



            }
        })

    })


    

    


    

    // Filter doctor by service.
    $('#receipt-modal').on('shown.bs.modal', function() {
        ajaxFilterPost("#receipt_service_id", "/receipts/get_doctors", "GET");
    })

    // Filter doctor by service.
    $('#receipt-modal').on('shown.bs.modal', function() {
        ajaxFilterPost("#receipt_analysis_id", "/receipts/get_analysis_amount", "GET");
    })

    
    // Consultation doctor
    ajaxFilterPost("#consultation_service_id", "consultations/get_doctors", "GET");

    // Filter medicament by medicament family.
    $('#stock-entry-modal').on('shown.bs.modal', function() {
        ajaxFilterPost("#stock_entry_medicament_family_id", "/stock_entries/get_medicaments", "GET");
    })

    // Filter medicament by medicament family.
    $('#stock-outlet-modal').on('shown.bs.modal', function() {
        ajaxFilterPost("#stock_outlet_medicament_family_id", "/stock_outlets/get_medicaments", "GET");
    })
})