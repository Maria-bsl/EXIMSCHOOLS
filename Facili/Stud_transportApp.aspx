<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="Stud_transportApp.aspx.cs" Inherits="Schools.Facili.Stud_transportApp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Student Transport Approve</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><label class="hd1 mb-0">Student Transport Approve</label></h5>

                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic Year
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic"
                            Enabled="false">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Class Name
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" Enabled="false" runat="server" ID="ddlCname"
                            AutoPostBack="true">
                        </asp:DropDownList>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label2">Programme/Combination/Stream Name
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" Enabled="false"
                            ID="ddlSection">
                        </asp:DropDownList>
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
                            <asp:TemplateField HeaderText="SNo">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                                <ItemStyle Width="2%" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Stu_Tran_A_M_Sno" HeaderText="Sno" Visible="false" />
                            <asp:BoundField DataField="Student_Full_Name" HeaderText="Student FullName " />
                            <asp:BoundField DataField="Route_Name" HeaderText="Route Name" />
                            <asp:BoundField DataField="Area_Name" HeaderText="Area Name" />
                            <asp:BoundField DataField="Departure_Time" HeaderText="Pick up Time" />
                            <asp:BoundField DataField="Arrival_Time" HeaderText="Drop off Time" />
                            <asp:BoundField DataField="LandMark_Pickup" HeaderText="Landmark Pickup" />



                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-group d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnApprove" runat="server" Text="Approve"
                        OnClick="btnApprove_Click" />
                </div>
            </div>
        </div>

    </div>
</asp:Content>