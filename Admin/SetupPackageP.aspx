<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetupPackageP.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.SetupPackageP" %>

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
        function ValidateCheckBoxList(oSrc, args) {
            var isValid = false;
            $("#<%= cblMdodules.ClientID %> input[type='checkbox']:checked").each(function (i, obj) {
            isValid = true;
        });
        args.IsValid = isValid;
    }
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
                    <li class="breadcrumb-item">Package Price</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Package Price</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Package List</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSchool">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlSchool" Display="Dynamic"
                                ErrorMessage="Please select school">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-auto col-form-label pl-0">Modules</label>
                            <asp:CheckBoxList CssClass="col asp-radioButtonList px-0" runat="server"
                                ID="cblMdodules" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            </asp:CheckBoxList>
                            <asp:CustomValidator ID="cvCB" runat="server" ControlId="cblMdodules" CssClass="red_new" ClientValidationFunction="ValidateCheckBoxList" ErrorMessage="Please select atlease one checkbox">
                            </asp:CustomValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Package Days</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPD" MaxLength="3">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                CssClass="red_new offset-md-3" ControlToValidate="txtPD" Display="Dynamic"
                                ErrorMessage="Please enter days">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revME" ValidationExpression="^[0-9]{1,16}$" CssClass="red_new"
                                    ControlToValidate="txtPD" Display="Dynamic" ErrorMessage="Please enter valid days"> </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Pre Alert Days</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPAD" MaxLength="3">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                                CssClass="red_new offset-md-3" ControlToValidate="txtPAD" Display="Dynamic"
                                ErrorMessage="Please enter days">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="^[0-9]{1,16}$" CssClass="red_new"
                                    ControlToValidate="txtPAD" Display="Dynamic" ErrorMessage="Please enter valid days"> </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Package Amount</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPA" MaxLength="10">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4"
                                CssClass="red_new offset-md-3" ControlToValidate="txtPA" Display="Dynamic"
                                ErrorMessage="Please enter amount">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="^[0-9,]{1,16}$" CssClass="red_new"
                                    ControlToValidate="txtPA" Display="Dynamic" ErrorMessage="Please enter valid amount"> </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Remarks</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtR" MaxLength="200">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5"
                                CssClass="red_new offset-md-3" ControlToValidate="txtPA" Display="Dynamic"
                                ErrorMessage="Please enter remarks">
                            </asp:RequiredFieldValidator>
                            
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
                                <asp:BoundField DataField="Package_Name" HeaderText="Package" />
                                <asp:BoundField DataField="P_P_Mas_Sno" HeaderText="Module ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="M_Name" HeaderText="Modules" />
                                <asp:BoundField DataField="Package_Days" HeaderText="Package Days" />
                                <asp:BoundField DataField="Pre_Alert_Days" HeaderText="Pre Alert Days" />
                                <asp:BoundField DataField="Package_Amount" HeaderText="Package Amount" DataFormatString="{0:n0}" />
                                
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </div>
</asp:Content>