function crear_json() {
  var contact_information = {
    "mobile_phone": $("#mobile_phone").val(),
    "land_line": $("#land_line").val(),
    "email": $("#email").val(),
    "address1": $("#address1").val(),
    "address2": $("#address2").val()
  }

  var person = {
    "dni": $("#dni").val(),
    "name": $("#name").val(),
    "surname": $("#surname").val(),
    "birthday": $("#birthday").val(),
    "nationality": $("#nationality").val(),
    "contact_information": contact_information
  }

  $("#person").val(JSON.stringify(person));
}

$(document).ready(function(){
    $("#addPersonButton").click(function(){
        crear_json();
    });
});
