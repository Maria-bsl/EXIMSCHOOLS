<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetupAlloc.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.SetupAlloc" %>

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
                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Allocation</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Allocation</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Fee<span
                                        class="red_new">*</span></asp:Label>

                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFee"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlFee_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCountry"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlFee" Display="Dynamic"
                                    ErrorMessage="Please select fee">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Payment
                                    Type<span class="red_new">*</span></asp:Label>

                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAmount">
                                    <asp:ListItem class="asp-listItem col-form-label" Value="">Select Payment Type
                                    </asp:ListItem>
                                    <asp:ListItem class="asp-listItem col-form-label" Value="FIXED">FIXED</asp:ListItem>
                                    <asp:ListItem class="asp-listItem col-form-label" Value="FLEXIBLE">FLEXIBLE
                                    </asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlAmount" Display="Dynamic"
                                    ErrorMessage="Please select payment type"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Fee Account
                                    No<span class="red_new">*</span></asp:Label>

                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFANO">
                                </asp:DropDownList>
                                <asp:TextBox runat="server" Visible="false" ID="txtFANA" MaxLength="200" CssClass="col-md-9 form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlFANO" Display="Dynamic"
                                    ErrorMessage="Please select account no"></asp:RequiredFieldValidator>
                                
                                
                            </div>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                                OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Text="Update" OnClick="btnUpdate_Click" Visible="false" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                                CausesValidation="false" Text="Delete" OnClick="btnDelete_Click" Visible="false" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />

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
                                    <asp:BoundField DataField="Fee_Type" HeaderText="Fee" />
                                    <asp:BoundField DataField="SNo" HeaderText="Sector ID" ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Amount_Type" HeaderText="Payment Type" />
                                    <asp:BoundField DataField="Fee_Acc_No" HeaderText="Account No." />
                                    <asp:BoundField DataField="Fee_Acc_Name" HeaderText="Account Name"
                                        ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="Status" HeaderText="Progress" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
          
    </div>
</asp:Content>