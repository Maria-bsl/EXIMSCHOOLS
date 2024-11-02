//ShowDetailsff();
//        ShowDetails();

$('#btnUpdate').hide();
$('#btnConfirm').hide();
$('#btnSave').hide();

function Enable() {
    $('#txtEmail').attr("disabled", false);
    $('#txtmobaile').attr("disabled", false);
    $('#txtFName').attr("disabled", false);
    $('#txtMName').attr("disabled", false);
    $('#txtLName').attr("disabled", false);
    $('input[name="Status"]').attr('disabled', false);
    $('#dd_Designation').attr("disabled", false);
    $('#DD_Shehia').attr("disabled", false);
    $('#dd_District').attr("disabled", false);
    $('#dd_Region').attr("disabled", false);
    //$('#DDstore').attr("disabled", false);
}

function Disable() {
    $('#txtEmail').attr("disabled", true);
    $('#txtmobaile').attr("disabled", true);



    $('#txtFName').attr("disabled", true);
    $('#txtMName').attr("disabled", true);
    $('#txtLName').attr("disabled", true);
    $('input[name="Status"]').attr('disabled', true);
    $('#dd_Designation').attr("disabled", true);
    $('#DD_Shehia').attr("disabled", true);
    $('#dd_District').attr("disabled", true);
    $('#dd_Region').attr("disabled", true);
    // $('#DDstore').attr("disabled", true);
}


function ClickNew() {
    Enable();
    $('#txtcode').focus();
    $('#btnNew').hide();
    $('#btnSave').show();
    $('#btnChange').attr("disabled", true);
    $('#btnCancel').attr("disabled", true);
    $('#btnUpdate').hide();
    $('#btnConfirm').hide();
}

function Change() {
    $('#btnCancel').attr("disabled", true);
    Enable();
    $('#txtcode').attr("disabled", true);
    $('#txtEmail').attr("disabled", false);
    $('#txtmobaile').attr("disabled", false);
    $('#txtFName').focus();

    $("#btnChange").hide();
    $("#btnUpdate").show();
    $('#btnPrint').attr("disabled", true);
    $('#btnCancel').attr("disabled", true)
}
function cancel() {
    $("#btnConfirm").show();
    $("#btnCancel").hide();
    $('#btnChange').attr("disabled", true);
    $('#btnConfirm').attr("disabled", false);
}
function confirmrole() {
    $("input[name='Status'][value='I']").prop("checked", true);
    cancelation();
    $("#btnConfirm").hide();
    $("#btnCancel").show();
    $('#btnCancel').attr("disabled", true)
}

//cancel the record
function cancelation() {
    var CODE = $('#txtcode').val();
    var STATUS = $("input[name=Status]:checked").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Master/Masters_Employees.aspx/CANCELDETAILS",
        data: "{'CODE':'" + CODE + "', 'STATUS':'" + STATUS + "'}",
        dataType: "json",
        success: function (data) {
            alert('cancelled successfully');
            ShowDetailsff();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(xhr.responseText);
            alert(thrownError);

        }
    });
    clearREfresh();

}

//refresh the text field
function clearREfresh() {
    $('input[type=text]').each(function () {
        $(this).val('');
        $('#btnCancel').attr("disabled", true);
        $('#btnChange').attr("disabled", true);
        $('#btnNew').attr("disabled", false);
        $('#btnPrint').attr("disabled", false);
        $("#btnUpdate").hide();
        $("#btnChange").show();
        $("#btnConfirm").hide();
        $("#btnCancel").show();
        $("#btnSave").hide();
        $("#btnNew").show();
        $('#txtFName').attr("disabled", true)
        $('#txtMName').attr("disabled", true)
        $('#txtLName').attr("disabled", true)
        $("input[name=Status]").filter("[value='A']").prop("checked", true);
        $("select").val("");
    });

}


function bind_dd_Designation() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Master/Masters_Employees.aspx/BindDDDesignation",
        data: "{}",
        dataType: "json",
        success: function (data) {
            $("#dd_Designation").html("");
            $("#dd_Designation").append("<option value=''> Select Designation </option>");
            $.each(data.d, function (key, value) {
                $("#dd_Designation").append("<option value='" + value.Designation_ID + "'>" + value.Designation_desc + "</option>");
            });
            //            $("#Patient_AdmittingDoc").val(txtSessionDoctor.val());
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(xhr.responseText);
            alert(thrownError);
        }
    });
}



function bindregiond() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Master/Masters_Employees.aspx/BindDDRegiondtls",
        data: "{}",
        dataType: "json",
        success: function (data) {
            $("#dd_Region").html("");
            $("#dd_Region").append("<option value=''> Select Region </option>");
            $.each(data.d, function (key, value) {
                $("#dd_Region").append("<option value='" + value.RegionCode + "'>" + value.RegionNAME + "</option>");
            });
           // alert('bindregiond');
            bindDistrict();

        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(xhr.responseText);
            alert(thrownError);
        }
    });
}


function bindDistrict() {
    var Region = $("#dd_Region").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Master/Masters_Employees.aspx/GETDistrictDetails",
        data: "{'Region':'" + Region + "'}",
        dataType: "json",
        success: function (data) {
            $("#dd_District").html("");
            $("#DD_Shehia").html("");
            $("#dd_District").append("<option value=''> Select District </option>");
            $.each(data.d, function (key, value) {

                $("#dd_District").append("<option value='" + value.CODE + "'>" + value.NAME + "</option>");
            });
            //alert('bindDistrict');
            bindShehia();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(xhr.responseText);
            alert(thrownError);
        }
    });
}



function bindShehia() {
    var District = $("#dd_District").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Master/Masters_Employees.aspx/BindShehiha",
        data: "{'District':'" + District + "'}",
        dataType: "json",
        success: function (data) {
            $("#DD_Shehia").html("");
            $("#DD_Shehia").append("<option value=''> Select City </option>");
            $.each(data.d, function (key, value) {
                $("#DD_Shehia").append("<option value='" + value.CODE + "'>" + value.NAME + "</option>");
            });
            //alert('bindShehia');
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(xhr.responseText);
            alert(thrownError);
        }
    });
}
