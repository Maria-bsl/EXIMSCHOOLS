<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeFaci.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.ChangeFaci" %>
<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>


                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                        <li class="breadcrumb-item">Change Deleted University/College/School Name</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Change Deleted University/College/School Name</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-180">
                                <label class="col-md-3 col-form-label pl-0">Deleted University/College/School Names</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSCH">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvSCH" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlSCH" Display="Dynamic" ErrorMessage="Please select school">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-180">
                                <label class="col-md-3 col-form-label pl-0">Change University/College/School Name</label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFaci"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtFaci" Display="Dynamic"
                                    ErrorMessage="Please enter school name"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-12 ChangeFaci d-flex justify-content-end">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Change"
                                    OnClientClick="return confirm('Are you sure you want to change the school?');"
                                    OnClick="btnReg_Click" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                    Text="Cancel" />

                            </div>
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