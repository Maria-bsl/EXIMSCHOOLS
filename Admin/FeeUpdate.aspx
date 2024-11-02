<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeeUpdate.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.FeeUpdate" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>


        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                <li class="breadcrumb-item">Fee Reversal Approval</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Fee Reversal Approval</h5>

                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-3 col-form-label pl-0">Recipt No.</label>
                        <asp:TextBox CssClass="Displaytext form-control" runat="server" ID="txtReceipt" MaxLength="50"
                             Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5"
                            ControlToValidate="txtReceipt" CssClass="red_new offset-md-3" Display="Dynamic"
                            ErrorMessage="Please enter receipt no"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-3 col-form-label pl-0">Admission No.</label>
                        <asp:TextBox CssClass="Displaytext form-control" runat="server" ID="txtAdmission" MaxLength="50"
                             Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfv4" ControlToValidate="txtAdmission"
                            CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please enter first name">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-3 col-form-label pl-0">Reference No.</label>
                        <asp:TextBox CssClass="Displaytext form-control" runat="server" ID="txtRef" MaxLength="50"
                             Enabled="false"></asp:TextBox>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-3 col-form-label pl-0">Payment Date</label>
                        <asp:TextBox CssClass="Displaytext form-control" runat="server" ID="txtRCT" MaxLength="50"
                             Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvLName" ControlToValidate="txtRCT"
                            CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please enter payment date">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-3 col-form-label pl-0">Payment Channel</label>
                        <asp:TextBox CssClass="Displaytext form-control" runat="server" ID="txtChannel" MaxLength="50"
                             Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPName" ControlToValidate="txtChannel"
                            CssClass="red_new offset-md-3" Display="Dynamic"
                            ErrorMessage="Please enter payment channel">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-3 col-form-label pl-0">Facility Name</label>
                        <asp:TextBox CssClass="Displaytext form-control" runat="server" ID="txtFacility" MaxLength="20"
                             Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                            CssClass="red_new offset-md-3" ControlToValidate="txtFacility" Display="Dynamic"
                            ErrorMessage="Please enter facility name">
                        </asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-3 col-form-label pl-0">Payer Name</label>
                        <asp:TextBox CssClass="Displaytext form-control" runat="server" ID="txtPayer" MaxLength="100"
                             Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4"
                            CssClass="red_new offset-md-3" ControlToValidate="txtPayer" Display="Dynamic"
                            ErrorMessage="Please enter payer name">
                        </asp:RequiredFieldValidator>
                    </div>


                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-3 col-form-label pl-0">Paid Amount</label>
                        <asp:TextBox CssClass="Displaytext form-control" runat="server" ID="txtPaid" MaxLength="20"
                             Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvWork" CssClass="red_new offset-md-3"
                            ControlToValidate="txtPaid" Display="Dynamic" ErrorMessage="Please enter paid amount">
                        </asp:RequiredFieldValidator>

                    </div>


                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-3 col-form-label pl-0">Modified Amount</label>
                        <asp:TextBox CssClass="Displaytext form-control" runat="server" ID="txtModified" MaxLength="100"
                             Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                            CssClass="red_new offset-md-3" ControlToValidate="txtModified" Display="Dynamic"
                            ErrorMessage="Please enter modified amount"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="revTo" CssClass="red_new offset-md-3"
                            ValidationExpression="^[0-9]{1,12}$" ControlToValidate="txtModified" Display="Dynamic"
                            ErrorMessage="Please enter valid amount"> </asp:RegularExpressionValidator>
                    </div>


                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-3 col-form-label pl-0">Remarks</label>
                        <asp:TextBox CssClass="Displaytext form-control" runat="server" ID="txtRem" TextMode="MultiLine"
                            MaxLength="400" Columns="80" Rows="5" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                            CssClass="red_new offset-md-3" ControlToValidate="txtRem" Display="Dynamic"
                            ErrorMessage="Please enter Remarks">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-12 d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnUpdate" runat="server" Text="Approve"
                            OnClientClick="return confirm('Are you sure you want to approve?')"
                            OnClick="btnUpdate_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            OnClientClick="return confirm('Are you sure you want to return?')" CausesValidation="false"
                            Text="Return" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>