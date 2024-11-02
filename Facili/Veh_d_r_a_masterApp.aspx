<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="veh_d_r_a_masterApp.aspx.cs" Inherits="Schools.Facili.veh_d_r_a_masterApp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 10%;
            height: 93px;
        }

        .auto-style6 {
            width: 30%;
            height: 93px;
        }

        .auto-style7 {
            width: 50%;
            height: 93px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Vehicle Drivers Route Allocation Approval</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1 mb-0">Vehicle Drivers Route Allocation Approval</label>
                        </h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" ID="lblregno" runat="server">
                                    Registration No/Plate No</asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlvehregno" Enabled="false"
                                     runat="server">
                                    <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblPB">Driver Name
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtdriname" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label2">Route Id
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtrid" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Route Name
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtname" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label4">Attendant
                                    Name</asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtaname" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
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
                                    <asp:BoundField DataField="Route_Det_Sno" HeaderText="Route Det Sno"
                                        ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Area_Name" HeaderText="Area Name" />
                                    <asp:BoundField DataField="Arrival_Time" HeaderText="Pick up Time"
                                        HtmlEncode="false" DataFormatString="{0:hh\:mm}" />
                                    <asp:BoundField DataField="Departure_Time" HeaderText="Drop off Time"
                                        HtmlEncode="false" DataFormatString="{0:hh\:mm}" />
                                    <asp:BoundField DataField="LandMark_Pickup" HeaderText="Land Mark Pickup" />

                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve"
                                OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>