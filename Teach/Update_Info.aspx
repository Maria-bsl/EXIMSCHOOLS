<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update_Info.aspx.cs" MasterPageFile="~/Head_Teach.Master" Inherits="Schools.Teach.Update_Info" %>

<%@ MasterType VirtualPath="~/Head_Teach.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .blueWindowLayer {
            width: 100% !important;
            max-width: 1080px;
            padding: .5em;
            left: 50% !important;
            transform: translateX(-50%);
        }

        div#myWindow_VendorDetIndx_ct {
            width: 100% !important;
            padding: 1em 0;
        }

        #myWindow_VendorDetIndx_content {
            padding: 0 1em;
        }

        #tbl_VendorIndxIss_wrapper {
            padding-top: 1em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/LoginAssets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.12.2.min.js"></script>
    <script type="text/javascript" src="/LoginAssets/js/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="/LoginAssets/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/LoginAssets/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/LoginAssets/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/datatables.min.js"></script>
    <script type="text/javascript">
        var temprow = null;
        var tble = null;
        var tblee = null;
        var tbleee = null;
        var tblItemBatchDet = null;

        function OnLoadFunction_HelpScreen(tbl_ID) {
            $(".divHelpMstindx").focus();
            // when a key is pressed
            var rowLength = $('#' + tbl_ID + ' tr').length;
            $(document).on("keydown", function (e) {

                switch (e.keyCode) {
                    case 38: // up
                        if ($("#" + tbl_ID + " tbody tr.activeCurrent").prev().length) {
                            $("#" + tbl_ID + " tbody tr.activeCurrent").removeClass("activeCurrent").prev()
                                .addClass("activeCurrent");
                            $(".divHelpMstindx").focus();
                        }
                        break;
                    case 40: // down
                        if ($("#" + tbl_ID + " tbody tr.activeCurrent").next().length) {
                            $(".divHelpMstindx").focus();

                            $("#" + tbl_ID + " tbody tr.activeCurrent").removeClass("activeCurrent").next()
                                .addClass("activeCurrent");
                        }
                        break;
                    case 13: // enter
                        if ($("#" + tbl_ID + " tbody tr").length > 0) {
                            $("#" + tbl_ID + " tbody tr.activeCurrent").find("a").click();
                        }
                        break;
                }

            });
        }

        function ManageTableRowMasterIndxArrowKey(tbl_ID) {
            // the first row will be active by default
            $("#" + tbl_ID + " tbody tr:first-child").addClass("activeCurrent");
        }

        function OnChangeVendorNO() {
            var vend = "";
            var vend1 = "";
            var vend2 = "";
            var vend3 = 0;
            $("#<%=dMain.ClientID%>").hide();
            //["dMain"].style.visibility = 'hidden';
            $("#<%=txtRegion.ClientID%>").val(vend);
            $("#<%=txthSP.ClientID%>").val(vend2);
            var e = document.getElementById('<%= ddlClass1.ClientID %>');
            var sec = e.options[e.selectedIndex].value;
            VendorDetMasterIndx_Load(sec);
            $(".divHelpMstindx").focus();
        }
        $(document).ready(function () {
            tbleee = $("#tbl_VendorIndxIss").DataTable({
                'paging': false,
                'sorting': true,
                'scrollY': 420,
                'background': 'none'
            });
            $('#tbl_VendorIndxIss tbody').on('dblclick', 'tr', function () {
                var data = tbleee.row(this).data();
                //alert(data[0]+ data[1]+ data[2]+ data[3]);
                //getrowDataList_VendorIndx(data[0], data[1], data[2], data[3]);
                getrowDataList_VendorIndx(data[0]);
            });
        });


        OnLoadFunction_HelpScreen('tbl_VendorIndxIss');

        function VendorDetMasterIndx_Load(abc) {
            myWindow_VendorDetIndx.Open();

            var UserArr = {};
            //alert(VENDORNO);
            $("#tbody_VendorIndxIss").html("");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Update_Info.aspx/GET_VENDOR_DETAILS?claid=" + abc,
                data: "{UserArr: " + JSON.stringify(UserArr) + "}",
                dataType: "json",
                success: function (data) {

                    tbleee.clear().draw();
                    //alert(data.d[0].VENDORADDRESS);
                    //alert(data.d.length);
                    //var cnt = 0;
                    for (var r = 0; r < data.d.length; r++) {
                        //alert(r);
                        //cnt = cnt + 1;
                        //var temprow = "<tr ondblclick='getrowDataList_VendorIndx(" + r + ")' onclick='getSelectedRowCSS(this, \"tbl_VendorIndxIss\");'>" +
                        var temprow = "<tr>" +
                            // "<td style='display:none;'>" + data.d[r].SNO + "</td>" +
                            "<td style='text-align:left; width:50%;'>" + data.d[r].AM_No + "</td>" +
                            "<td style='text-align:left; width:50%;'>" + data.d[r].Stu_Name + "</td>" +
                            //"<td style='text-align:left; width:10%;'>" + data.d[r].Sector_ID + "</td>" +
                            //"<td style='text-align:left; width:40%;'>" + data.d[r].Sector_Name + "</td>" +
                            //"<td style='display:none;'>" + data.d[r].Sector_ID + "</td>"
                            "<td style='display:none;'><a onclick='getrowDataList_VendorIndx(" + r +
                            ")'>Select</a></td>" +
                            "</tr>";
                        //ManageTableRowMasterIndxArrowKey('tbl_VendorIndxIss');
                        tbleee.row.add($(temprow)).draw(false);

                        //alert(r);


                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    //alert(xhr.status);
                    //alert(xhr.responseText);
                    //alert(thrownError);
                }
            });
        }
        /*function getrowDataList_VendorIndx(a, b, c, d, e) {
            getSelectedRecords_VendorIndx(a, b, c, d, e);
            myWindow_VendorDetIndx.Close();
            $("#tbody_VendorIndxIss").html("");
        }*/
        function getrowDataList_VendorIndx(a, b) {
            //alert(x+"satish");
            getSelectedRecords_VendorIndx(a);
            myWindow_VendorDetIndx.Close();
            $("#tbody_VendorIndxIss").html("");
        }

        function getSelectedRecords_VendorIndx(a, b) {
            //alert(a + ", " + b + ", " + c + ", "+ d);
            //var RowIndex = x;

            /*var VendorId = document.getElementById('tbl_VendorIndxIss').rows[RowIndex].cells[1].innerHTML;
            var VendorId1 = document.getElementById('tbl_VendorIndxIss').rows[RowIndex].cells[3].innerHTML;
            var SpID = document.getElementById('tbl_VendorIndxIss').rows[RowIndex].cells[0].innerHTML;
            var ScID = document.getElementById('tbl_VendorIndxIss').rows[RowIndex].cells[2].innerHTML;
            //var VendorAddress = document.getElementById('tbl_VendorIndxIss').rows[RowIndex].cells[3].innerHTML; */

            var VendorId = a;
            //var VendorId1 = d;
            var SpID = a;
            //var ScID = c;

            $("#<%=txtRegion.ClientID%>").val(VendorId);
            $("#<%=txthSP.ClientID%>").val(SpID);
            $("#<%=txthSP1.ClientID%>").val(VendorId);

            /*var tbl = $("[id$=GridViewItemPurList]");
            var rows = tbl.find('tr');
            $(rows[1]).find("[id*=txtID]").focus();*/

        }

        function getSelectedRowCSS(x, tbl_ID) {
            $("#" + tbl_ID + " tbody tr.activeCurrent").removeClass("activeCurrent");
            $(x).addClass("activeCurrent");
        }
    </script>
    <%-- <Left="210" Top="125" Height="525" Width="850" VisibleOnLoad="false" StyleFolder="~/js/wdstyles/blue" Title="Admission No. List"> --%>


    <owd:Window ID="myWindow_VendorDetIndx" runat="server" IsModal="true" ShowCloseButton="true"
        Status="Select Service Provider" Left="0" Top="75" Height="525" Width="320" VisibleOnLoad="false"
        StyleFolder="~/js/wdstyles/blue" Title="Admission No. List">
        <div class="divHelpMstindx table-responsive" tabindex='1'>
            <table id="tbl_VendorIndxIss" class="table table-bordered" style="width: 100%;">
                <thead>
                    <tr class="success">
                        <th style="text-align: left; width: 50%;">Admission No
                        </th>
                        <th style="text-align: left; width: 50%;">Student Name
                        </th>
                        <th style="display: none">Admission</th>
                    </tr>
                </thead>
                <tbody id="tbody_VendorIndxIss">
                </tbody>
                <%-- <tbody id="tbody_VendorIndxIss" style="border-collapse: collapse; overflow: auto; max-height: 415px; border: 1px solid black; display: block;">
                </tbody>--%>
            </table>
        </div>
    </owd:Window>
    <nav aria-label="Page breadcrumb">
        <ol class="breadcrumb mb-1 bg-white py-1 border">
            <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
            <li class="breadcrumb-item">Edit Student Details</li>
        </ol>
    </nav>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Edit Student Details</h5>

            <div class="row">
                <div class="form-group col-md-6 row mx-0 format-120">
                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Class</asp:Label>
                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass1">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvClass1" ValidationGroup="first" CssClass="red_new"
                        ControlToValidate="ddlClass1" Display="Dynamic" ErrorMessage="Please select class">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="form-group col-md-6 row mx-0 format-120">
                    <label class="col-md-3 col-form-label pl-0">Admission No:</label>
                    <div class="input-group col-md-9 px-0">
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtRegion" autocomplete="off"
                            MaxLength="100"></asp:TextBox>
                        <div class="input-group-append">
                            <span class="input-group-text btn btn-sm btn-biz_logic"
                                onclick="OnChangeVendorNO();">Search</span>
                            <!-- <img CssClass="input-group-text" src="../images/search1.png" height="38"
                                onclick="OnChangeVendorNO();" alt="Smiley face"> -->
                        </div>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ID="rfvDept" ValidationGroup="first" CssClass="red_new"
                        ControlToValidate="txtRegion" Display="Dynamic" ErrorMessage="Please enter admission no">
                    </asp:RequiredFieldValidator>
                    <asp:HiddenField ID="txthSP" runat="server" />
                    <asp:HiddenField ID="txthSP1" runat="server" />
                </div>

                <div class="form-group col-12 d-flex justify-content-end">
                    <%-- <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnUpdate" runat="server" Text="Update"
                    ValidationGroup="second" OnClick="btnUpdate_Click" /> --%>
                    <asp:ImageButton ID="btnSubmit" ValidationGroup="first" runat="server"
                        style="vertical-align:bottom;" ImageUrl="~/images/find.png" Height="34"
                        OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>




        <div id="dMain" class="table-responsive" runat="server" visible="false">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 25%;">
                        <label>First Name</label>
                    </td>
                    <td style="width: 25%;">
                        <asp:TextBox runat="server" ID="txtFullName" MaxLength="50" Width="150">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfv4" ValidationGroup="second"
                            ControlToValidate="txtFullName" CssClass="red_new" Display="Dynamic"
                            ErrorMessage="Please enter first name">
                        </asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 25%;">
                        <label>Middle Name</label>
                    </td>
                    <td style="width: 25%;">
                        <asp:TextBox runat="server" ID="txtMName" MaxLength="50" Width="150">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="width: 100%; height: 10px;"></td>
                </tr>
                <tr>
                    <td style="width: 25%;">
                        <label>Last Name</label>
                    </td>
                    <td style="width: 25%;">
                        <asp:TextBox runat="server" ID="txtLName" MaxLength="50" Width="150">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvLName" ValidationGroup="second"
                            ControlToValidate="txtLName" CssClass="red_new" Display="Dynamic"
                            ErrorMessage="Please enter last name">
                        </asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 25%;">
                        <label>Parent Name</label>
                    </td>
                    <td style="width: 25%;">
                        <asp:TextBox runat="server" ID="txtPName" MaxLength="50" Width="150">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPName" ValidationGroup="second"
                            ControlToValidate="txtPName" CssClass="red_new" Display="Dynamic"
                            ErrorMessage="Please enter parent name">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="width: 100%; height: 10px;"></td>
                </tr>
                <tr>
                    <td style="width: 25%;">
                        <label>Mobile No.</label>
                    </td>
                    <td style="width: 25%;">
                        <asp:TextBox runat="server" ID="txtWork" MaxLength="9" Width="150"
                            ToolTip="Mobile No:(ex:784777777)">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvWork" ValidationGroup="second"
                            CssClass="red_new" ControlToValidate="txtWork" Display="Dynamic"
                            ErrorMessage="Please enter phone number">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="revWork" ValidationGroup="second"
                            CssClass="red_new" ValidationExpression="^[0-9]{9}$" ControlToValidate="txtWork"
                            Display="Dynamic" ErrorMessage="Please enter valid number">
                        </asp:RegularExpressionValidator>

                    </td>
                    <td style="width: 25%;">
                        <label>Email</label>
                    </td>
                    <td style="width: 25%;">
                        <asp:TextBox runat="server" ID="txtEmailID" MaxLength="100" Width="150">
                        </asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" ValidationGroup="second"
                            ControlToValidate="txtEmailID" CssClass="red_new"
                            ErrorMessage="Please enter the valid Email ID"
                            ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                            Display="Dynamic"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="width: 100%; height: 10px;"></td>
                </tr>
                <tr>
                    <td style="width: 25%;">
                        <asp:Label runat="server" ID="Label1">Class</asp:Label>
                    </td>
                    <td style="width: 25%;">
                        <asp:DropDownList runat="server" ID="ddlClass" Width="150" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvClass" CssClass="red_new"
                            ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select class">
                        </asp:RequiredFieldValidator>

                    </td>
                    <td style="width: 25%;">
                        <asp:Label runat="server" ID="lblCity">Programme/Combination/Stream</asp:Label>
                    </td>
                    <td style="width: 25%;">
                        <asp:DropDownList runat="server" ID="ddlSection" Width="150">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new"
                            ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="width: 100%; height: 10px;"></td>
                </tr>
                <tr>
                    <td style="width: 25%;">
                        <asp:Label runat="server" ID="Label3">Gender</asp:Label>
                    </td>
                    <td style="width: 25%;">
                        <asp:DropDownList class="form-control" runat="server" ID="rblGender">
                                        <asp:ListItem   Value="m">Male</asp:ListItem>
                                        <asp:ListItem  Value="f">Female</asp:ListItem>
                                    </asp:DropDownList>
                            
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" CssClass="red_new offset-md-3"
                                ControlToValidate="rblGender" Display="Dynamic"
                                ErrorMessage="Please select gender"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 25%;">
                       
                    </td>
                    <td style="width: 25%;">
                       </td>
                </tr>
                <tr>
                    <td colspan="4" style="width: 100%; height: 10px;"></td>
                </tr>
            </table>
            <table style="width: 100%;">
                <tr>
                    <td colspan="3" style="width: 100%; height: 10px;"></td>
                </tr>
                <tr>
                    <td style="width: 98%; text-align: right;">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" ValidationGroup="second"
                            OnClick="btnUpdate_Click" />

                        <asp:Button runat="server" ID="btnCancel" CausesValidation="false" Text="Cancel"
                            OnClick="btnCancel_Click" />
                    </td>
                    <td style="width: 2%;"></td>
                </tr>
                <tr>
                    <td colspan="3" style="width: 100%; height: 20px;"></td>
                </tr>
            </table>
        </div>

    </div>
</asp:Content>