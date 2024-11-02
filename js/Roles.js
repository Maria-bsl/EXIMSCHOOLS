$('#btnUpdate').hide();
$('#btnConfirm').hide();
$('#btnSave').hide();

function ClickNew() {
    $('#txtName').attr("disabled", false);
    $('#txtName').focus();
    $('input[name="Status"]').attr('disabled', false);
    $('input[name="Admin"]').attr('disabled', false);
    $('#txtName').focus();

    $('#btnNew').hide();
    $('#btnSave').show();
    $('#btnChange').attr("disabled", true);
    $('#btnCancel').attr("disabled", true);
    $('#btnUpdate').hide();
    $('#btnConfirm').hide();
}

function Change() {
    $('#btnCancel').attr("disabled", true);
    $('#txtName').attr("disabled", false)
    $("#txtName").focus();
    $('input[name="Status"]').attr('disabled', false);
    $('input[name="Admin"]').attr('disabled', false);
    $("#txtName").focus();

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
//get the row
function getrowDatadtls(x) {
    $("#btnNew").attr("disabled", true);
    $("#btnNew").show();
    $("#btnSave").hide();
    $("#btnChange").attr("disabled", false);
    $("#btnCancel").attr("disabled", false);
    //COLOR ON ROW
    //$('tr td').css({ 'background-color': '' });
    //$('td', x).css({ 'background-color': '#C368B4' });

    var RowIndex = x.rowIndex;

    $("#txtcode").val(document.getElementById('tbl_ListDetails').rows[RowIndex].cells[0].innerHTML);
    $("#txtName").val(document.getElementById('tbl_ListDetails').rows[RowIndex].cells[1].innerHTML);
    if (document.getElementById('tbl_ListDetails').rows[RowIndex].cells[2].innerHTML == "Inactive")
        $("input[name='Status'][value='I']").prop("checked", true);
    else
        $("input[name='Status'][value='A']").prop("checked", true);

    if (document.getElementById('tbl_ListDetails').rows[RowIndex].cells[3].innerHTML == "Yes")
        $("input[name='Admin'][value='Y']").prop("checked", true);
    else
        $("input[name='Admin'][value='N']").prop("checked", true);

}
//Displaying the data
function ShowDetails() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Roles.aspx/GETDETAILS",
        data: "{}",
        dataType: "json",
        success: function (data) {
            $("#tbody_ListDetails").html("");
            for (var i = 0; i < data.d.length; i++) {
                var Status = "";
                var AdminType = "";
                if (data.d[i].STATUS == 'A') {
                    Status = "Active";
                }
                else {
                    Status = "Inactive";
                }

                if (data.d[i].AdminType == "Y") {
                    AdminType = "Yes";
                }
                else {
                    AdminType = "No";
                }
                $("#tbody_ListDetails").append("<tr onclick='getrowDatadtls(this);'>" +
                            "<td style='text-align:left;'>" + data.d[i].CODE + "</td>" +
                            "<td style='text-align:left;'>" + data.d[i].NAME + "</td>" +
                            "<td style='text-align:left;'>" + Status + "</td>" +
                            "<td style='text-align:left;'>" + AdminType + "</td>" +
                            "</tr>");
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(xhr.responseText);
            alert(thrownError);
        }
    });
    clearREfresh();
}

//Insert the data
function clickSave() {
    var count = 0;
    var NAME = $('#txtName').val();
    var STATUS = $("input[name=Status]:checked").val();
    var ADMINTYPE = $("input[name=Admin]:checked").val();
    if (NAME == "") {
        alert('Description Should not be empty');
        return false;
    }
    $("#tbl_ListDetails").children("tbody").children("tr").each(function (i) {
        var $this = $(this);
        var my_td = $this.children("td");
        var second_col = my_td.eq(1).html();
        if (second_col == NAME) {
            count++;
        }
    });
    if (count == 0) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Roles.aspx/INSERTDETAILS",
            data: "{'NAME':'" + NAME + "', 'STATUS':'" + STATUS + "', 'ADMINTYPE':'" + ADMINTYPE + "'}",
            dataType: "json",
            success: function (data) {
                alert('Inserted Successfully');
                ShowDetails();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(xhr.responseText);
                alert(thrownError);
            }
        });

    }
    else {
        alert("Data exist.");
        $('#txtName').focus();
    }
    clearREfresh();
}
//update the data
function clickupdate() {
    var count = 0;
    var CODE = $('#txtcode').val();
    var NAME = $('#txtName').val();
    var STATUS = $("input[name=Status]:checked").val();
    var ADMINTYPE = $("input[name=Admin]:checked").val();
    $("#tbl_ListDetails").children("tbody").children("tr").each(function (i) {
        var $this = $(this);
        var my_td = $this.children("td");
        var second_col = my_td.eq(1).html();
        var THIRD_col = my_td.eq(2).html();
        var Fourth_col = my_td.eq(3).html();
        var Temstatus = "";
        var TempAdminType = "";
        if (STATUS == "A") {
            Temstatus = "Active";
        }
        else {

            Temstatus = "Inactive";
        }

        if (ADMINTYPE == "Y") {
            TempAdminType = "Yes";
        }
        else {
            TempAdminType = "No";
        }

        if (second_col == NAME && THIRD_col == Temstatus && Fourth_col == TempAdminType) {
            count++;
        }
        // alert(count);

    });

    if (count == 0) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Roles.aspx/UPDATEDETAILS",
            data: "{'CODE':'" + CODE + "', 'NAME':'" + NAME + "', 'STATUS':'" + STATUS + "', 'ADMINTYPE':'" + ADMINTYPE + "'}",
            dataType: "json",
            success: function (data) {
                alert('Updated Successfully');
                ShowDetails();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(xhr.responseText);
                alert(thrownError);

            }
        });
    }
    else {
        alert("Data exist.");
        $('#txtName').focus();

    }
    clearREfresh();


    //            $('input[type=text]').each(function () {

    //                $(this).val('');

    //            });
}

//cancel the record
function cancelation() {
    var CODE = $('#txtcode').val();
    var STATUS = $("input[name=Status]:checked").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Roles.aspx/CANCELDETAILS",
        data: "{'CODE':'" + CODE + "', 'STATUS':'" + STATUS + "'}",
        dataType: "json",
        success: function (data) {
            alert('cancelled successfully');
            ShowDetails();
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
        $('#txt_Name').attr("disabled", true)
        $("input[name=Status]").filter("[value='A']").prop("checked", true);
    });

}
//function Print() {
//    var BillRecoveryPRINT = '' +
//                     '<table style="width: 100%; font-weight: initial; font-size: 1em;' +
//                    ' border-collapse: collapse;" border="1" cellpadding="0" cellspacing="0"><tbody>' +
//                    '<tr><td>' + $('#tbl_ListDetails').html() + '</td> ' +
//                    '</tbody></table>' +
//                    '</tbody></table>';
//    PrintTableDetails(BillRecoveryPRINT, 'Activity Centres List')
//}