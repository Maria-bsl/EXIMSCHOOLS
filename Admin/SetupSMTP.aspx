<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetupSMTP.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.SetupSMTP" %>

<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table[id*=gvDept] tr{
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
                    <li class="breadcrumb-item">SMTP Settings</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">SMTP Settings</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0">Email From Address: </label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmail"
                                MaxLength="100"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new offset-md-3"
                                ControlToValidate="txtEmail" Display="Dynamic"
                                ErrorMessage="Please enter email address"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" CssClass="red_new offset-md-3"
                                runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please enter the valid Email ID"
                                ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-auto col-form-label pl-0">SSL Enable</label>
                            <asp:RadioButtonList CssClass="col px-0 asp-radioButtonList" runat="server"
                                RepeatDirection="Horizontal" ID="rblSSL" RepeatLayout="Flow">
                                <asp:ListItem Value="true">True</asp:ListItem>
                                <asp:ListItem Value="false">False</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0">SMTP Address</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAdd"
                                MaxLength="100"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvAdd" CssClass="red_new offset-md-3"
                                ControlToValidate="txtAdd" Display="Dynamic"
                                ErrorMessage="Please enter smtp address"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0">SMTP Port Address</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPort"
                                MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvPort" CssClass="red_new offset-md-3"
                                ControlToValidate="txtPort" Display="Dynamic"
                                ErrorMessage="Please enter smtp port address"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revPort"
                                CssClass="red_new offset-md-3" ValidationExpression="^[0-9]{1,12}$"
                                ControlToValidate="txtPort" Display="Dynamic"
                                ErrorMessage="Please enter valid Port Number"> </asp:RegularExpressionValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0">SMTP User Name</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtUname"
                                MaxLength="100"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0">SMTP Password</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPass"
                                TextMode="Password" MaxLength="50"></asp:TextBox>
                        </div>

                        <div class="form-group col-12 d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Text="Create" OnClick="btnSubmit_Click" />
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
                            AutoGenerateColumns="false" Width="100%"
                            AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                            PageSize="10" OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                            oncheckedchanged="rbDept_CheckedChanged" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="From_Address" HeaderText="Email From Address" />
                                <asp:BoundField DataField="SNO" HeaderText="SNO" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SMTP_Address" HeaderText="SMTP Address" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </div>
</asp:Content>