<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetupAssign.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.SetupAssign" %>

<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <style>
                    .multicheckbox .form-group {
                        margin-bottom: .5rem;
                    }

                    @media (min-width: 48em) and (max-width: 61.99em) {
                        .col-md-auto {
                            max-width: 40%;
                        }
                    }
                </style>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                        <li class="breadcrumb-item">Access Rights</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Access Rights</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                                <label class="col-md-3 col-form-label pl-0">Designation</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlDesig"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDesig_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvDesig" CssClass="red_new"
                                    Display="Dynamic" ErrorMessage="Please select designation"
                                    ControlToValidate="ddlDesig"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md col-lg-6">
                                <h6>Menu</h6>
                                <hr class="my-1">
                                <div class="row multicheckbox pb-3">
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkAca" />
                                            <label for="<%= chkAca.ClientID %>"
                                                class="form-check-label">Academic</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkDesig" />
                                            <label for="<%= chkDesig.ClientID %>"
                                                class="form-check-label">Designation</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkReg" />
                                            <label for="<%= chkReg.ClientID %>" class="form-check-label">Region</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkDist" />
                                            <label for="<%= chkDist.ClientID %>"
                                                class="form-check-label">District</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkWard" />
                                            <label for="<%= chkWard.ClientID %>" class="form-check-label">Ward</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkMed" />
                                            <label for="<%= chkMed.ClientID %>" class="form-check-label">Medium</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkTerm" />
                                            <label for="<%= chkTerm.ClientID %>" class="form-check-label">Term</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkFee" />
                                            <label for="<%= chkFee.ClientID %>" class="form-check-label">Fee</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkUser" />
                                            <label for="<%= chkUser.ClientID %>" class="form-check-label">Create
                                                User</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkFaciReg" />
                                            <label for="<%= chkFaciReg.ClientID %>" class="form-check-label">University/College/School
                                                Registration</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSMTP" />
                                            <label for="<%= chkSMTP.ClientID %>" class="form-check-label">SMTP & SMS Configuration</label>
                                        </div>
                                    </div>
                                    <%--<div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSMS" />
                                            <label for="<%= chkSMS.ClientID %>" class="form-check-label">SMS Configuration</label>
                                        </div>
                                    </div>--%>
                                            <asp:CheckBox CssClass="form-check-input" Visible="false" runat="server" 
                                                ID="chkAR" />
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkAT" />
                                            <label for="<%= chkAT.ClientID %>" class="form-check-label">Audit
                                                Trails</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkQues" />
                                            <label for="<%= chkQues.ClientID %>"
                                                class="form-check-label">Questions</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkBlock" />
                                            <label for="<%= chkQues.ClientID %>"
                                                class="form-check-label">Block/Unblock User</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkLog" />
                                            <label for="<%= chkLog.ClientID %>" class="form-check-label">Logs</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkER" />
                                            <label for="<%= chkER.ClientID %>" class="form-check-label">Email
                                                Resend</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkAPI" />
                                            <label for="<%= chkAPI.ClientID %>" class="form-check-label">API IP</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkBranch" />
                                            <label for="<%= chkBranch.ClientID %>" class="form-check-label">Branch
                                                Name</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkMSE" />
                                            <label for="<%= chkMSE.ClientID %>" class="form-check-label">Modify University/College/School
                                                Email</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkReverse" />
                                            <label for="<%= chkReverse.ClientID %>" class="form-check-label">Fee
                                                Reversal</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkDS" />
                                            <label for="<%= chkDS.ClientID %>" class="form-check-label">Delete
                                                University/College/School</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkCSN" />
                                            <label for="<%= chkCSN.ClientID %>" class="form-check-label">Change University/College/School
                                                Name</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkRP" />
                                            <label for="<%= chkRP.ClientID %>" class="form-check-label">Reset
                                                Password</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkNot" />
                                            <label for="<%= chkNot.ClientID %>" class="form-check-label">Notifications</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkPP" />
                                            <label for="<%= chkPP.ClientID %>" class="form-check-label">Payment Posting</label>
                                        </div>
                                    </div>
                                    <%--<div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSSP" />
                                            <label for="<%= chkSSP.ClientID %>" class="form-check-label">Send SMS to Parents</label>
                                        </div>
                                    </div>--%>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkZone" />
                                            <label for="<%= chkZone.ClientID %>" class="form-check-label">Zone</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkAM" />
                                            <label for="<%= chkAM.ClientID %>" class="form-check-label">Access Modules</label>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkPack" />
                                            <label for="<%= chkPack.ClientID %>" class="form-check-label">Packages</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkPackP" />
                                            <label for="<%= chkPackP.ClientID %>" class="form-check-label">Package Price</label>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSRA" />
                                            <label for="<%= chkSRA.ClientID %>" class="form-check-label">University/College/School Registration Approval</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSMA" />
                                            <label for="<%= chkSMA.ClientID %>" class="form-check-label">University/College/School Modification Approval</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSDA" />
                                            <label for="<%= chkSDA.ClientID %>" class="form-check-label">University/College/School Deletion Approval</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSRR" />
                                            <label for="<%= chkSRR.ClientID %>" class="form-check-label">University/College/School Registration Return</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSMR" />
                                            <label for="<%= chkSMR.ClientID %>" class="form-check-label">University/College/School Modification Return</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkPA" />
                                            <label for="<%= chkPA.ClientID %>" class="form-check-label">Password Aging</label>
                                        </div>
                                    </div>
                                     <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkET" />
                                            <label for="<%= chkET.ClientID %>" class="form-check-label">Email Text</label>
                                        </div>
                                    </div>
                                     <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSST" />
                                            <label for="<%= chkSST.ClientID %>" class="form-check-label">SMS Text</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-auto col-lg-6">
                                <h6>Reports</h6>
                                <hr class="my-1">
                                <div class="row">
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_Sch_Det" />
                                            <label for="<%= chk_Sch_Det.ClientID %>" class="form-check-label">University/College/School
                                                Details Report</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_Sch_All" />
                                            <label for="<%= chk_Sch_All.ClientID %>" class="form-check-label">University/College/School Fee
                                                Allocation Report</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_Stu_Det" />
                                            <label for="<%= chk_Stu_Det.ClientID %>" class="form-check-label">Student
                                                Details Report</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_Fee_Det" />
                                            <label for="<%= chk_Fee_Det.ClientID %>" class="form-check-label">Payment
                                                Summary Report</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_Pay_Det" />
                                            <label for="<%= chk_Pay_Det.ClientID %>" class="form-check-label">Payment
                                                Details Report</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_Fee_Bal" />
                                            <label for="<%= chk_Fee_Bal.ClientID %>" class="form-check-label">Fee
                                                Balance Report</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_FBS" />
                                            <label for="<%= chk_FBS.ClientID %>" class="form-check-label">Fee
                                                Balance Summary</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" runat="server"
                                                ID="chk_FDet" />
                                            <label for="<%= chk_FDet.ClientID %>" class="form-check-label">Fee Details
                                                Report</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" runat="server"
                                                ID="chk_FDS" />
                                            <label for="<%= chk_FDS.ClientID %>" class="form-check-label">Fee Details
                                                Summary</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_BSR" />
                                            <label for="<%= chk_BSR.ClientID %>" class="form-check-label">Branch Summary
                                                Report</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSNUF" />
                                            <label for="<%= chkSNUF.ClientID %>" class="form-check-label">University/College/School Not
                                                Upload Fee</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkPI" />
                                            <label for="<%= chkPI.ClientID %>" class="form-check-label">Charges to
                                                University/College/School</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server"
                                                ID="chkUL" />
                                            <label for="<%= chkUL.ClientID %>" class="form-check-label">Users(Bank) List</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server"
                                                ID="chkUSL" />
                                            <label for="<%= chkUSL.ClientID %>" class="form-check-label">Users(Schools) List</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server"
                                                ID="chkPD" />
                                            <label for="<%= chkPD.ClientID %>" class="form-check-label">Parent Details</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server"
                                                ID="chkSL" />
                                            <label for="<%= chkSL.ClientID %>" class="form-check-label">University/College/School Logs</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-12 d-flex justify-content-end">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                    Text="Create" OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                    Text="Update" OnClick="btnUpdate_Click" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                    CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>