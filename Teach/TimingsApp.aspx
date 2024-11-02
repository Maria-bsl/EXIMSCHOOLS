<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Teach.Master" AutoEventWireup="true" CodeBehind="TimingsApp.aspx.cs" Inherits="Schools.Teach.TimingsApp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>
                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Period Timings</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">
                            <label class="hd1">Period Timings</label>
                        </h5>

                        <div class="row">
                            <div class="form-group col-md-6 row mx-0">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic
                                    Year<span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic"
                                    Enabled="false">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAcademic"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                                    ErrorMessage="Please select Academic Year"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-6 row mx-0">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Class
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCname"
                                    Enabled="false">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlCname" Display="Dynamic" ErrorMessage="Please select Class">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-6 row mx-0">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label2"> Copy of
                                    Class
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCCname"
                                    Enabled="false">

                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-md-6 row mx-0">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Day
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtDay" runat="server"
                                    Enabled="false">

                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvDay" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtDay" Display="Dynamic" ErrorMessage="Please Enter Day">
                                </asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="True" ShowFooter="True">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>

                                    <asp:TemplateField HeaderText="SNo" ItemStyle-Width="25%"
                                        ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Period_Type" HeaderText="Period Type" />
                                    <asp:BoundField DataField="Start_Time" HeaderText="Start Time" />
                                    <asp:BoundField DataField="End_Time" HeaderText="End Time" />

                                </Columns>
                            </asp:GridView>


                        </div>
                        <div class="form-group col d-flex justify-content-end px-0">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve"
                                OnClientClick="return confirm('Are you sure you want to approve');"
                                OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnReturn" runat="server"
                                Text="Return" OnClientClick="return confirm('Are you sure you want to return');"
                                OnClick="btnReturn_Click" />
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>