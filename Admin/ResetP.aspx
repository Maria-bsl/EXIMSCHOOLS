<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetP.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.ResetP" %>

<%@ MasterType VirtualPath="~/Head_Admin.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                        <li class="breadcrumb-item">Reset Password</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Reset Password</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <label class="col-md-3 col-form-label pl-0">User <span class="red_new">*</span></label>
                                <asp:DropDownList CssClass="Displaytext form-control" runat="server" ID="ddlUser"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlUser_SelectedIndexChanged">
                                    <asp:ListItem Value="">User Type</asp:ListItem>
                                    <asp:ListItem Value="school">University/College/School User</asp:ListItem>
                                    <asp:ListItem Value="bank">Bank User</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvUser" CssClass="red_new offset-md-3"
                                    Display="Dynamic" ControlToValidate="ddlUser" ErrorMessage="Please select user">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>


                        <div class="row">
                            <tr runat="server" id="trub" visible="false">
                                <td>
                                    <div class="col-12">
                                        <hr class="mt-0">
                                    </div>
                                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblUser">
                                            Bank
                                            Users<span class="red_new">*</span></asp:Label>
                                        <asp:DropDownList CssClass="Displaytext form-control" runat="server"
                                            ID="ddlRUser">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvRUser"
                                            CssClass="red_new offset-md-3" Display="Dynamic"
                                            ControlToValidate="ddlRUser" ErrorMessage="Please select user">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr runat="server" id="tr1ub" visible="false"></tr>
                            <tr runat="server" id="trbu" visible="false">
                                <td>
                                    <div class="col-12">
                                        <hr class="mt-0">
                                    </div>
                                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                        <label class="col-md-3 col-form-label pl-0">University/College/School Users<span
                                                class="red_new">*</span></label>
                                        <asp:DropDownList CssClass="Displaytext form-control" runat="server"
                                            ID="ddlSchool" MaxLength="100" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSchool_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvEmail"
                                            CssClass="red_new offset-md-3" ControlToValidate="ddlSchool"
                                            Display="Dynamic" ErrorMessage="Please seclect school">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                        <label class="col-md-3 col-form-label pl-0">Full Name<span
                                                class="red_new">*</span></label>
                                        <asp:DropDownList CssClass="Displaytext form-control" runat="server"
                                            ID="ddlBEmails" MaxLength="100"></asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvBEmails"
                                            CssClass="red_new offset-md-3" ControlToValidate="ddlBEmails"
                                            Display="Dynamic" ErrorMessage="Please select user">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr runat="server" id="tr1bu" visible="false"></tr>

                            <div class="form-group col-12 d-flex justify-content-end">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                    Visible="false" Text="Reset Password" OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                    Visible="false" Text="Block" OnClick="btnUpdate_Click"
                                    OnClientClick="return confirmCheckIn(this,'Are you sure you want to Block user?');" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                    Visible="false" CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
                <asp:PostBackTrigger ControlID="btnUpdate" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>