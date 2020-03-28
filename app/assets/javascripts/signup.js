
$(document).on('turbolinks:load', function() {
   

        $("#user_profile_attributes_profile_type").on('change', function(){
            
            selected = $("#user_profile_attributes_profile_type").val();
            if (selected == "Patient"){
                $(".user-speciality").css("display", "none");
            }
            else if (selected == "Prestataire"){
                $(".user-speciality").css("display", "block");
                
            }

        });

        

});

