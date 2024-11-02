<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Info.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.View_Info" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Edit Student Details Approve</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><label class="hd1 mb-0">Edit Student Details Approve</label></h5>
                <div id="dMain" class="row" runat="server" visible="false">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Admission No</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRegion" Enabled="false"
                            MaxLength="50">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">
                            First Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFullName" Enabled="false"
                            MaxLength="50">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">
                            Middle Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtMName" Enabled="false"
                            MaxLength="50">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">
                            Last Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtLName" Enabled="false"
                            MaxLength="50">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">
                            Parent Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPName" Enabled="false"
                            MaxLength="50">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">
                            Mobile No.</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtWork" MaxLength="20"
                            Enabled="false" ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Email</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmailID" MaxLength="100"
                            Enabled="false">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label2">Class</asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass" Enabled="false"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvClass" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select class">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCity">Programme/Combination/Stream
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection"
                            Enabled="false">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label11">Gender<span class="red_new"></span></asp:Label>
                        <asp:RadioButtonList
                            CssClass="col form-check form-check-inline mx-0" Enabled="false"
                            RepeatDirection="Horizontal" runat="server" ID="rblGender" RepeatLayout="Flow">
                            <asp:ListItem  class="asp-listItem col-form-label mr-3" Value="m">Male</asp:ListItem>
                            <asp:ListItem class="asp-listItem col-form-label" Value="f">Female
                            </asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="form-group col-12 d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnUpdate" runat="server" Visible="false"
                            CausesValidation="false" Text="Approve" OnClick="btnUpdate_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            Visible="false" CausesValidation="false" Text="Return" OnClick="btnCancel_Click" />
                    </div>
                </div>
                <div id="dvSecond" class="row" runat="server" visible="false">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Admission No</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRegion1" Enabled="false"
                            MaxLength="50">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">First Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFullName1" MaxLength="50">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfv4" ValidationGroup="second"
                            ControlToValidate="txtFullName1" CssClass="red_new offset-md-3" Display="Dynamic"
                            ErrorMessage="Please enter first name"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Middle Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtMName1" MaxLength="50">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Last Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtLName1" MaxLength="50">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvLName" ValidationGroup="second"
                            ControlToValidate="txtLName1" CssClass="red_new offset-md-3" Display="Dynamic"
                            ErrorMessage="Please enter last name">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Parent Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPName1" MaxLength="50">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPName" ValidationGroup="second"
                            ControlToValidate="txtPName1" CssClass="red_new offset-md-3" Display="Dynamic"
                            ErrorMessage="Please enter parent name">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Mobile No.</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtWork1" MaxLength="20"
                            ToolTip="Mobile No:(ex:784777777)">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvWork" ValidationGroup="second"
                            CssClass="red_new offset-md-3" ControlToValidate="txtWork1" Display="Dynamic"
                            ErrorMessage="Please enter phone number">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="revWork" ValidationGroup="second"
                            CssClass="red_new offset-md-3" ValidationExpression="^[0-9]{1,12}$" ControlToValidate="txtWork1"
                            Display="Dynamic" ErrorMessage="Please enter valid number">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Email</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmailID1" MaxLength="100">
                        </asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" ValidationGroup="second"
                            ControlToValidate="txtEmailID1" CssClass="red_new offset-md-3"
                            ErrorMessage="Please enter the valid Email ID"
                            ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label3">Class</asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass1"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlClass1_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlClass1" Display="Dynamic" ErrorMessage="Please select class">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Section
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection1">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlSection1" Display="Dynamic" ErrorMessage="Please select section">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Gender<span class="red_new"></span></asp:Label>
                            <asp:RadioButtonList
                                CssClass="col form-check form-check-inline mx-0"
                                RepeatDirection="Horizontal" runat="server" ID="rblGender1" RepeatLayout="Flow">
                                <asp:ListItem  class="asp-listItem col-form-label mr-3" Value="m">Male</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="f">Female
                                </asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" CssClass="red_new offset-md-3"
                                ControlToValidate="rblGender1" Display="Dynamic"
                                ErrorMessage="Please select sector status"></asp:RequiredFieldValidator>
                        </div>
                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="Button1" runat="server" Text="Update"
                            ValidationGroup="second" OnClick="btnUpdate1_Click" />
                    </div>
                </div>
            </div>
        </div>


</asp:Content>