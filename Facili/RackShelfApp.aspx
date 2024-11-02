<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="RackShelfApp.aspx.cs" Inherits="Schools.Facili.RackShelfApp" %>
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
                        <li class="breadcrumb-item">Rack Shelf Approve</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1 mb-0">Rack Shelf Approve</label></h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCPN">Rack ID
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtID" runat="server" Enabled="false"
                                    MaxLength="100" >
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Rack Name
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtname" runat="server"
                                    Enabled="false" MaxLength="100" >
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label3">Location
                                    Name</asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlName"
                                    Enabled="false" >
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-145">
                                <label class="col-auto col-form-label pl-0">Status</label>
                                <asp:RadioButtonList RepeatLayout="Flow" CssClass="col asp-radioButtonList" RepeatDirection="Horizontal"
                                    runat="server" ID="rblStatus" Enabled="false">
                                    <asp:ListItem class="mr-3 pt-0" Value="Active" Selected="True">Active</asp:ListItem>
                                    <asp:ListItem class="pt-0" Value="InActive">InActive</asp:ListItem>
                                </asp:RadioButtonList>
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
                                    <asp:TemplateField HeaderText="Sno">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Shelf_No" HeaderText="Shelf No" />




                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnApprove" runat="server"
                                Text="Approve" OnClientClick="showProgress();" OnClick="btnApprove_Click" />
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