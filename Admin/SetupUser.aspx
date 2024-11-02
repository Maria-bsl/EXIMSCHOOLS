<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetupUser.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.SetupUser" %>

<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                    <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                    <li class="breadcrumb-item">Add user</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Add User</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">User Number</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmpno" Enabled="false"
                                MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmpno" ControlToValidate="txtEmpno"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please enter user number">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">First Name</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFullName"
                                MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfv4" ControlToValidate="txtFullName"
                                CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please enter first name">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Middle Name</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtMName" MaxLength="50">
                            </asp:TextBox>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Last Name</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtLName" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvLName" ControlToValidate="txtLName"
                                CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please enter last name">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Title/Designation</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlDesignation">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfv5" ControlToValidate="ddlDesignation"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please select designation">
                            </asp:RequiredFieldValidator>

                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Mobile No.</label>

                            <div class="input-group col-md-9 px-0">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="my-addon"><asp:Label runat="server" ID="lblISD"></asp:Label></span></div>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtWork" MaxLength="9"
                                    ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvWork" CssClass="red_new offset-md-3"
                                ControlToValidate="txtWork" Display="Dynamic" ErrorMessage="Please enter phone number">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revWork" CssClass="red_new offset-md-3"
                                ValidationExpression="^[0-9]{9}$" ControlToValidate="txtWork" Display="Dynamic"
                                ErrorMessage="Please enter valid number"> </asp:RegularExpressionValidator>

                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Email</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmailID"
                                MaxLength="100"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfv11" ControlToValidate="txtEmailID"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please enter email address">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmailID"
                                CssClass="red_new offset-md-3" ErrorMessage="Please enter the valid Email ID"
                                ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Branch</label>
                            <asp:DropDownList CssClass="form-control" runat="server" ID="ddlBranch">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvBranch" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlBranch" Display="Dynamic"
                                    ErrorMessage="Please select branch name"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-12 d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                                OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Text="Update" Visible="false" OnClick="btnUpdate_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" Visible="false"
                                runat="server" CausesValidation="false" Text="Delete" OnClick="btnDelete_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>


                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            OnRowDataBound="InbRowDataBound" HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
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
                                <asp:BoundField DataField="Emp_Details_ID" HeaderText="SNO" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Emp_No" HeaderText="User No" />
                                <asp:BoundField DataField="Full_Name" HeaderText="Name" />
                                <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                <asp:BoundField DataField="Email_ID" HeaderText="Email Address" />
                                <asp:BoundField DataField="App_Status" HeaderText="Progress" />
                                <asp:BoundField DataField="Emp_Status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </div>
</asp:Content>