<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimeTable.aspx.cs" MasterPageFile="~/Head_Teach.Master" Inherits="Schools.Teach.TimeTable" %>

<%@ MasterType VirtualPath="~/Head_Teach.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
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
                        <h5 class="card-title"><label class="hd1">TimeTable</label></h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-8 col-lg-6 row mx-0">
                                <asp:Label Cssclass="col-sm-4 col-form-label pl-0" runat="server" ID="lblCPN">Academic
                                    Year<span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-sm-8 form-control" runat="server" ID="ddlAcademic">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAcademic" ValidationGroup="Dis"
                                    CssClass="red_new offset-sm-4" ControlToValidate="ddlAcademic" Display="Dynamic"
                                    ErrorMessage="Please select Academic Year">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-8 col-lg-6 row mx-0">
                                <asp:Label Cssclass="col-sm-4 col-form-label pl-0" runat="server" ID="Label1">Class
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-sm-8 form-control" runat="server" ID="ddlCname">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCname" ValidationGroup="Dis"
                                    CssClass="red_new offset-sm-4" ControlToValidate="ddlCname" Display="Dynamic"
                                    ErrorMessage="Please select Class">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-8 col-lg-6 row mx-0">
                                <asp:Label Cssclass="col-sm-4 col-form-label pl-0" runat="server" ID="Label2">Programme/Combination/Stream
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-sm-8 form-control" runat="server" ID="ddlSection">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvSection" ValidationGroup="Dis"
                                    CssClass="red_new offset-sm-4" ControlToValidate="ddlSection" Display="Dynamic"
                                    ErrorMessage="Please select Programme/Combination/Stream">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-8 col-lg-6 row mx-0">
                                <asp:Label Cssclass="col-sm-4 col-form-label pl-0" runat="server" ID="lblDate"> Date
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <div class="col-sm-8 input-group px-0">
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"
                                        OnTextChanged="txtDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:ImageButton CssClass="input-group-text" runat="server"
                                            CausesValidation="false" ID="iPopup" ImageUrl="/images/calendar.png"
                                            Height="38" />
                                    </div>
                                </div>
                                <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                    TargetControlID="txtDate" Format="MM/dd/yyyy">
                                </ajaxToolkit:CalendarExtender>
                                <br />
                                <asp:RequiredFieldValidator runat="server" ID="rfvDate" ValidationGroup="Dis"
                                    ControlToValidate="txtDate" Display="Dynamic" CssClass="red_new offset-sm-4"
                                    ErrorMessage="Please select  Date">
                                </asp:RequiredFieldValidator>
                            </div>

                            <asp:Label ID="lblperiod" runat="server" Visible="true"></asp:Label>

                            <asp:Label ID="lnldate" runat="server" Visible="true"></asp:Label>

                            <div class="form-group col-sm-11 col-md-8 col-lg-6 row mx-0">
                                <asp:Label Cssclass="col-sm-4 col-form-label pl-0" runat="server" ID="Label4">Copy of
                                    Date</asp:Label>
                                <div class="col-sm-8 input-group px-0">
                                    <asp:TextBox CssClass="form-control" ID="txtCDate" runat="server">
                                    </asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:ImageButton CssClass="input-group-text" runat="server"
                                            CausesValidation="false" ID="iPopup1" ImageUrl="/images/calendar.png"
                                            Height="38" />
                                    </div>
                                </div>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                    PopupButtonID="iPopup1" TargetControlID="txtCDate" Format="MM/dd/yyyy">
                                </ajaxToolkit:CalendarExtender>
                            </div>
                            <div class="form-group col-sm-11 col-md-8 col-lg-6 row mx-0">
                                <asp:Label Cssclass="col-sm-4 col-form-label pl-0" runat="server" ID="Label3">Day
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:TextBox CssClass="col-sm-8 form-control" ID="txtDay" Enabled="false"
                                    runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvDay" ValidationGroup="Dis"
                                    CssClass="red_new offset-sm-4" ControlToValidate="txtDay" Display="Dynamic"
                                    ErrorMessage="Please Enter Day">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-12 d-flex justify-content-end">
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
                                            <asp:DropDownList CssClass="col-sm-8 form-control" ID="ddlPeriod"
                                                Enabled="false" runat="server">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem Value="Period" Text="period">Period
                                                </asp:ListItem>
                                                <asp:ListItem Value="Break" Text="Break">Break
                                                </asp:ListItem>
                                            </asp:DropDownList>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Start Time">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="col-sm-8 form-control" ID="txtStart" runat="server"
                                                Enabled="false" DataFormatString="{0:t}">
                                            </asp:TextBox>

                                            <asp:RequiredFieldValidator ID="rfvStart" runat="server"
                                                ControlToValidate="txtStart" CssClass="red_new offset-sm-4"
                                                Display="Dynamic" ErrorMessage="Please Enter Start Time">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="End Time">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="col-sm-8 form-control" ID="txtEnd" runat="server"
                                                Enabled="false" DataFormatString="{0:t}"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvEnd" runat="server"
                                                ControlToValidate="txtEnd" CssClass="red_new offset-sm-4"
                                                Display="Dynamic" ErrorMessage="Please Enter End Time">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Teacher FullName">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="col-sm-8 form-control" ID="ddlTName"
                                                runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlTName_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvTname" runat="server"
                                                ControlToValidate="ddlTName" CssClass="red_new offset-sm-4"
                                                Display="Dynamic" ErrorMessage="Please Select Teacher Name">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="col-sm-8 form-control" ID="ddlSubject"
                                                runat="server">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server"
                                                ControlToValidate="ddlSubject" CssClass="red_new offset-sm-4"
                                                Display="Dynamic" ErrorMessage="Please Select Subject">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="lblno" runat="server" Visible="false">
                                            </asp:Label>

                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="lblpsno" runat="server" Visible="false">
                                            </asp:Label>

                                        </ItemTemplate>

                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="form-group col d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Visible="false" OnClick="btnSubmit_Click" Text="Submit" />
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
            height: 10px;
        }
    </style>
</asp:Content>