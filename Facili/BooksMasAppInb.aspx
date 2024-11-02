<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BooksMasAppInb.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.BooksMasAppInb" %>

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
        <asp:UpdatePanel ID="update" runat="server">
            <ContentTemplate>
                <script type="text/javascript">
                    function showProgress() {
                        if (Page_ClientValidate()) {
                            var updateProgress = $get("<%= upProgress.ClientID %>");
                            updateProgress.style.display = "block";
                        }
                    }
                </script>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Books Approve Inbox</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Books Approve Inbox</h5>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" OnRowDeleting="gvDept_RowDeleting" DataKeyNames="Book_ID">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Book Title">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBook" runat="server" Text='<%#Eval("Book_Title") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtBook" MaxLength="100" runat="server"
                                                Text='<%#Eval("Book_Title") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Book_ID" HeaderText="Sector ID" ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Subject") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlName" runat="server" Text='<%#Eval("Subject") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Author" HeaderText="Author"   />
                                    <asp:BoundField DataField="Publisher" HeaderText="Publisher" />
                                <asp:BoundField DataField="Copyright" HeaderText="Copyrights" HtmlEncode="false" />
                                <asp:BoundField DataField="Edition" HeaderText="Edition" />
                                <asp:BoundField DataField="Pages" HeaderText="Pages" />
                                    <asp:CommandField ShowDeleteButton="false" />
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve"
                                OnClientClick="showProgress();" OnClick="btnSubmit_Click" />
                        </div>

                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="update">
            <ProgressTemplate>
                <div
                    style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                    <span
                        style="border-width: 0px; position: fixed; padding: 20px; background-color: #FFFFFF; font-size: 30px; left: 40%; top: 40%; border-radius: 50px;">
                        <img alt="progress" src="/Images/loader1.gif" />Loading ...</span>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>