<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimeTable.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.TimeTable" %>

<%@ MasterType VirtualPath="~/Head_Teach.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegister" runat="server">
        <ContentTemplate>
            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">TimeTable</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">TimeTable</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic
                                Year <span class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvAcademic" ValidationGroup="Dis"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                                ErrorMessage="Please select Academic Year"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Class<span
                                    class="red_new">*</span></asp:Label>

                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCname">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCname" ValidationGroup="Dis"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlCname" Display="Dynamic"
                                ErrorMessage="Please select Class"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Stream/Combination<span
                                    class="red_new">*</span></asp:Label>

                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvSection" ValidationGroup="Dis"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlSection" Display="Dynamic"
                                ErrorMessage="Please select Stream/Combination"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label6">Class Teacher<span
                                    class="red_new">*</span></asp:Label>

                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlTeach">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ValidationGroup="Dis"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlTeach" Display="Dynamic"
                                ErrorMessage="Please select Class Teacher"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblDate">From Date
                                <span class="red_new">*</span></asp:Label>
                            <div class="input-group col-md-9 px-0">
                                <asp:TextBox CssClass="form-control" ID="txtDate" runat="server">
                                </asp:TextBox>
                                <div class="input-group-append rounded-right">
                                    <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                        ID="iPopup" ImageUrl="/images/calendar.png" height="38px" />
                                </div>
                            </div>
                            <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                TargetControlID="txtDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDate" ValidationGroup="Dis"
                                ControlToValidate="txtDate" Display="Dynamic" CssClass="red_new offset-md-3"
                                ErrorMessage="Please select  Date"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label5">To Date
                                <span class="red_new">*</span></asp:Label>
                            <div class="input-group col-md-9 px-0">
                                <asp:TextBox CssClass="form-control" ID="txtTDate" runat="server">
                                </asp:TextBox>
                                <div class="input-group-append rounded-right">
                                    <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                        ID="iPopup1" ImageUrl="/images/calendar.png" height="38px" />
                                </div>
                            </div>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="iPopup1"
                                TargetControlID="txtTDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ValidationGroup="Dis"
                                ControlToValidate="txtTDate" Display="Dynamic" CssClass="red_new offset-md-3"
                                ErrorMessage="Please select  Date"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cmpVal" ControlToCompare="txtDate" ControlToValidate="txtTDate"
                            Display="Dynamic" CssClass="red_new offset-md-3" Type="Date" Operator="GreaterThanEqual" ValidationGroup="Dis"
                            ErrorMessage="To Date should be greater than or equal to From Date" runat="server">
                        </asp:CompareValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Copy of
                                Day</asp:Label>
                            <div class="input-group col-md-9 px-0">
                                <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlCDay" runat="server">
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="">--Select Day--
                            </asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Monday" Text="Monday">
                                Monday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Tuesday" Text="Tuesday">
                                Tuesday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Wednesday" Text="Wednesday">
                                Wednesday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Thursday" Text="Thursday">
                                Thursday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Friday" Text="Friday">
                                Friday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Saturday" Text="Saturday">
                                Saturday</asp:ListItem>
                        </asp:DropDownList>
                            </div>
                            
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Day <span
                                    class="red_new">*</span></asp:Label>

                            <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlDay" runat="server">
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="">--Select Day--
                            </asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Monday" Text="Monday">
                                Monday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Tuesday" Text="Tuesday">
                                Tuesday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Wednesday" Text="Wednesday">
                                Wednesday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Thursday" Text="Thursday">
                                Thursday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Friday" Text="Friday">
                                Friday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Saturday" Text="Saturday">
                                Saturday</asp:ListItem>
                        </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDay" ValidationGroup="Dis"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlDay" Display="Dynamic"
                                ErrorMessage="Please select Day"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group d-flex col-12 justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnexec" Text="Execute"
                                ValidationGroup="Dis" OnClick="btnexec_Click" runat="server" />
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
                                <asp:BoundField DataField="Sno" HeaderText="Sno" />
                                <asp:TemplateField HeaderText="Period Type">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlPeriod" Enabled="false" runat="server">
                                            <asp:ListItem Value="">Select</asp:ListItem>
                                            <asp:ListItem Value="Period" Text="period">Period</asp:ListItem>
                                            <asp:ListItem Value="Break" Text="Break">Break</asp:ListItem>
                                        </asp:DropDownList>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Start Time">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtStart" runat="server" Enabled="false"
                                            DataFormatString="{0:t}"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="rfvStart" runat="server"
                                            ControlToValidate="txtStart" CssClass="red_new" Display="Dynamic"
                                            ErrorMessage="Please Enter Start Time"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="End Time">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtEnd" runat="server" Enabled="false"
                                            DataFormatString="{0:t}"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEnd" runat="server"
                                            ControlToValidate="txtEnd" CssClass="red_new" Display="Dynamic"
                                            ErrorMessage="Please Enter End Time"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Teacher FullName">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlTName" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlTName_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvTname" runat="server"
                                            ControlToValidate="ddlTName" CssClass="red_new" Display="Dynamic"
                                            ErrorMessage="Please Select Teacher Name"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlSubject" runat="server">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSubject" runat="server"
                                            ControlToValidate="ddlSubject" CssClass="red_new" Display="Dynamic"
                                            ErrorMessage="Please Select Subject"></asp:RequiredFieldValidator>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="lblno" runat="server" Visible="false"></asp:Label>

                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="lblpsno" runat="server" Visible="false"></asp:Label>

                                    </ItemTemplate>

                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="form-group d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnSubmit" runat="server" Text="Submit"
                        OnClick="btnSubmit_Click" Visible="false" />
                </div>
                </div>
            </div>


        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
            height: 10px;
        }
    </style>
</asp:Content>