<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetupUser.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.SetupUser" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table[id*=gvDept] tr {
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
        <asp:UpdatePanel ID="upRegister" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnDelete" />
            </Triggers>
        </asp:UpdatePanel>
        <ContentTemplate>
            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">User Creation</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">User Creation</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">User Type
                                <span class="red_new">*</span></asp:Label>

                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlUser">
                                <asp:ListItem Cssclass="asp-listItem col-form-label" Value="">Select User Type
                                </asp:ListItem>
                                <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Super">Manager
                                </asp:ListItem>
                                <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Dummy">Data Entry
                                </asp:ListItem>
                                <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Academic">Academic Master
                                </asp:ListItem>
                                 <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Secretary">Secretary
                                </asp:ListItem>
                                    <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Transporte">Transporter
                                </asp:ListItem>
                                    <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Librarian">Librarian
                                </asp:ListItem>
                                    <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Teacher">Teacher
                                </asp:ListItem>
                                <asp:ListItem Cssclass="asp-listItem col-form-label" Value="C Teacher">Class Teacher
                                </asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvUser" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlUser" Display="Dynamic" ErrorMessage="Please select user type">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Authorized
                                User<span class="red_new">*</span></asp:Label>

                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtName" Width="190">
                            </asp:TextBox>
                            <small class="form-text text-muted offset-md-3">Enter full name</small>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCountry" CssClass="red_new offset-md-3"
                                ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Please enter name">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Email
                                Address<span class="red_new">*</span></asp:Label>

                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmail" MaxLength="200"
                                Width="190"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new offset-md-3"
                                ControlToValidate="txtEmail" Display="Dynamic"
                                ErrorMessage="Please enter email address"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" CssClass="red_new offset-md-3" runat="server"
                                ControlToValidate="txtEmail" ErrorMessage="Please enter the valid Email ID"
                                ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Mobile
                                No<span class="red_new">*</span></asp:Label>
                            <div class="col-md-9 px-0  input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="my-addon"><asp:Label runat="server" ID="lblISD"></asp:Label></span></div>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtWork" MaxLength="9"
                                    ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                            </div>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvWork" CssClass="red_new offset-md-3"
                                ControlToValidate="txtWork" Display="Dynamic" ErrorMessage="Please enter mobile number">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revWork" CssClass="red_new offset-md-3"
                                ValidationExpression="^[0-9]{9}$" ControlToValidate="txtWork" Display="Dynamic"
                                ErrorMessage="Please enter valid number"> </asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                            Visible="true" Text="Update" OnClick="btnUpdate_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                            OnClientClick="return confirm('Are you sure you want to delete?');" CausesValidation="false"
                            Text="Delete" OnClick="btnDelete_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnCancel" runat="server"
                             CausesValidation="false"
                            Text="Cancel" OnClick="btnCancel_Click" />

                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            OnRowDataBound="gvRowDataBound" HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
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
                                <asp:BoundField DataField="Facility_Reg_Sno" HeaderText="Status" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Status" HeaderText="Status" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Authorized User Full Name" />
                                <asp:BoundField DataField="Email_Address" HeaderText="Email" />
                                <asp:BoundField DataField="Facility_Name" HeaderText="University/College/School Name" />
                                <asp:BoundField DataField="AuditBy" HeaderText="Created By" />
                                <asp:BoundField DataField="Create_Date" HeaderText="Crated Date"
                                    DataFormatString="{0:dd/M/yyyy}" />
                                <asp:BoundField DataField="Log_Status" HeaderText="Status" />
                                <asp:BoundField DataField="Status" HeaderText="Role" />
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>

        </ContentTemplate>

</asp:Content>