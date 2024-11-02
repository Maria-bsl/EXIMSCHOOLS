<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobileReg.aspx.cs" MasterPageFile="~/Head_Public.Master" Inherits="PresentationLayer.Public.MobileReg" %>
<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .card-650 {
            max-width: 1200px;
        }
    </style>

    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>
                <div class="card card-650">
                    <div class="card-body">
                        <h5 class="card-title mb-0">Parent Registration</h5>
                        <hr class="mt-2">

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCompany">Parent
                                    Name<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPName"
                                    MaxLength="200">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtPName" Display="Dynamic" ErrorMessage="Please enter name">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblEmail">Email
                                    Address<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmail"
                                    MaxLength="200">
                                </asp:TextBox><br />
                                <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtEmail" Display="Dynamic"
                                    ErrorMessage="Please enter email address"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" CssClass="red" runat="server"
                                    ControlToValidate="txtEmail" ErrorMessage="Please enter the valid Email ID"
                                    ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                    Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblMobile">Mobile
                                    No.<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtWork" MaxLength="20"
                                    ToolTip="Mobile No:(ex:784777777)"></asp:TextBox><br />
                                <asp:RequiredFieldValidator runat="server" ID="rfvWork" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtWork" Display="Dynamic" ErrorMessage="Please enter mobile no">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="revWork"
                                    CssClass="red_new offset-md-3" ValidationExpression="^[0-9]{1,12}$"
                                    ControlToValidate="txtWork" Display="Dynamic"
                                    ErrorMessage="Please enter valid number">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCaptcha">User
                                    Name<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtUser"
                                    MaxLength="20">
                                </asp:TextBox><br />
                                <asp:RequiredFieldValidator runat="server" ID="rfvUser" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtUser" Display="Dynamic" ErrorMessage="Please enter user name">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <h6>
                            <asp:Label runat="server" ID="Label5">University/College/School Registration Account Details:
                            </asp:Label>
                        </h6>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="True" ShowFooter="True">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                    <asp:BoundField DataField="Sno" HeaderText="Sno" />
                                    <asp:TemplateField HeaderText="University/College/School">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" ID="ddlSchool" runat="server"
                                                Width="280" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlSchool_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvSchool" runat="server"
                                                ControlToValidate="ddlSchool" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Select University/College/School">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Admission No">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="txtAdmission" runat="server"
                                                Width="180" AutoPostBack="true"
                                                OnTextChanged="ddlAdmission_SelectedIndexChanged">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvAdmission" runat="server"
                                                ControlToValidate="txtAdmission" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Enter Admission No">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Academic Year">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" ID="ddlAcademic" runat="server"
                                                Width="180">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvAcademic" runat="server"
                                                ControlToValidate="ddlAcademic" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Select Academic">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" ID="ddlClass" runat="server"
                                                Width="200">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvClass" runat="server"
                                                ControlToValidate="ddlClass" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Select Class">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Section">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" ID="ddlSection" runat="server"
                                                Width="200">

                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvSection" runat="server"
                                                ControlToValidate="ddlSection" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Select Section">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Student">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="txtStudent" runat="server"
                                                Width="250" Enabled="false">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvStudent" runat="server"
                                                ControlToValidate="txtStudent" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Enter student name">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                        <FooterStyle HorizontalAlign="Right" />

                                        <FooterTemplate>

                                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="ButtonAdd"
                                                runat="server" Text="Add New Row" CausesValidation="false"
                                                onclick="ButtonAdd_Click" />

                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"
                                                CausesValidation="false">Remove
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="form-group d-flex justify-content-end mb-0">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Register"
                                OnClick="btnReg_Click" />
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnReg" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>