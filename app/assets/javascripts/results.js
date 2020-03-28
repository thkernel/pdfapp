
/*
$(document).on("change","#result-modal", function (event) {
    //alert(event.target.id);
    console.log("Le nom: ", event.target.name);
    console.log("Le type: ", event.target.type);
    target_name = event.target.name;
    target_id = "#"+event.target.id;
    console.log("L'ID: ", target_id)
    ajaxFilterPost(target_id, "/results/get_normal_value", "GET");

});
*/


$(document).on('turbolinks:load', function(){


    $('#result-modal').on('shown.bs.modal', function() {

    });
})