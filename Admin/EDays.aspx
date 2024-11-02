<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EDays.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.EDays" %>

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
                    <li class="breadcrumb-item">Password Aging</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Password Aging</h5>
    
                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Password Life (Days)</label>
                            <asp:TextBox runat="server" class="col-md-9 form-control" ID="txtname" MaxLength="3"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvname" CssClass="red_new offset-md-3" ControlToValidate="txtname" Display="Dynamic" ErrorMessage="Please enter Password Life days"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revData" ValidationExpression="^[0-9]{1,3}$" CssClass="red_new" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Please enter password life"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Notification Alert (Days)</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAD"
                                MaxLength="15"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDept" CssClass="red_new offset-md-3"
                                ControlToValidate="txtAD" Display="Dynamic" ErrorMessage="Please enter amount">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revME" ValidationExpression="^[0-9,]{1,16}$" CssClass="red_new"
                                    ControlToValidate="txtAD" Display="Dynamic" ErrorMessage="Please enter valid amount"> </asp:RegularExpressionValidator>
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
                                <asp:BoundField DataField="Days" HeaderText="Password Life Days" />
                                <asp:BoundField DataField="ADays" HeaderText="Notification Alert Days" />
                                <asp:BoundField DataField="Sno" HeaderText="Department ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
								<asp:BoundField DataField="Audit_Date" HeaderText="Posted Date" DataFormatString="{0:dd/M/yyyy HH:mm:ss}" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
    
        
                    
    </div>
</asp:Content>
