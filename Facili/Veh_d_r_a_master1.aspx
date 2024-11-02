<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="Veh_d_r_a_master1.aspx.cs" Inherits="Schools.Facili.Veh_d_r_a_master1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table#gvddata tbody tr {
            cursor: pointer;
        }

        table th {
            white-space: nowrap;
        }
    </style>
    <script>
        $(document).ready(function () {

            // 1.  #gvDept Table process for creating and population thead and tfoot

            var gridDept = document.querySelector('[id*=gvDept]');
            if (gridDept) {
                var gridViewHeader = gridDept.querySelector('.HeaderDatagrid');

                // Creating "<thead/>" and "<tfoot/>"
                var gridViewTHead = document.createElement("thead");

                // Appending table rows to the "<thead/>" and "<tfoot/>"
                gridViewTHead.append(gridViewHeader);

                // Prepending "<thead/>" and Appending "<tfoot/>" to the table
                gridDept.prepend(gridViewTHead);
            }

            // 2.  #gvveh Table process for creating and population thead and tfoot

            var gridData = document.getElementById('gvddata');
            var gridDataHeader = gridData.querySelector('.HeaderDatagrid');

            // Creating "<thead/>" 
            var gridDataTHead = document.createElement("thead");

            // Appending table rows to the "<thead/>"
            gridDataTHead.append(gridDataHeader);

            // Prepending "<thead/>" to the table
            gridData.prepend(gridDataTHead);

            $('table#gvddata>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });


            $(gridDept).DataTable({
                "responsive": true,
                "stateSave": true,
                "paging": false,
                "filter": false,
                "info": false,
                "lengthMenu": [
                    [10, 20, 30, 50, -1],
                    [10, 20, 30, 50, "All"]
                ],
                "sPaginationType": "full_numbers"
            });

            $(gridData).DataTable({
                "responsive": true,
                "stateSave": true,
                "lengthMenu": [
                    [10, 20, 30, 50, -1],
                    [10, 20, 30, 50, "All"]
                ],
                "sPaginationType": "full_numbers"
            });


        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:HiddenField ID="hddno" runat="server" />
        <asp:HiddenField ID="hddrout" runat="server" />
        <asp:HiddenField ID="hddroutdet" runat="server" />

        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Vehicle Drivers Route Allocation Details</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Vehicle Drivers Route Allocation Details</h5>

                <div class="row">
                    <div class="form-group col-md-6 row mx-0 format-140">
                        <label class="col-md-3 col-form-label pl-0">Vehicle Reg No.<span
                                class="red_new">*</span></label>
                        <asp:DropDownList class="col-md-9 form-control" RepeatLayout="Flow" ID="ddlvehregno"
                            runat="server">
                            <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvvehregno" CssClass="red_new"
                            ControlToValidate="ddlvehregno" Display="Dynamic"
                            ErrorMessage="Please select VehicleRegistrationNumber">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-6 row mx-0 format-140">
                        <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Driver Name<span
                                class="red_new">*</span></asp:Label>
                        <asp:DropDownList class="col-md-9 form-control" RepeatLayout="Flow" ID="ddldriname"
                            runat="server">
                        </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvdriname" CssClass="red_new"
                            ControlToValidate="ddldriname" Display="Dynamic" ErrorMessage="Please select DriverName">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-6 row mx-0 format-140">
                        <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Route Id<span
                                class="red_new">*</span></asp:Label>
                        <asp:DropDownList class="col-md-9 form-control" RepeatLayout="Flow" ID="ddlrid"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlrid_SelectedIndexChanged" runat="server">
                        </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvrid" CssClass="red_new"
                            ControlToValidate="ddlrid" Display="Dynamic" ErrorMessage="Please select Route Id">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-6 row mx-0 format-140">
                        <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Route Name
                        </asp:Label>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtname" Enabled="false" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-md-6 row mx-0 format-140">
                        <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Attendant Name
                        </asp:Label>
                        <asp:DropDownList class="col-md-9 form-control" RepeatLayout="Flow" ID="ddlaname"
                            runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-6 row mx-0 format-140">
                        <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label5">Pickup Time
                        </asp:Label>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtPT" placeholder="HH:MM" MaxLength="5" onkeypress="formatTime(this)" runat="server">
                        </asp:TextBox>
                        <asp:RegularExpressionValidator ID="rgvPT" runat="server" CssClass="red_new"
                                        ErrorMessage="please enter valid time" Display="Dynamic"
                                        ControlToValidate="txtPT" ValidationExpression="^(?:[01]?[0-9]|2[0-3]):[0-5][0-9]$">
                                    </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group col-md-6 row mx-0 format-140">
                        <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Status<span
                                class="red_new">*</span></asp:Label>
                        <asp:RadioButtonList class="col-md-9 form-check form-check-inline mx-0 asp-radioButtonList"
                            RepeatLayout="Flow" ID="rblstatus" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem class="asp-listItem col-form-label mr-3" Text="Active" Value="0"
                                Selected="True"></asp:ListItem>
                            <asp:ListItem class="asp-listItem col-form-label" Text="InActive" Value="1"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvrblstatus" CssClass="red_new"
                            ControlToValidate="rblstatus" Display="Dynamic" ErrorMessage="Please select Status">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="table-responsive mb-3">
                    <asp:GridView ID="gvDept" class="table table-bordered mb-1" runat="server" AutoGenerateColumns="False"
                        Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="True" ShowFooter="false">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <HeaderStyle CssClass="HeaderDatagrid" />
                        <PagerStyle CssClass="gridViewPager" />
                        <AlternatingRowStyle CssClass="AlternateItemStyle" />
                        <Columns>
                            <%-- <asp:BoundField DataField="Sno" HeaderText="Sno" ShowHeader="false">
                       
                        <ItemStyle CssClass="hide" />
                        <HeaderStyle CssClass="hide" />
                    </asp:BoundField>--%>
                            <asp:TemplateField HeaderText="Sno">
                                <ItemTemplate>
                                    <asp:Label ID="lblsno" runat="server" Text="<%# Container.DataItemIndex + 1 %>">
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Area Name">
                                <ItemTemplate>
                                    <asp:TextBox CssClass="form-control" ID="txtarea" runat="server" Enabled="false">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvarea" runat="server" ControlToValidate="txtarea"
                                        CssClass="red_new" Display="Dynamic" ErrorMessage="Please Select AreaName">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Arrival Time">
                                <ItemTemplate>

                                    <asp:TextBox CssClass="form-control" ID="txtatime" runat="server"
                                        placeholder="HH:MM" MaxLength="5" onkeypress="formatTime(this)"
                                        style="max-width: 100px;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvatime" runat="server" CssClass="red_new"
                                        ErrorMessage="Please enter Arrival Time" Display="Dynamic"
                                        ControlToValidate="txtatime">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rgvatime" runat="server" CssClass="red_new"
                                        ErrorMessage="please enter valid time" Display="Dynamic"
                                        ControlToValidate="txtatime" ValidationExpression="^(?:[01]?[0-9]|2[0-3]):[0-5][0-9]$">
                                    </asp:RegularExpressionValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Departure Time">
                                <ItemTemplate>
                                    <asp:TextBox CssClass="form-control" ID="txtdtime" runat="server"
                                        onchange="time(this)" placeholder="HH:MM" MaxLength="5" onfocus="this.value='';"
                                        onkeypress="formatTime(this)" style="max-width: 100px;">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvdtime" runat="server" CssClass="red_new"
                                        ControlToValidate="txtdtime" Display="Dynamic"
                                        ErrorMessage="Please enter DepartureTime">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rgvdtime" runat="server" CssClass="red_new"
                                        ErrorMessage="please enter valid time" Display="Dynamic"
                                        ControlToValidate="txtdtime" ValidationExpression="^(?:[01]?[0-9]|2[0-3]):[0-5][0-9]$">
                                    </asp:RegularExpressionValidator>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Landmark Picked">
                                <ItemTemplate>
                                    <asp:TextBox CssClass="form-control" ID="txtland" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvland" runat="server" ControlToValidate="txtland"
                                        CssClass="red_new" Display="Dynamic" ErrorMessage="Please enter landmark">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rgvland" runat="server" CssClass="red_new"
                                        ErrorMessage="please enter alphabetics and numbers allowed" Display="Dynamic"
                                        ControlToValidate="txtland" ValidationExpression="[0-9A-Z a-z]+">
                                    </asp:RegularExpressionValidator>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <FooterTemplate>
                                </FooterTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Route_Det_Sno" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblm_sno" runat="server"></asp:Label>

                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <FooterTemplate>
                                </FooterTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="validsno" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblvalid" runat="server"></asp:Label>

                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <FooterTemplate>
                                </FooterTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lkremove" runat="server" OnClick="lkremove_Click"
                                        CausesValidation="false">Remove
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="form-group col d-flex justify-content-end">
                    <asp:Button class="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                        OnClick="btnSubmit_Click" />
                    <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Text="Update"
                        OnClick="btnupdate_Click" />
                    <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server" Text="Delete"
                        OnClick="btnDelete_Click" />
                    <asp:Button class="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                        CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="gvddata" ClientIDMode="Static" class="table table-bordered" runat="server"
                        AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="True" ShowFooter="false"
                        OnPageIndexChanging="gvddata_PageIndexChanging">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <HeaderStyle CssClass="HeaderDatagrid" />
                        <PagerStyle CssClass="gridViewPager" />
                        <AlternatingRowStyle CssClass="AlternateItemStyle" />
                        <Columns>
                            <%-- <asp:BoundField DataField="Sno" HeaderText="Sno" ShowHeader="false">
                                           
                                            <ItemStyle CssClass="hide" />
                                            <HeaderStyle CssClass="hide" />
                                        </asp:BoundField>--%>
                            <%-- <asp:TemplateField HeaderText="Sno">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsno" runat="server" Text="<%# Container.DataItemIndex + 1 %>">
                            </asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField ItemStyle-Width="5%">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                        oncheckedchanged="rbDept_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Veh_D_R_A_Mas_Sno" HeaderText="Sno" ShowHeader="false">
                                <ItemStyle CssClass="hide" />
                                <HeaderStyle CssClass="hide" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Veh_Reg_No" HeaderText="Registration No" />
                            <asp:BoundField DataField="Driver_Name" HeaderText="Driver" />
                            <asp:BoundField DataField="Route_Name" HeaderText="Route" />
                            <asp:BoundField DataField="Attendant_Name" HeaderText="Attendant" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />


                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <table style="width: 100%;" class="d-none">
            <tr>
                <td style="width: 100%;">

                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 100%;">
                                <a class="navigationbar" href="txKulA">Home</a>&nbsp; &gt;&gt; &nbsp;<a
                                    class="navigationbar" href="amf105">Vehicle Drivers Route Allocation Details</a>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100%; height: 10px;"></td>
                        </tr>
                    </table>
                    <fieldset>
                        <legend>
                            <label class="hd1">Vehicle Drivers Route Allocation Details</label>
                        </legend>

                        <table style="width: 100%;">


                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlreg" runat="server" Visible="false" AutoPostBack="true">
                                    </asp:DropDownList>
                                </td>
                            </tr>


                            <tr>
                                <td style="width: 2%;"></td>
                            </tr>




                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td style="width: 100%; height: 20px;"></td>
            </tr>
        </table>

        <script type="text/javascript">
            function formatTime(timeInput) {

                intValidNum = timeInput.value;

                if (intValidNum < 24) {
                    if (intValidNum.length == 2) {
                        timeInput.value = timeInput.value + ":";
                        return false;
                    }
                }
                if (intValidNum == 24) {
                    if (intValidNum.length == 2) {
                        timeInput.value = timeInput.value.length - 2 + "0:";
                        return false;
                    }
                }
                if (intValidNum > 24) {
                    if (intValidNum.length == 2) {
                        timeInput.value = "";
                        return false;
                    }
                }


                //Here is where I had trouble targeting the
                //mm and ss in order to add conditions (see hh above).
                //I used slice to assist me.
                //Please let me know if any of you have suggestions/enhancements/corrections.

                if (intValidNum.length == 5 && intValidNum.slice(-2) < 60) {
                    timeInput.value = timeInput.value;
                    return false;
                }
                if (intValidNum.length == 5 && intValidNum.slice(-2) > 60) {
                    timeInput.value = timeInput.value.slice(0, 2) + ":";
                    return false;
                }
                if (intValidNum.length == 5 && intValidNum.slice(-2) == 60) {
                    timeInput.value = timeInput.value.slice(0, 2) + ":";
                    return false;
                }


                if (intValidNum.length == 8 && intValidNum.slice(-2) > 60) {
                    timeInput.value = timeInput.value.slice(0, 5) + ":";
                    return false;
                }
                if (intValidNum.length == 8 && intValidNum.slice(-2) == 60) {
                    timeInput.value = timeInput.value.slice(0, 5) + ":";
                    return false;
                }
            }
            //ContentPlaceHolder1_gvDept_txtStart_0
        </script>



    </div>

</asp:Content>