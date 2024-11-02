<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehDiaryAppInb.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.VehDiaryAppInb" %>

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
                        <li class="breadcrumb-item">Vehicle Diary Approve Inbox</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">

                        <h5 class="card-title">Vehicle Diary Approve Inbox</h1>

                            <div class="table-responsive mb-1">
                                <asp:GridView ID="gvDept"
                                    Style="border-width: 0px; border-style: None; width: 100%; border-collapse: collapse;"
                                    runat="server" AutoGenerateColumns="false" Width="100%"
                                    AlternatingRowStyle-CssClass="AlternateItemStyle"
                                    HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false"
                                    OnRowDeleting="gvDept_RowDeleting" DataKeyNames="Veh_D_Mas_Sno">
                                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                    <PagerStyle CssClass="gridViewPager" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Vehicle Diary Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDiary" runat="server"
                                                    Text='<%#Eval("Veh_Dailry_Type") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtDiary" MaxLength="100" runat="server"
                                                    Text='<%#Eval("Veh_Dailry_Type") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Veh_D_Mas_Sno" HeaderText="Sector ID"
                                            ShowHeader="false">
                                            <ItemStyle CssClass="hide" />
                                            <HeaderStyle CssClass="hide" />
                                        </asp:BoundField>
                                        <%--<asp:TemplateField HeaderText="Status">  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblActive" runat="server" Text='<%#Eval("Status") %>'>
                                        </asp:Label>
                                        </ItemTemplate>
                                        </asp:TemplateField>--%>

                                        <asp:CommandField ShowDeleteButton="false" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="form-group d-flex justify-content-end ">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                    Text="Approve" OnClick="btnSubmit_Click" />
                            </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>