<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Teach.Master" AutoEventWireup="true" CodeBehind="AttndnceRet.aspx.cs" Inherits="Schools.Teach.AttndnceRet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Attendance Approve</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><label class="hd1">Attendance Approve</label></h5>

                <div class="row">
                    <div class="form-group col-md-10 col-lg-8 row mx-0">
                        <asp:Label CssClass="col-md-4 col-lg-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic
                            Year<span class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-8 col-lg-9 form-control" runat="server" ID="ddlAcademic"
                            Enabled="false">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvAcademic"
                            CssClass="red_new offset-md-4 offset-lg-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                            ErrorMessage="Please select Academic Year"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-10 col-lg-8 row mx-0">
                        <asp:Label CssClass="col-md-4 col-lg-3 col-form-label pl-0" runat="server" ID="Label1">Class
                            <span class="red_new">*</span>
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-8 col-lg-9 form-control" runat="server" ID="ddlCname"
                            Enabled="false"></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCname"
                            CssClass="red_new offset-md-4 offset-lg-3" ControlToValidate="ddlCname" Display="Dynamic"
                            ErrorMessage="Please select Class">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-10 col-lg-8 row mx-0">
                        <asp:Label CssClass="col-md-4 col-lg-3 col-form-label pl-0" runat="server" ID="Label3">Programme/Combination/Stream
                            <span class="red_new">*</span>
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-8 col-lg-9 form-control" runat="server" Enabled="false"
                            ID="ddlSection" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSection_SelectedIndexChanged"></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvSection"
                            CssClass="red_new offset-md-4 offset-lg-3" ControlToValidate="ddlSection" Display="Dynamic"
                            ErrorMessage="Please select Programme/Combination/Stream">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-10 col-lg-8 row mx-0">
                        <asp:Label CssClass="col-md-4 col-lg-3 col-form-label pl-0" runat="server" ID="lblDate">
                            Attendance Date<span class="red_new">*</span></asp:Label>
                        <asp:TextBox CssClass="col-md-8 col-lg-9 form-control Displaytext" ID="txtDate" runat="server"
                            Enabled="false">
                        </asp:TextBox>
                    </div>

                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" ShowFooter="True" OnRowDataBound="gvRowDataBound">
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
                            <asp:BoundField DataField="Admission_No" HeaderText="Admission No" />
                            <asp:BoundField DataField="Student_Full_Name" HeaderText="Student" />
                            <asp:TemplateField HeaderText="Present/Absent">
                                <ItemTemplate>
                                    <asp:DropDownList CssClass="col-md-8 col-lg-9 form-control" ID="ddlpat"
                                        runat="server" Width="100px">
                                        <asp:ListItem Value="P">Present</asp:ListItem>
                                        <asp:ListItem Value="A">Absent</asp:ListItem>

                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvpat" runat="server" ControlToValidate="ddlpat"
                                        CssClass="red_new offset-md-4 offset-lg-3" Display="Dynamic"
                                        ErrorMessage="Please select present/absent">
                                    </asp:RequiredFieldValidator>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Att_Det_Sno" HeaderText="Department ID" ShowHeader="false">
                                <ItemStyle CssClass="hide" />
                                <HeaderStyle CssClass="hide" />
                            </asp:BoundField>


                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

    </div>
</asp:Content>