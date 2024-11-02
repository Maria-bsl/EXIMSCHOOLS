<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockUser.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.BlockUser" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Block/Unblock User</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1 mb-0">Block/Unblock User</label></h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Block/UnBlock
                                    <span class="red_new">*</span>
                                </label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlUBlock"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlUBlock_SelectedIndexChanged">
                                    <asp:ListItem Value="">Type</asp:ListItem>
                                    <asp:ListItem Value="block">Block</asp:ListItem>
                                    <asp:ListItem Value="unblock">UnBlock</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvUBlock" CssClass="red_new"
                                    Display="Dynamic" ControlToValidate="ddlUBlock" ErrorMessage="Please select type">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>


                        <div class="row">
                            <tr runat="server" id="trub" visible="false">
                                <td>
                                    <div class="col-12">
                                        <hr class="mt-0">
                                    </div>
                                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                        <label class="col-md-3 col-form-label pl-0">Blocked Users
                                            <span class="red_new">*</span>
                                        </label>
                                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server"
                                            ID="ddlBlocks">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvBlocks" CssClass="red_new"
                                            Display="Dynamic" ControlToValidate="ddlBlocks"
                                            ErrorMessage="Please select blocked user"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr runat="server" id="tr1ub" visible="false"></tr>

                            <tr runat="server" id="trbu" visible="false">
                                <td>
                                    <div class="col-12">
                                        <hr class="mt-0">
                                    </div>
                                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                        <label class="col-md-3 col-form-label pl-0">UnBlocked Users
                                            <span class="red_new">*</span>
                                        </label>
                                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server"
                                            ID="ddlBEmails" MaxLength="100">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvBEmails" CssClass="red_new"
                                            ControlToValidate="ddlBEmails" Display="Dynamic"
                                            ErrorMessage="Please select name">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                        <asp:Label runat="server" ID="lblRFB" class="col-md-3 col-form-label pl-0">Reason for Block
                                            <span class="red_new">*</span>
                                        </asp:Label>
                                        <asp:TextBox CssClass="col-md-9 form-control" runat="server"
                                            ID="txtRFB" MaxLength="400">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                            CssClass="red_new offset-md-3" ControlToValidate="txtRFB"
                                            Display="Dynamic" ErrorMessage="Please enter reason">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>

                            <tr runat="server" id="tr1bu" visible="false"></tr>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Visible="false" Text="UnBlock" OnClick="btnSubmit_Click"
                                OnClientClick="return confirm('Are you sure you want to Unblock user?');" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Visible="false" Text="Block" OnClick="btnUpdate_Click"
                                OnClientClick="return confirm('Are you sure you want to Block user?');" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                Visible="false" CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
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