<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attndnce.aspx.cs" MasterPageFile="~/Head_Teach.Master" Inherits="Schools.Teach.Attndnce" %>

<%@ MasterType VirtualPath="~/Head_Teach.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Attendance</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1">Attendance</label></h5>
                        <div class="row">
                            <div class="form-group col-md-10 col-lg-8 row mx-0">
                                <asp:Label CssClass="col-md-4 col-lg-3 col-form-label pl-0" runat="server" ID="lblCPN">
                                    Academic
                                    Year
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-8 col-lg-9 form-control" runat="server"
                                    ID="ddlAcademic">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAcademic"
                                    CssClass="red_new offset-md-4 offset-lg-3" ControlToValidate="ddlAcademic"
                                    Display="Dynamic" ErrorMessage="Please select Academic Year">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-10 col-lg-8 row mx-0">
                                <asp:Label CssClass="col-md-4 col-lg-3 col-form-label pl-0" runat="server" ID="Label1">
                                    Class
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-8 col-lg-9 form-control" runat="server"
                                    ID="ddlCname">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCname"
                                    CssClass="red_new offset-md-4 offset-lg-3" ValidationGroup="Dis"
                                    ControlToValidate="ddlCname" Display="Dynamic" ErrorMessage="Please select Class">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-10 col-lg-8 row mx-0">
                                <asp:Label CssClass="col-md-4 col-lg-3 col-form-label pl-0" runat="server" ID="Label3">
                                    Programme/Combination/Stream
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-8 col-lg-9 form-control" runat="server"
                                    ID="ddlSection">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvSection"
                                    CssClass="red_new offset-md-4 offset-lg-3" ValidationGroup="Dis"
                                    ControlToValidate="ddlSection" Display="Dynamic"
                                    ErrorMessage="Please select Programme/Combination/Stream">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-10 col-lg-8 row mx-0">
                                <asp:Label CssClass="col-md-4 col-lg-3 col-form-label pl-0" runat="server" ID="lblDate">
                                    Attendance Date
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <div class="input-group col-md-8 col-lg-9 px-0">
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control Displaytext">
                                    </asp:TextBox>
                                    <div class="input-group-append rounded-right">
                                        <asp:ImageButton CssClass="input-group-text" runat="server"
                                            CausesValidation="false" ID="iPopup" ImageUrl="/images/calendar.png"
                                            height="38px" />
                                    </div>
                                </div>
                                <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                    TargetControlID="txtDate" Format="MM/dd/yyyy">
                                </ajaxToolkit:CalendarExtender><br />
                                <asp:RequiredFieldValidator runat="server" ID="rfvDate" ControlToValidate="txtDate"
                                    ValidationGroup="Dis" Display="Dynamic" CssClass="red_new offset-md-4 offset-lg-3"
                                    ErrorMessage="Please select  Date">
                                </asp:RequiredFieldValidator>
                                <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                                    errormessage="Date must be less than or equal to today date"
                                    CssClass="red_new offset-md-4 offset-lg-3"
                                    valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                                    controltovalidate="txtDate" type="date" Operator="LessThanEqual" />
                            </div>
                            <div class="form-group d-flex justify-content-end col-md-10 col-lg-8">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" runat="server" ValidationGroup="Dis"
                                    ID="btnStu" Text="Display Students" OnClick="btnStu_Click" />
                            </div>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display"
                                runat="server" AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                ShowFooter="True">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                    <asp:BoundField DataField="Sno" HeaderText="Sno" ItemStyle-CssClass="sno-sm" />
                                    <asp:TemplateField HeaderText="Admission No">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="ddlAdmission" runat="server"
                                                Enabled="false">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvAdmission" runat="server"
                                                ControlToValidate="ddlAdmission"
                                                CssClass="red_new offset-md-4 offset-lg-3" Display="Dynamic"
                                                ErrorMessage="Please Select Admission No">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Student FullName">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="ddlStuName" runat="server"
                                                Enabled="false">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvStuname" runat="server"
                                                ControlToValidate="ddlStuName"
                                                CssClass="red_new offset-md-4 offset-lg-3" Display="Dynamic"
                                                ErrorMessage="Please Select Student Name">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Present/Absent">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" ID="ddlpat" runat="server"
                                                MaxLength="1" Width="100px">
                                                <asp:ListItem Value="P" Text="P">Present</asp:ListItem>
                                                <asp:ListItem Value="A" Text="A">Absent</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvpat" runat="server"
                                                ControlToValidate="ddlpat" CssClass="red_new offset-md-4 offset-lg-3"
                                                Display="Dynamic" ErrorMessage="Please select present/absent">
                                            </asp:RequiredFieldValidator>

                                        </ItemTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Submit"
                                Visible="false" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>