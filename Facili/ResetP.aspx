<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetP.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.ResetP" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegister" runat="server">
        <ContentTemplate>


            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Reset password</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Reset Password</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Users:<span class="red_new">*</span></label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlBlocks">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvBlocks" CssClass="red_new offset-md-3"
                                Display="Dynamic" ControlToValidate="ddlBlocks" ErrorMessage="Please select user">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-12 col-md-10 col-lg-8 d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Text="Reset Password" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />

        </Triggers>
    </asp:UpdatePanel>
</asp:Content>