<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="Book_Stock_list.aspx.cs" Inherits="Schools.Facili.Book_Stock_list" %>

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
                        <li class="breadcrumb-item">Books Returning</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1 mb-0">Books Returning</h5>
                        <div class="table-responsive mb-1">
                            <asp:GridView CssClass="table table-bordered mb-1 display" ID="gvDept"
                                OnDataBound="gvDept_DataBound" runat="server" AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="false"
                                GridLines="Horizontal" HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                                OnRowDataBound="gvDept_RowDataBound" OnPageIndexChanging="gvDept_PageIndexChanging"
                                AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%"
                                        ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Teacher/Student">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblFee" runat="server" Text='<%#Eval("Teacher_Name") %>'
                                                OnClick="lblFee_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblID" runat="server"
                                                Text='<%#Eval("Book_Iss_Tea_Mas_Sno") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField  Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldetsno" runat="server"  Text='<%#Eval("BookDetsno") %>'>
                                    </asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsec" runat="server" Text='<%#Eval("Section") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Location_From" HeaderText="Location Name"
                                        HtmlEncode="False">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Loc_id" HeaderText="Location Id" HtmlEncode="False" ItemStyle-Width="1%">
                                    </asp:BoundField>
                                    <%--  <asp:BoundField DataField="Book_Title" HeaderText="Book Name"   HtmlEncode="False" />--%>
                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <%-- <Triggers>
         <asp:PostBackTrigger ControlID="btnSubmit" />
        <asp:PostBackTrigger ControlID="btnPdf" />
        <asp:PostBackTrigger ControlID="btnExcel" />
    </Triggers>--%>
        </asp:UpdatePanel>
    </div>
</asp:Content>