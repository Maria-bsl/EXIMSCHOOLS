<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllocRetInb.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.AllocRetInb" %>

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
        <asp:UpdatePanel ID="upRegister" runat="server">

            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Allocations Return Inbox</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Allocations Return Inbox</h5>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" OnRowCancelingEdit="gvDept_RowCancelingEdit"
                                OnRowDataBound="gvRowDataBound" OnRowDeleting="gvDept_RowDeleting" DataKeyNames="SNo"
                                OnRowEditing="gvDept_RowEditing" OnRowUpdating="gvDept_RowUpdating">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Fee Type">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lnkView" Text='<%#Eval("Fee_Type")%>'
                                                OnClick="lnkView_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SNo" HeaderText="Sector ID" ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblID" Text='<%#Eval("SNo") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount_Type") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlAmount" Width="160"
                                                SelectedValue='<%#Eval("Amount_Type") %>'>
                                                <asp:ListItem Value="">Select Payment Type</asp:ListItem>
                                                <asp:ListItem Value="FIXED">FIXED</asp:ListItem>
                                                <asp:ListItem Value="FLEXIBLE">FLEXIBLE</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                                                CssClass="red_new" ControlToValidate="ddlAmount" Display="Dynamic"
                                                ErrorMessage="Please select amount type"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Fee_Acc_No") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtAcc" Width="160" Enabled="false"
                                                Text='<%#Eval("Fee_Acc_No") %>'>
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvAcc" CssClass="red_new"
                                                ControlToValidate="txtAcc" Display="Dynamic"
                                                ErrorMessage="Please enter account no"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account Name" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAName" runat="server" Text='<%#Eval("Fee_Acc_Name") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtAName" MaxLength="100" Width="160"
                                                Text='<%#Eval("Fee_Acc_Name") %>'></asp:TextBox>

                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fee Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBC" runat="server" Text='<%#Eval("Fee_Acc_Bank_Code") %>'>
                                            </asp:Label>

                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtBC" MaxLength="100" Width="160"
                                                Enabled="false" Text='<%#Eval("Fee_Acc_Bank_Code") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvBC" CssClass="red_new"
                                                ControlToValidate="txtBC" Display="Dynamic"
                                                ErrorMessage="Please enter bank code"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowDeleteButton="true" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnSubmit" runat="server" Visible="false"
                                OnClientClick="return confirmCheckIn(this,'Are you sure you want to approve all?');"
                                Text="Approve All" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel" Visible="false"
                                CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />

                        </div>
                    </div>
                </div>
            </ContentTemplate>
                <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
				<asp:PostBackTrigger ControlID="btnCancel" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>