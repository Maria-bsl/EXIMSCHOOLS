<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlN.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.ControlN" %>

<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table[id*=gvDept] tr {
            cursor: pointer;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('table[id*=gvDept]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            $('table[id*=gvDept]').prepend($("<thead></thead>").append($(this).find("tr:first")))
                .DataTable({
                    "responsive": true,
                    "stateSave": true,
                    "lengthMenu": [
                        [10, 20, 30, 50, -1],
                        [10, 20, 30, 50, "All"]
                    ],
                    "sPaginationType": "full_numbers"
                });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <Triggers>
               
            </Triggers>
        </asp:UpdatePanel>

        <ContentTemplate>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                    <li class="breadcrumb-item">Student Details</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Student Details</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Control No</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtVeh"
                                MaxLength="15"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvVeh" CssClass="red_new offset-md-3"
                                ControlToValidate="txtVeh" Display="Dynamic"
                                ErrorMessage="Please enter control no"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-12 d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Text="Verify" OnClick="btnSubmit_Click" />
                            
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>

                    <div class="row" runat="server" id="divH">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">University/College/School</label>
                            <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblFac"></asp:Label>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Student</label>
                            <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblStu"></asp:Label>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Admission No</label>
                            <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblAd"></asp:Label>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Class</label>
                            <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblCla"></asp:Label>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Programme/Combination/Stream</label>
                            <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblSec"></asp:Label>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Term</label>
                            <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblTer"></asp:Label>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Fee</label>
                            <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblFee"></asp:Label>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Requested Amount</label>
                            <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblRA"></asp:Label>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Paid Amount</label>
                            <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblPA"></asp:Label>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Balance Amount</label>
                            <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblBA"></asp:Label>
                        </div>


                        </div>

                   
                </div>
            </div>

        </ContentTemplate>
    </div>
</asp:Content>