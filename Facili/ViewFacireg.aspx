<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFacireg.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.ViewFacireg" %>
<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegistration" runat="server">
        <ContentTemplate>
            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Inbox</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Inbox</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <label class="col-sm-3 col-form-label pl-0">University/College/School Short Name<span
                                    class="red_new">*</span></label>

                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtShort" MaxLength="3"
                                Enabled="false" ToolTip="Short Name:(ex:SCH)"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvShort" CssClass="red_new offset-md-3"
                                ControlToValidate="txtShort" Display="Dynamic" ErrorMessage="Please enter short name">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"
                                CssClass="red_new offset-md-3" ValidationExpression="^[A-Za-z]+$"
                                ControlToValidate="txtShort" Display="Dynamic"
                                ErrorMessage="Please enter valid short name">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCPN">University/College/School Name
                                <span class="red_new">*</span></asp:Label>

                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFaci"
                                Visible="false" Enabled="false">
                            </asp:DropDownList>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFaci" MaxLength="200"
                                Enabled="false">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                                ControlToValidate="txtFaci" Display="Dynamic" ErrorMessage="Please enter University/College/School name">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label6">Branch Name
                                <span class="red_new">*</span></asp:Label>

                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlBranch"
                                Enabled="false">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvBranch" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlBranch" Display="Dynamic"
                                ErrorMessage="Please select branch name">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label4">Institution ID
                                <span class="red_new">*</span></asp:Label>

                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtIns" MaxLength="200"
                                Enabled="false">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvIns" CssClass="red_new offset-md-3"
                                ControlToValidate="txtIns" Display="Dynamic" ErrorMessage="Please enter institution id">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCaptcha">University/College/School
                                Registration No.
                                <span class="red_new">*</span></asp:Label>

                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRegNo" MaxLength="100"
                                Enabled="false">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4"
                                CssClass="red_new offset-md-3" ControlToValidate="txtRegNo" Display="Dynamic"
                                ErrorMessage="Please enter registration no.">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label7">Authorized
                                User Full Name<span class="red_new">*</span></asp:Label>

                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtName" MaxLength="100">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                CssClass="red_new offset-md-3" ControlToValidate="txtName" Display="Dynamic"
                                ErrorMessage="Please enter name">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblEmail">Email
                                Address<span class="red_new">*</span></asp:Label>

                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmail" MaxLength="200"
                                Enabled="false">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new offset-md-3"
                                ControlToValidate="txtEmail" Display="Dynamic"
                                ErrorMessage="Please enter email address">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" CssClass="red" runat="server"
                                ControlToValidate="txtEmail" ErrorMessage="Please enter the valid Email ID"
                                ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblPB">Country
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCountry">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblDesig">Region
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlRegion"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCity">District
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlDistrict"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblPostal">Ward
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlWard">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Address
                            </asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAdd" MaxLength="400">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label2">Website
                            </asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtWeb" MaxLength="200">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label3">Phone No.
                            </asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPhone" MaxLength="15">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblMobile">Mobile No.
                                <span class="red_new">*</span></asp:Label>
                            <div class="col-md-9 px-0  input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="my-addon"><asp:Label runat="server" ID="lblISD"></asp:Label></span>
                                </div>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtWork"
                                    MaxLength="9"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvWork" CssClass="red_new offset-md-3"
                                ControlToValidate="txtWork" Display="Dynamic" ErrorMessage="Please enter mobile no">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revWork" CssClass="red_new offset-md-3"
                                ValidationExpression="^[0-9]{9}$" ControlToValidate="txtWork" Display="Dynamic"
                                ErrorMessage="Please enter valid number">
                            </asp:RegularExpressionValidator>

                        </div>

                    </div>

                    <h6>
                        <asp:Label runat="server" ID="Label5">University/College/School Registration Account Details:
                        </asp:Label>
                    </h6>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="Gridview1" CssClass="table table-bordered mb-1 display" runat="server"
                            ShowFooter="true" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            AutoGenerateColumns="false" OnRowCreated="Gridview1_RowCreated"
                            HeaderStyle-CssClass="HeaderDatagrid">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:BoundField DataField="RowNumber" HeaderText="SNo" />
                                <asp:TemplateField HeaderText="Account No">
                                    <ItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="txtValidity" MaxLength="100"
                                            runat="server" Enabled="false">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvValidity"
                                            ControlToValidate="txtValidity" Display="Dynamic" CssClass="red_new"
                                            ErrorMessage="Please enter account no">
                                        </asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:gridview>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Approve"
                            OnClientClick="return confirmCheckIn(this,'Are you sure you want to approve?');"
                            OnClick="btnReg_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            Text="Cancel" />
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnReg" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>