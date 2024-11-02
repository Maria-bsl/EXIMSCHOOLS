<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BooksIssues_teaApp.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.BooksIssues_teaApp" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    <li class="breadcrumb-item">Teachers Books Issuing Approve</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        <label class="hd1">Teachers Books Issuing Approve</label>
                    </h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic Year
                            </asp:Label>
                            <asp:DropDownList CssClass="input-group col-md-9 px-0" runat="server" ID="ddlAcademic"
                                Enabled="false">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblPB">Teacher Full
                                Name</asp:Label>
                            <asp:DropDownList CssClass="input-group col-md-9 px-0" runat="server" ID="ddlFull"
                                Enabled="false" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Number of Days
                            </asp:Label>
                            <asp:TextBox CssClass="input-group col-md-9 px-0" runat="server" ID="txtfree"
                                Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label2">Location
                            </asp:Label>
                            <asp:TextBox CssClass="input-group col-md-9 px-0" runat="server" ID="txtloc"
                                Enabled="false">
                            </asp:TextBox>
                        </div>
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="False" Visible="false" Width="100%"
                            AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                            AllowPaging="false" ShowFooter="True">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <HeaderStyle CssClass="HeaderDatagrid" />
                            <PagerStyle CssClass="gridViewPager" />
                            <AlternatingRowStyle CssClass="AlternateItemStyle" />
                            <Columns>
                                <asp:TemplateField HeaderText="Sno" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top"
                                    HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="lblsno" runat="server" CssClass="hide"
                                            Text='<%#Eval("Book_Iss_Tea_Det_Sno") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Book_Iss_Tea_Mas_Sno" HeaderText="Sno">

                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                <asp:BoundField DataField="Book_Title" HeaderText="Book Title" />
                                <asp:BoundField DataField="Author" HeaderText="Author" />
                                <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnApprove" runat="server"
                            OnClientClick="showProgress();" OnClick="btnApprove_Click" Text="Approve" />
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