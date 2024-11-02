<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeeAllocRec.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.FeeAllocRec" %>
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
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Fee Structure Return</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Fee Structure Return</h5>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle"
                                OnRowCancelingEdit="gvDept_RowCancelingEdit" OnRowDeleting="gvDept_RowDeleting"
                                DataKeyNames="Sno" OnRowEditing="gvDept_RowEditing" OnRowUpdating="gvDept_RowUpdating"
                                HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Facility">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFaci" runat="server" Text='<%#Eval("Facility_Name") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Sno" HeaderText="Sector ID" ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Class">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCla" runat="server" Text='<%#Eval("Class_Name") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Programme/Combination/Stream">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSec" runat="server" Text='<%#Eval("Section_Name") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Academic">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAca" runat="server" Text='<%#Eval("Acad_Year") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Term">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTer" runat="server" Text='<%#Eval("Term_Type") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fee">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFee" runat="server" Text='<%#Eval("Fee_Type") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Requested Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRAmount" runat="server"
                                                Text='<%#Eval("Requested_Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtRAmount" MaxLength="10" Width="100"
                                                Text='<%#Eval("Requested_Amount") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvRAmount"
                                                CssClass="red_new" ControlToValidate="txtRAmount" Display="Dynamic"
                                                ErrorMessage="Please enter amount"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" ID="revDays"
                                                CssClass="red_new" ValidationExpression="^[0-9]{1,7}$"
                                                ControlToValidate="txtRAmount" Display="Dynamic"
                                                ErrorMessage="Please enter valid amount">
                                            </asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSta" runat="server" Text='<%#Eval("Status") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="true" />
                                    <asp:CommandField ShowDeleteButton="true" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnApprove" runat="server"
                                OnClientClick="return confirm('Are you sure you want to update?');" Visible="false"
                                Text="Update" OnClick="btnApprove_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnReturn" runat="server"
                                Text="Cancel" OnClick="btnReturn_Click" />
                        </div>

                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnApprove" />
                <asp:PostBackTrigger ControlID="btnReturn" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>