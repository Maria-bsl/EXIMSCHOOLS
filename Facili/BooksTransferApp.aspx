<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="BooksTransferApp.aspx.cs" Inherits="Schools.Facili.BooksTransferApp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
                        <li class="breadcrumb-item">Books Transfer Approval</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Books Transfer Approval</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">Transfer Date<span
                                        class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtdate" runat="server"
                                    Enabled="false"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblPB">From
                                    Location ID<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtliblid" Enabled="false"
                                    runat="server">

                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label2">From
                                    Location Name<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtliblname" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">To
                                    Location ID<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtlibtid" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label4">To
                                    Location Name<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtlibltname" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-auto col-form-label pl-0" runat="server" ID="Label3">Status
                                    <span class="red_new">*</span></asp:Label>
                                <asp:RadioButtonList CssClass="col form-control asp-radioButtonList" ID="rblstatus"
                                    Enabled="false" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem class="pt-0 mr-3" Text="Active" Value="0" Selected="True">
                                    </asp:ListItem>
                                    <asp:ListItem class="pt-0" Text="InActive" Value="1"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" ShowFooter="True">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sno">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Book_Trans_Det_Sno" HeaderText="BookTranSno"
                                        ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                    <asp:BoundField DataField="Book_Title" HeaderText="Book Title" />
                                    <asp:BoundField DataField="Author" HeaderText="Author" />
                                    <asp:BoundField DataField="Rack_Name_From" HeaderText="Rack From" />
                                    <asp:BoundField DataField="Rack_Name_To" HeaderText="Rack To" />
                                    <asp:BoundField DataField="Qty" HeaderText="Quantity" />


                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                OnClientClick="showProgress();" Text="Approve" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>

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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>