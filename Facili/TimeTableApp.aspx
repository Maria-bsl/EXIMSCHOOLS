<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="TimeTableApp.aspx.cs" Inherits="Schools.Facili.TimeTableApp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">TimeTable Approve</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><label class="hd1 mb-0">TimeTable Approve</label></h5>

                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic Year
                            <span class="red_new">*</span>
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic"
                            Enabled="false">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvAcademic" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlAcademic" Display="Dynamic"
                            ErrorMessage="Please select Academic Year"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Class
                            <span class="red_new">*</span>
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" Enabled="false" runat="server" ID="ddlCname"
                            OnSelectedIndexChanged="ddlCname_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlCname" Display="Dynamic" ErrorMessage="Please select Class">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label2">Stream/Combination
                            <span class="red_new">*</span>
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" Enabled="false"
                            ID="ddlSection">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvSection" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Stream/Combination">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblDate"> Date
                            <span class="red_new">*</span>
                        </asp:Label>
                        <div class="col-sm-9 input-group px-0">
                            <asp:TextBox CssClass="form-control" ID="txtDate" Enabled="false" runat="server">
                            </asp:TextBox>
                            <div class="input-group-append">
                                <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                    ID="iPopup" ImageUrl="/images/calendar.png" Height="38" />
                            </div>
                        </div>
                        <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                            TargetControlID="txtDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                        <asp:RequiredFieldValidator runat="server" ID="rfvDate" ControlToValidate="txtDate"
                            Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select  Date">
                        </asp:RequiredFieldValidator>
                    </div>


                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label3">Day
                            <span class="red_new">*</span>
                        </asp:Label>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtDay" Enabled="false" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="False" Visible="false" Width="100%"
                        AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                        ShowFooter="True">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <HeaderStyle CssClass="HeaderDatagrid" />
                        <PagerStyle CssClass="gridViewPager" />
                        <AlternatingRowStyle CssClass="AlternateItemStyle" />
                        <Columns>
                            <asp:TemplateField HeaderText="SNo" ItemStyle-Width="25%" ItemStyle-VerticalAlign="Top"
                                HeaderStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Period_Type" HeaderText="Period Type" />
                            <asp:BoundField DataField="Start_Time" HeaderText="Start Time" />
                            <asp:BoundField DataField="End_Time" HeaderText="End Time" />
                            <asp:BoundField DataField="TFullName" HeaderText="Teacher" />
                            <asp:BoundField DataField="Subject" HeaderText="Subject" />



                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-group d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                        OnClick="btnSubmit_Click" OnClientClick="return confirm('Are you sure you want to approve');"
                        Text="Approve" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReturn" runat="server" Visible="false"
                        OnClick="btnReturn_Click" OnClientClick="return confirm('Are you sure you want to return');"
                        Text="Return" />
                </div>
            </div>
        </div>

    </div>
</asp:Content>