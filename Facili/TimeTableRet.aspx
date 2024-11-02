<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="TimeTableRet.aspx.cs" Inherits="Schools.Facili.TimeTableRet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">TimeTable Return</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1 mb-0">TimeTable Return</label></h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic
                                    Year
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic"
                                    Enabled="false">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAcademic"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                                    ErrorMessage="Please select Academic Year">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Class
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" Enabled="false" runat="server"
                                    ID="ddlCname" OnSelectedIndexChanged="ddlCname_SelectedIndexChanged"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlCname" Display="Dynamic" ErrorMessage="Please select Class">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label2">Stream/Combination
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" Enabled="false"
                                    ID="ddlSection">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvSection"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlSection" Display="Dynamic"
                                    ErrorMessage="Please select Stream/Combination">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblDate"> Date
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <div class="input-group col-md-9 px-0">
                                    <asp:TextBox CssClass="form-control" ID="txtDate" Enabled="false" runat="server">
                                    </asp:TextBox>
                                    <div class="input-group-append rounded-right">
                                        <asp:ImageButton CssClass="input-group-text" runat="server"
                                            CausesValidation="false" ID="iPopup" ImageUrl="/images/calendar.png"
                                            Height="38" />
                                    </div>
                                </div>
                                <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                    TargetControlID="txtDate" Format="MM/dd/yyyy">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RequiredFieldValidator runat="server" ID="rfvDate" ControlToValidate="txtDate"
                                    Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select  Date">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label3">Day
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtDay" Enabled="false"
                                    runat="server">
                                </asp:TextBox>
                            </div>

                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="False" Visible="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" ShowFooter="True" OnRowDataBound="gvRowDataBound">
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
                                    <asp:TemplateField HeaderText="Teacher FullName">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlTName"
                                                runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlTName_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvTname" runat="server"
                                                ControlToValidate="ddlTName" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Select Teacher Name">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlSubject"
                                                runat="server">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server"
                                                ControlToValidate="ddlSubject" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Select Subject">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Time_Table_Det_Sno" HeaderText="Department ID"
                                        ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>


                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                OnClick="btnSubmit_Click" Text="Update" />
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>