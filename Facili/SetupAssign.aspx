<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetupAssign.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.SetupAssign" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
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
                                <label class="col-md-3 col-form-label pl-0">User Types</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlDesig"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDesig_SelectedIndexChanged">
                                    <asp:ListItem Cssclass="asp-listItem col-form-label" Value="">Select User Type
                                </asp:ListItem>
                                <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Super">Manager
                                </asp:ListItem>
                                <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Dummy">Data Entry
                                </asp:ListItem>
                                <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Academic">Academic Master
                                </asp:ListItem>
                                    <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Secretary">Secretary
                                </asp:ListItem>
                                    <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Transporte">Transporter
                                </asp:ListItem>
                                    <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Librarian">Librarian
                                </asp:ListItem>
                                    <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Teacher">Teacher
                                </asp:ListItem>
                                    <asp:ListItem Cssclass="asp-listItem col-form-label" Value="C Teacher">Class Teacher
                                </asp:ListItem>
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
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkClass" />
                                            <label for="<%= chkClass.ClientID %>"
                                                class="form-check-label">Class</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkStream" />
                                            <label for="<%= chkStream.ClientID %>"
                                                class="form-check-label">Stream/Combination</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkAlloc" />
                                            <label for="<%= chkAlloc.ClientID %>" class="form-check-label">Allocation</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkUC" />
                                            <label for="<%= chkUC.ClientID %>"
                                                class="form-check-label">User Creation</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkHolid" />
                                            <label for="<%= chkHolid.ClientID %>" class="form-check-label">Holidays</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkEvent" />
                                            <label for="<%= chkEvent.ClientID %>" class="form-check-label">Events</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkSub" />
                                            <label for="<%= chkSub.ClientID %>" class="form-check-label">Subjects</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkScore" />
                                            <label for="<%= chkScore.ClientID %>" class="form-check-label">Score Grade</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkExam" />
                                            <label for="<%= chkExam.ClientID %>" class="form-check-label">Exams</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkTeach" />
                                            <label for="<%= chkTeach.ClientID %>" class="form-check-label">Teachers</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkPT" />
                                            <label for="<%= chkPT.ClientID %>" class="form-check-label">Period Timings</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkAR" />
                                            <label for="<%= chkAR.ClientID %>" class="form-check-label">Access Rights</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkVUS" />
                                            <label for="<%= chkVUS.ClientID %>" class="form-check-label">View/Update School Info</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkTT" />
                                            <label for="<%= chkTT.ClientID %>" class="form-check-label">Time Table</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkRes" />
                                            <label for="<%= chkRes.ClientID %>"
                                                class="form-check-label">Results</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkAtten" />
                                            <label for="<%= chkAtten.ClientID %>"
                                                class="form-check-label">Attendance</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkBlock" />
                                            <label for="<%= chkBlock.ClientID %>" class="form-check-label">Block/UnBlock User</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkRUC" />
                                            <label for="<%= chkRUC.ClientID %>" class="form-check-label">Resend User Credentials</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkRP" />
                                            <label for="<%= chkRP.ClientID %>" class="form-check-label">Reset Password</label>
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
                                                ID="chkSTU" />
                                            <label for="<%= chkSTU.ClientID %>" class="form-check-label">Student Details Upload</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSDI" />
                                            <label for="<%= chkSDI.ClientID %>" class="form-check-label">Student Details Individual</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkESD" />
                                            <label for="<%= chkESD.ClientID %>" class="form-check-label">Edit Student Details</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkCU" />
                                            <label for="<%= chkCU.ClientID %>" class="form-check-label">Class Uplift</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSD" />
                                            <label for="<%= chkSD.ClientID %>" class="form-check-label">Students Deletion</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkFS" />
                                            <label for="<%= chkFS.ClientID %>" class="form-check-label">Fee Structure</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkFIG" />
                                            <label for="<%= chkFIG.ClientID %>" class="form-check-label">Fee Invoice Generation</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" Visible="false"
                                                ID="chkFII" />
                                            <%--<label for="<%= chkFII.ClientID %>" class="form-check-label">Fee Invoice Individual</label>--%>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkFA" />
                                            <label for="<%= chkFA.ClientID %>" class="form-check-label">Fee Adjustment</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkAF" />
                                            <label for="<%= chkAF.ClientID %>" class="form-check-label">Admission Fee</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkPrI" />
                                            <label for="<%= chkPrI.ClientID %>" class="form-check-label">Print/Send Invoice</label>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkPR" />
                                            <label for="<%= chkPR.ClientID %>" class="form-check-label">Print/Send Receipt</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkFD" />
                                            <label for="<%= chkFD.ClientID %>" class="form-check-label">Fee Deletion</label>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkSDL" />
                                            <label for="<%= chkSDL.ClientID %>" class="form-check-label">School Data Logs</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkTran" />
                                            <label for="<%= chkTran.ClientID %>" class="form-check-label">Transport</label>
                                        </div>
                                    </div>
                               
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkLib" />
                                            <label for="<%= chkLib.ClientID %>" class="form-check-label">Library</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkAT" />
                                            <label for="<%= chkAT.ClientID %>" class="form-check-label">Audit Trail</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-auto col-lg-6">
                                <h6>Approval</h6>
                                <hr class="my-1">
                                <div class="row">
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_STUA" />
                                            <label for="<%= chk_STUA.ClientID %>" class="form-check-label">Student</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_STUR" />
                                            <label for="<%= chk_STUR.ClientID %>" class="form-check-label">Student Return</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_CUA" />
                                            <label for="<%= chk_CUA.ClientID %>" class="form-check-label">Class Uplift</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_CUR" />
                                            <label for="<%= chk_CUR.ClientID %>" class="form-check-label">Class Uplift Return</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_FEEA" />
                                            <label for="<%= chk_FEEA.ClientID %>" class="form-check-label">Fee</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_STUDA" />
                                            <label for="<%= chk_STUDA.ClientID %>" class="form-check-label">Student Deletion</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_FEEDA" />
                                            <label for="<%= chk_FEEDA.ClientID %>" class="form-check-label">Fee Deletion</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_FEESA" />
                                            <label for="<%= chk_FEESA.ClientID %>" class="form-check-label">Fee Sturcture</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_FEESR" />
                                            <label for="<%= chk_FEESR.ClientID %>" class="form-check-label">Fee Structure Return</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_FEEAA" />
                                            <label for="<%= chk_FEEAA.ClientID %>" class="form-check-label">Fee Adjustment</label>
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
                                                ID="chk_SDR" />
                                            <label for="<%= chk_SDR.ClientID %>" class="form-check-label">Student Details</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_FDR" />
                                            <label for="<%= chk_FDR.ClientID %>" class="form-check-label">Fee Details</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkFDS" />
                                            <label for="<%= chkFDS.ClientID %>" class="form-check-label">Fee Details Summary</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_PDR" />
                                            <label for="<%= chk_PDR.ClientID %>" class="form-check-label">Payment Details</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_FBR" />
                                            <label for="<%= chk_FBR.ClientID %>" class="form-check-label">Fee Balance</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chkFBS" />
                                            <label for="<%= chkFBS.ClientID %>" class="form-check-label">Fee Balance Summary</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_RWSR" />
                                            <label for="<%= chk_RWSR.ClientID %>" class="form-check-label">Results With Subjects</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_RR" />
                                            <label for="<%= chk_RR.ClientID %>" class="form-check-label">Results</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_TTR" />
                                            <label for="<%= chk_TTR.ClientID %>" class="form-check-label">Time Table</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_AR" />
                                            <label for="<%= chk_AR.ClientID %>" class="form-check-label">Attendance</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_TR" />
                                            <label for="<%= chk_TR.ClientID %>" class="form-check-label">Teachers</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_TTTR" />
                                            <label for="<%= chk_TTTR.ClientID %>" class="form-check-label">Teacher Time Table</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server"
                                                ID="chk_SWR" />
                                            <label for="<%= chk_SWR.ClientID %>" class="form-check-label">Student wise Results</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server"
                                                ID="chk_SCWR" />
                                            <label for="<%= chk_SCWR.ClientID %>" class="form-check-label">School wise Results</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server"
                                                ID="chk_PD" />
                                            <label for="<%= chk_PD.ClientID %>" class="form-check-label">Parent Details</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server"
                                                ID="chk_HR" />
                                            <label for="<%= chk_HR.ClientID %>" class="form-check-label">Holidays</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server"
                                                ID="chk_ER" />
                                            <label for="<%= chk_ER.ClientID %>" class="form-check-label">Events</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_CSDR" />
                                            <label for="<%= chk_CSDR.ClientID %>" class="form-check-label">Consolidate Student Details</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_CFDR" />
                                            <label for="<%= chk_CFDR.ClientID %>" class="form-check-label">Consolidate Fee Details</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_CPDR" />
                                            <label for="<%= chk_CPDR.ClientID %>" class="form-check-label">Consolidate Payment Details</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_CFBR" />
                                            <label for="<%= chk_CFBR.ClientID %>" class="form-check-label">Consolidate Fee Balance</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox CssClass="form-check-input" runat="server" 
                                                ID="chk_CFBRA" />
                                            <label for="<%= chk_CFBRA.ClientID %>" class="form-check-label">Consolidate Fee Balance with Academic</label>
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