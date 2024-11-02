<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Drivers.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Drivers" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table tbody tr {
            cursor: pointer;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('table[id*=gvDept]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            $('table[id*=gvDept]').prepend($("<thead></thead>").append($(this).find("tr:first")))
                .DataTable({
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
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Drivers</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Drivers</h5>
                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Driver Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtName" runat="server" MaxLength="100">
                        </asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="rgvName" runat="server" ControlToValidate="txtName"
                            CssClass="red_new offset-md-3" Display="Dynamic" ValidationExpression="[a-zA-Z ]*$"
                            ErrorMessage="*Valid characters: Alphabets and space." />
                        <asp:RequiredFieldValidator runat="server" ID="rfvName" CssClass="red_new offset-md-3"
                            ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Please enter Driver Name">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Licence Number</label>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtLicno" runat="server" MaxLength="100">
                        </asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="rgvLicno" runat="server" ControlToValidate="txtLicno"
                            CssClass="red_new offset-md-3" Display="Dynamic" ValidationExpression="[0-9A-Za-z]+"
                            ErrorMessage="only alphabets and numbers allowed">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ID="rfvLicno" CssClass="red_new offset-md-3"
                            ControlToValidate="txtLicno" Display="Dynamic" ErrorMessage="Please enter Licence Number">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Expire Date</label>
                        <div class="input-group col-md-9 px-0">
                            <asp:TextBox CssClass="form-control" ID="txtDate" runat="server" aria-label="Recipient's "
                                aria-describedby="iPopup">
                            </asp:TextBox>
                            <div class="input-group-append rounded-right">
                                <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                    ID="iPopup" ImageUrl="/images/calendar.png" Height="38px" />
                            </div>
                        </div>
                        <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                            TargetControlID="txtDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                        <br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvDate" ControlToValidate="txtDate"
                            Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select  Date">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Mobile Number</label>
                        <div class="col-md-9 px-0  input-group">
                            <!--<div class="input-group-prepend">
                                <span class="input-group-text country">TZ</span>
                            </div>-->
                            <div class="input-group col-md-9 px-0">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="my-addon"><asp:Label runat="server" ID="lblISD"></asp:Label></span></div>
                                    <asp:TextBox CssClass="form-control" runat="server" ID="txtMob" MaxLength="9"
                                        ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                                </div>
                        </div>
                        <asp:RegularExpressionValidator ID="reMob" runat="server" ControlToValidate="txtMob"
                            Display="Dynamic" ErrorMessage="Not valid PhoneNumber" CssClass="red_new offset-md-3"
                            ValidationExpression="[0-9]{9}">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ID="rfvMob" CssClass="red_new offset-md-3"
                            ControlToValidate="txtMob" Display="Dynamic" ErrorMessage="Please enter Mobile Number">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Address</label>
                        <asp:TextBox CssClass="col-md-9 form-control uppercase" ID="txtAdrs" runat="server"
                            MaxLength="200" TextMode="MultiLine"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvAdrs" CssClass="red_new offset-md-3"
                            ControlToValidate="txtAdrs" Display="Dynamic" ErrorMessage="Please enter Address">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-auto col-form-label pl-0">Status</label>
                        <asp:RadioButtonList class="col form-check form-check-inline mx-0 asp-radioButtonList"
                            RepeatDirection="Horizontal" runat="server" ID="rblStatus" RepeatLayout="Flow">
                            <asp:ListItem class="asp-listItem col-form-label pt-0 mr-3" Value="Active" Selected="True">
                                Active
                            </asp:ListItem>
                            <asp:ListItem class="asp-listItem col-form-label pt-0" Value="InActive">InActive
                            </asp:ListItem>
                        </asp:RadioButtonList><br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvStatus" CssClass="red_new offset-md-3"
                            ControlToValidate="rblStatus" Display="Dynamic" ErrorMessage="Please select sector status">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-12 d-flex justify-content-end ">
                        <asp:Button class="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                            OnClick="btnSubmit_Click" />
                        <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Text="Update"
                            Visible="false" OnClick="btnUpdate_Click" />
                        <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                            CausesValidation="false" Text="Delete" Visible="false" OnClick="btnDelete_Click" />
                        <asp:Button class="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                        OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <PagerStyle CssClass="gridViewPager" />
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="5%">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                        oncheckedchanged="rbDept_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Driver_Name" HeaderText="Driver Name" />
                            <asp:BoundField DataField="Driver_License_No" HeaderText="License Number" />
                            <asp:BoundField DataField="License_Expiry_Date" HeaderText="Expiry Date"
                                DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Driver_Sno" HeaderText="Sector ID" ShowHeader="false">
                                <ItemStyle CssClass="hide" />
                                <HeaderStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Driver_Mobile_No" HeaderText="Mobile Number" />
                            <asp:BoundField DataField="Driver_Address" HeaderText="Address" />
                            <asp:BoundField DataField="Driver_Status" HeaderText="Status" />
                            <asp:BoundField DataField="Status" HeaderText="Progress" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>