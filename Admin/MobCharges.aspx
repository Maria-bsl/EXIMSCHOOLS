<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobCharges.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.MobCharges" %>

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
             
                
               <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                    <li class="breadcrumb-item">Mobile App Charges</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Mobile App Charges</h5>
    
                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Charge</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlRegion">
                                <asp:ListItem Value="">Category</asp:ListItem>
                                <asp:ListItem Value="Monthly">Monthly</asp:ListItem>
                                <asp:ListItem Value="Quaterly">Quaterly</asp:ListItem>
                                <asp:ListItem Value="Half Yearly">Half Yearly</asp:ListItem>
                                <asp:ListItem Value="Yearly">Yearly</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvSector" CssClass="red_new offset-md-3"
                                Display="Dynamic" ControlToValidate="ddlRegion"
                                ErrorMessage="Please select charge">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Amount</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAmount"
                                MaxLength="15"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDept" CssClass="red_new offset-md-3"
                                ControlToValidate="txtAmount" Display="Dynamic" ErrorMessage="Please enter amount">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revME" ValidationExpression="^[0-9,]{1,16}$" CssClass="red_new"
                                    ControlToValidate="txtAmount" Display="Dynamic" ErrorMessage="Please enter valid amount"> </asp:RegularExpressionValidator>
                        </div>
    
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-auto col-form-label pl-0">Status</label>
                            <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0"
                                RepeatDirection="Horizontal" runat="server" ID="rblStatus" RepeatLayout="Flow">
                                <asp:ListItem class="asp-listItem col-form-label mr-3" Value="Active"
                                    Selected="True">Active
                                </asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="InActive">InActive
                                </asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                ControlToValidate="rblStatus" Display="Dynamic"
                                ErrorMessage="Please select region status">
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
                                <asp:BoundField DataField="Charge_Category" HeaderText="Category" />
                                <asp:BoundField DataField="Mob_Apk_Sno" HeaderText="Region ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Charge_Amount" HeaderText="Amount" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
    
        
                    
    </div>
</asp:Content>
