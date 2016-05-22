$(document).on("ready", inicio);

function inicio() {
    $("#buttonSend").click(validar);
}

function validar() {
    var id = document.getElementById("inputId").value;
    var tipodcto = document.getElementById("inputTipodcto").value;
    var numdcto = document.getElementById("inputNumdcto").value;

    if (id == '') {
        $("#inputId").parent().attr("class", "input-group has-error").attribute("required");
        //$("#inputId").parent().attribute("required");
        return false;
    }
    else {
        $("#inputId").parent().attr("class", "input-group has-success");
    }

    if (tipodcto == '') {
        $("#inputTipodcto").parent().attr("class", "input-group has-error").attribute("required");
        //$("#inputTipodcto").parent().attribute("required");
        return false;
    }
    else {
        $("#inputTipodcto").parent().attr("class", "input-group has-success");
    }

    if (numdcto == '') {
        $("#inputNumdcto").parent().attr("class", "input-group has-error").attribute("required");
        //$("#inputNumdcto").parent().attribute("required");
        return false;
    }
    else {
        $("#inputNumdcto").parent().attr("class", "input-group has-success");
    }
}