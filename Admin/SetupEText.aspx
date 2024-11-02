<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetupEText.aspx.cs" ValidateRequest="false" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.SetupEText" %>

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
                    <li class="breadcrumb-item">Email Text</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Email Text</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Select Flow</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFlow"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlFlow_SelectedIndexChanged">
                                <asp:ListItem Value="">Select Instance</asp:ListItem>
                                <asp:ListItem Value="1">Registration</asp:ListItem>
                                <asp:ListItem Value="2">Invoice</asp:ListItem>
                                <asp:ListItem Value="3">Receipt</asp:ListItem>
                                <asp:ListItem Value="4">Parent Notification</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvFlow" CssClass="red_new offset-md-3"
                                Display="Dynamic" ErrorMessage="Please select instance" ControlToValidate="ddlFlow">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Subject</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtSub" MaxLength="180">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="red_new" Display="Dynamic"
                                ErrorMessage="Please enter subject" ControlToValidate="txtSub">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Message</label><br />
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtDays"
                                TextMode="MultiLine" Rows="5" Columns="30" Width="750px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDays" CssClass="red_new offset-md-3"
                                ControlToValidate="txtDays" Display="Dynamic" ErrorMessage="Please enter message">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-12 col-md-10 col-lg-8 d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Text="Create" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Text="Update" OnClick="btnUpdate_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                                CausesValidation="false"
                                OnClientClick="return confirmCheckIn(this,'Are you sure you want to delete?');"
                                Text="Delete" OnClick="btnDelete_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>


                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%"
                            AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                            PageSize="10" OnRowDataBound="gvRowDataBound"
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
                                <asp:BoundField DataField="SNO" HeaderText="Sector ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Flow_ID" HeaderText="Instance" />
                                <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                <asp:BoundField DataField="E_Text" HeaderText="Message" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>


        </ContentTemplate>
    </div>
</asp:Content>