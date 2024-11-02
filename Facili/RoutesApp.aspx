<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="RoutesApp.aspx.cs" Inherits="Schools.Facili.RoutesApp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav aria-label="Page breadcrumb">
        <ol class="breadcrumb mb-1 bg-white py-1 border">
            <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
            <li class="breadcrumb-item">Routes Approve</li>
        </ol>
    </nav>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"><label class="hd1 mb-0">Routes Approve</label></h5>

            <div class="row">
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                    <label class="col-sm-3 col-form-label pl-0">Route ID</label>
                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtID" Enabled="false"
                        MaxLength="100"></asp:TextBox>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                    <label class="col-sm-3 col-form-label pl-0">Route Name</label>
                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRoute" Enabled="false"
                        MaxLength="200"></asp:TextBox>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                    <label class="col-auto col-form-label pl-0">Status:</label>
                    <asp:RadioButtonList RepeatLayout="Flow" CssClass="col form-check form-check-inline mx-0" RepeatDirection="Horizontal"
                        runat="server" ID="rblStatus" Enabled="false">
                        <asp:ListItem class="asp-listItem pt-0 col-form-label mr-3" Value="Active" Selected="True">Active</asp:ListItem>
                        <asp:ListItem class="asp-listItem pt-0 col-form-label" Value="InActive">InActive</asp:ListItem>
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

                        <asp:BoundField DataField="Area_Name" HeaderText="Area Name" />




                    </Columns>
                </asp:GridView>
            </div>
            <div class="form-group d-flex justify-content-end">
                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnApprove" runat="server" Text="Approve"
                    OnClick="btnApprove_Click" />
            </div>
        </div>
    </div>
</asp:Content>