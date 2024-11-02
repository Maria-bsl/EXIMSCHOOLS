<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteFaci.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.DeleteFaci" %>
<%@ MasterType VirtualPath="~/Head_Admin.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>
                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                        <li class="breadcrumb-item">Delete University/College/School Info</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Delete University/College/School Info</h5>
                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-8 row mx-0 format-120">
                                <label class="col-md-3 col-form-label pl-0">University/College/School Names</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSCH"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlSCH_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvSCH" CssClass="red_new"
                                    ControlToValidate="ddlSCH" Display="Dynamic" ErrorMessage="Please select school">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div id="dMain" runat="server" visible="false">
                            <hr>
                            <div class="row">

                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <label class="col-md-3 col-form-label pl-0">University/College/School Short Name</label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtShort"
                                        MaxLength="3" Enabled="false" ToolTip="Short Name:(ex:SCH)">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblCompany">
                                        University/College/School Name<span class="red_new">*</span>
                                    </asp:Label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" Visible="false"
                                        ID="ddlFaci">
                                    </asp:DropDownList>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFaci"
                                        MaxLength="200" Enabled="false">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Branch
                                        Name<span class="red_new">*</span>
                                    </asp:Label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlBranch">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">
                                        Institution ID<span class="red_new">*</span>
                                    </asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtIns"
                                        MaxLength="200">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblCaptcha">
                                        University/College/School Reg. No.
                                        <span class="red_new">*</span>
                                    </asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRegNo"
                                        MaxLength="100">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label7">
                                        Authorized User
                                        <span class="red_new">*</span>
                                    </asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtName"
                                        MaxLength="100">
                                    </asp:TextBox>
                                    <small class="form-text text-muted offset-md-3">(Enter Full Name)</small>

                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblEmail">
                                        Email Address
                                        <span class="red_new">*</span>
                                    </asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmail"
                                        MaxLength="200">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Country
                                    </asp:Label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCountry">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblDesig">
                                        Region</asp:Label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlRegion"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblCity">
                                        District</asp:Label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlDistrict"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblPostal">
                                        Ward</asp:Label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlWard">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">
                                        Address</asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAdd"
                                        MaxLength="400">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">
                                        Website</asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtWeb"
                                        MaxLength="200">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Phone
                                        No.</asp:Label>
                                    <div class="col-md-9 px-0  input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text country">TZ</span>
                                        </div>
                                        <asp:TextBox CssClass="form-control phone_num" runat="server" ID="txtPhone"
                                            MaxLength="200"></asp:TextBox>
                                    </div>
                                    <span class="small helper-text offset-md-3">Start with +255 </span>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblMobile">
                                        Mobile No.
                                        <span class="red_new">*</span>
                                    </asp:Label>
                                    <div class="col-md-9 px-0  input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text country1">TZ</span>
                                        </div>
                                        <asp:TextBox CssClass="form-control phone_num1" type="tel" runat="server" ID="txtWork"
                                            MaxLength="20" ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                                    </div>
                                    <span class="small helper-text offset-md-3">Start with +255 </span>
                                </div>
                            </div>
                            <hr>
                            <div class="row tables-columns">
                                <div class="col-lg-6">
                                    <div class="table-responsive mb-1">
                                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display"
                                            runat="server" AutoGenerateColumns="false" Width="100%"
                                            AlternatingRowStyle-CssClass="AlternateItemStyle"
                                            HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" AllowPaging="false">
                                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                            <PagerStyle CssClass="gridViewPager" />
                                            <Columns>
                                                <asp:BoundField DataField="Bank_Acc_No" HeaderText="Account No." />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="table-responsive mb-1">
                                        <table class="table table-bordered mb-1 display">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        Students Count
                                                    </th>
                                                    <th>
                                                        Fee Upload Count
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:Label runat="server" ID="lblSC"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server" ID="lblUC"></asp:Label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>



                            <div class="form-group d-flex justify-content-end">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Delete"
                                    OnClientClick="return confirm('Are you sure you want to delete the school?');"
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