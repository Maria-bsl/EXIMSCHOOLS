<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notifications_Old.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Notifications_Old" %>
<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>


                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Notifications</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Notifications</h5>
                      
                        

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-190">
                                <label class="col-md-3 col-form-label pl-0">Description <span
                                        class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtDesc"
                                    TextMode="MultiLine" Rows="8" Columns="20" MaxLength="400"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtDesc" Display="Dynamic"
                                    ErrorMessage="Please enter subject"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-190">
                                <label class="col-md-3 col-form-label pl-0">Category <span
                                        class="red_new">*</span></label>
                                <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0" AutoPostBack="true"
                                RepeatDirection="Vertical" runat="server" ID="rblCat" RepeatLayout="Flow" OnSelectedIndexChanged="rblCat_SelectedIndexChanged">
                                <asp:ListItem class="asp-listItem col-form-label mr-3" Value="Internal Users" Selected="True">Internal Users</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="Teachers">Teachers </asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="Parents">Parents</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCat" CssClass="red_new offset-md-3"
                                ControlToValidate="rblCat" Display="Dynamic"
                                ErrorMessage="Please select category"></asp:RequiredFieldValidator>
                            </div>
                             <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-190">
                                <label class="col-md-3 col-form-label pl-0">Notify Group <span
                                        class="red_new">*</span></label>
                                <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0" AutoPostBack="true"
                                RepeatDirection="Vertical" runat="server" ID="rblNG" RepeatLayout="Flow" OnSelectedIndexChanged="rblNG_SelectedIndexChanged">
                                <asp:ListItem class="asp-listItem col-form-label mr-3" Value="Groups" Selected="True">Group</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="Individual">Individual</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" CssClass="red_new offset-md-3"
                                ControlToValidate="rblNG" Display="Dynamic"
                                ErrorMessage="Please select category"></asp:RequiredFieldValidator>
                            </div>
                             <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-190">
                                <label class="col-md-3 col-form-label pl-0"> <span
                                        class="red_new"></span></label>
                                <asp:ListBox CssClass="form-control" runat="server" ID="ddlGroup" SelectionMode="Multiple"></asp:ListBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvBranch" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlGroup" Display="Dynamic"
                                    ErrorMessage="Please select "></asp:RequiredFieldValidator>
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