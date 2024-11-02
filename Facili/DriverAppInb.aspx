<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverAppInb.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.DriverAppInb" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
                <li class="breadcrumb-item">Drivers Approve Inbox</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Drivers Approve Inbox</h5>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" OnRowDeleting="gvDept_RowDeleting"
                        DataKeyNames="Driver_Sno">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <PagerStyle CssClass="gridViewPager" />
                        <Columns>
                            <asp:TemplateField HeaderText="Driver Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblAdmin" runat="server" Text='<%#Eval("Driver_Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Driver_Sno" HeaderText="Sector ID" ShowHeader="false">
                                <ItemStyle CssClass="hide" />
                                <HeaderStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="License Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblCLA" runat="server" Text='<%#Eval("Driver_License_No") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Expiry Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblSEC" runat="server"
                                        Text='<%#Eval("License_Expiry_Date","{0:dd/MM/yyyy}") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblTerm" runat="server" Text='<%#Eval("Driver_Mobile_No") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblFee" runat="server" Text='<%#Eval("Driver_Address") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active / InActive">
                                <ItemTemplate>
                                    <asp:Label ID="lblActive" runat="server" Text='<%#Eval("Driver_Status") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList runat="server" ID="ddlActive" Width="160"
                                        SelectedValue='<%#Eval("Driver_Status") %>'>
                                        <asp:ListItem Value="Active">Active</asp:ListItem>
                                        <asp:ListItem Value="InActive">InActive</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:CommandField ShowDeleteButton="false" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="form-group d-flex justify-content-end ">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve"
                        OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>