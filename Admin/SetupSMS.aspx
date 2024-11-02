<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetupSMS.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.SetupSMS" %>

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
                    <li class="breadcrumb-item active" aria-current="page"><a href="Dashboard.aspx">Home</a></li>
                    <li class="breadcrumb-item">SMS Settings</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">SMS Settings</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <label class="col-md-3 col-form-label pl-0">SMS Email</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtUname" MaxLength="100">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvUname" CssClass="red_new offset-md-3"
                                ControlToValidate="txtUName" Display="Dynamic" ErrorMessage="Please enter sms email">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" CssClass="red_new offset-md-3" runat="server"
                                ControlToValidate="txtUName" ErrorMessage="Please enter the valid Email ID"
                                ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <label class="col-md-3 col-form-label pl-0">SMS API Key</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPass"
                                TextMode="Password" MaxLength="100"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvPass" CssClass="red_new offset-md-3"
                                ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="Please enter sms api key">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <label class="col-md-3 col-form-label pl-0">Service ID: </label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFrom" MaxLength="100">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new offset-md-3"
                                ControlToValidate="txtFrom" Display="Dynamic" ErrorMessage="Please enter service id">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <label class="col-md-3 col-form-label pl-0">Mobile Service ID: </label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtMobile" MaxLength="100">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvMobile" CssClass="red_new offset-md-3"
                                ControlToValidate="txtMobile" Display="Dynamic"
                                ErrorMessage="Please enter mobile service id"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-12 d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                                OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Text="Update" OnClick="btnUpdate_Click" />

                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                                CausesValidation="false" Text="Delete" OnClick="btnDelete_Click" />

                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
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
                                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                <asp:BoundField DataField="SNO" HeaderText="SNO" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="From_Address" HeaderText="Service ID" />
                                <asp:BoundField DataField="Mobile_Service" HeaderText="Mobile Service ID" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </div>
</asp:Content>