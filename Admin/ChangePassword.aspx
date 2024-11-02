<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.ChangePassword" %>
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
                        <h5 class="card-title mb-3">Change Password</h5>
                        <div class="row mt-5">
                        <asp:Label runat="server" ID="lblExpired" Visible="false" class="alert alert-danger">Your password has been expired, please change it</asp:Label>
                            </div>
                        <tr runat="server" id="trexpire" visible="false">
                            <td>
                                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <asp:Label runat="server" ID="Label1">Your password hasn't changed until 90 days,
                                        please change your password.</asp:Label>
                                </div>
                            </td>
                        </tr>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-190">
                                <label class="col-md-3 col-form-label pl-0">Current Password <span
                                        class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtCurrent"
                                    TextMode="Password" MaxLength="100"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCurrent"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtCurrent" Display="Dynamic"
                                    ErrorMessage="Please enter current password"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-190">
                                <label class="col-md-3 col-form-label pl-0">New Password <span
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

                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-190">
                                <label class="col-md-3 col-form-label pl-0">Confirmation Password<span
                                        class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtConfirm"
                                    TextMode="Password" MaxLength="100"></asp:TextBox>
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
                            <div class="form-group col-12 col-md-10 col-lg-8 d-flex justify-content-end">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Submit"
                                    OnClick="btnReg_Click" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                    CausesValidation="false" Text="Reset" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>


            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>