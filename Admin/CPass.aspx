<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CPass.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.CPass" %>
<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>


                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Change Password</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Change Password</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-160">
                                <label class="col-md-3 col-form-label pl-0">Secret Question<span
                                        class="red_new">*</span></label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSecret">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCurrent"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlSecret" Display="Dynamic"
                                    ErrorMessage="Please select question"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Answer
                                    <span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAns"
                                    MaxLength="490"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAns" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtAns" Display="Dynamic" ErrorMessage="Please enter answer">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-160">
                                <label class="col-md-3 col-form-label pl-0">New Password<span
                                        class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPass"
                                    TextMode="Password" MaxLength="100"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvPass" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtPass" Display="Dynamic"
                                    ErrorMessage="Please enter new password"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revPass" runat="server"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Password length must be between 8 to 14 characters, one digit, one special character, one lower case and one upper case."
                                    ControlToValidate="txtPass"
                                    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{8,14}$" />
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-160">
                                <label class="col-md-3 col-form-label pl-0">Confirmation Password<span
                                        class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtConfirm"
                                    TextMode="Password"  MaxLength="100"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvConfirm"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtConfirm" Display="Dynamic"
                                    ErrorMessage="Please enter confirmation password"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revConfirm" runat="server"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Password length must be between 8 to 14 characters"
                                    ControlToValidate="txtConfirm"
                                    ValidationExpression="^[a-zA-Z0-9'@&#.~!%^*()_+=?<>\s]{8,14}$" />
                                <asp:CompareValidator ID="cvConfirm" runat="server" ControlToValidate="txtConfirm"
                                    Display="Dynamic" CssClass="red_new offset-md-3" ControlToCompare="txtPass"
                                    ErrorMessage="New password and confirm password should be same"
                                    ToolTip="New password and confirm password should be same" />
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-160">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label8">Enter
                                    Below Code<span class="red_new">*</span></asp:Label>

                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtCaptcha"
                                    MaxLength="200" ></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCaptcha"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtCaptcha" Display="Dynamic"
                                    ErrorMessage="Please enter captcha code"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="cvCaptcha" runat="server" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtCaptcha"
                                    ErrorMessage="Please enter valid captcha code, try again." Display="Dynamic"
                                    OnServerValidate="cvCaptcha_ServerValidate"></asp:CustomValidator>
                            </div>
                            <div class="col-12"></div>
                            <div class="form-group col d-flex fix-160">
                                <asp:Image ID="imgCaptcha" CssClass="fix-captcha" runat="server" />
                                <asp:ImageButton CssClass="input-group-text fix-btn ml-1" runat="server"
                                    ImageUrl="~/images/refresh.png" CausesValidation="false" ID="imgCaptcha1"
                                    OnClick="imgCaptcha1_Click" />
                            </div>
                            <div class="col-12"></div>
                            <div class="form-group col-sm-12 col-md-10 col-lg-8 d-flex justify-content-end">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Submit"
                                    OnClick="btnReg_Click" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                    Text="Reset" CausesValidation="false" OnClick="btnCancel_Click" />
                            </div>
                        </div>



                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>