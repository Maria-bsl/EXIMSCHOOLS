<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.ViewUser" %>

<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">User Inbox</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">User Inbox</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <label class="col-md-3 col-form-label pl-0">User Number</label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmpno"
                                    Enabled="false" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvEmpno" ControlToValidate="txtEmpno"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please enter user number">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <label class="col-md-3 col-form-label pl-0">First Name</label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFullName"
                                    Enabled="false" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfv4" ControlToValidate="txtFullName"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please enter first name">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <label class="col-md-3 col-form-label pl-0">Middle Name</label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtMName"
                                    Enabled="false" MaxLength="50"></asp:TextBox>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <label class="col-md-3 col-form-label pl-0">Last Name</label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtLName"
                                    Enabled="false" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvLName" ControlToValidate="txtLName"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please enter last name">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <label class="col-md-3 col-form-label pl-0">Title/Designation</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlDesignation"
                                    Enabled="false">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfv5" ControlToValidate="ddlDesignation"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please select designation">
                                </asp:RequiredFieldValidator>

                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <label class="col-md-3 col-form-label pl-0">Mobile No.</label>
                                <div class="col-md-9 px-0  input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text country">TZ</span>
                                    </div>
                                    <asp:TextBox CssClass="form-control phone-num" type="tel" runat="server"
                                        ID="txtWork" MaxLength="20" Enabled="false"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvWork" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtWork" Display="Dynamic"
                                    ErrorMessage="Please enter phone number"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="revWork"
                                    CssClass="red_new offset-md-3" ValidationExpression="^[0-9]{1,12}$"
                                    ControlToValidate="txtWork" Display="Dynamic"
                                    ErrorMessage="Please enter valid number"> </asp:RegularExpressionValidator>

                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <label class="col-md-3 col-form-label pl-0">Email</label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmailID"
                                    Enabled="false" MaxLength="100"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfv11" ControlToValidate="txtEmailID"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please enter email address">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmailID"
                                    CssClass="red_new offset-md-3" ErrorMessage="Please enter the valid Email ID"
                                    ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                    Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Visible="false" Text="Create" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Visible="false" Text="Update" OnClick="btnUpdate_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                                Visible="false" CausesValidation="false"
                                OnClientClick="return confirmCheckIn(this,'Are you sure you want to delete?');"
                                Text="Delete" OnClick="btnDelete_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                Visible="false" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnDelete" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>