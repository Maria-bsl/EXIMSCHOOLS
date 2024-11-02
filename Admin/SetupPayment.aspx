<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetupPayment.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.SetupPayment" %>

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
                <asp:PostBackTrigger ControlID="btnApp" />
				<asp:PostBackTrigger ControlID="btnRet" />
            </Triggers>
        </asp:UpdatePanel>
        <ContentTemplate>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                    <li class="breadcrumb-item">Payment Posting</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Payment Posting</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Payment Reference</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPR"
                                MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfv4" ControlToValidate="txtPR"
                                CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please enter payment reference">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-sm-3 col-form-label pl-0">Transaction Date</label>
                                <div class="input-group col-md-9 px-0">
                                    <asp:TextBox CssClass="form-control" ID="txtFDate" runat="server">
                                    </asp:TextBox>
                                    <div class="input-group-append rounded-right">
                                        <asp:ImageButton CssClass="input-group-text" runat="server"
                                            CausesValidation="false" ID="iPopup" ImageUrl="/images/calendar.png"
                                            height="38px" />
                                    </div>
                                </div>
                                <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                    TargetControlID="txtFDate" Format="MM/dd/yyyy">
                                </ajaxToolkit:CalendarExtender><br />
                                <asp:RequiredFieldValidator runat="server" ID="rfvFDate" ControlToValidate="txtFDate"
                                    Display="Dynamic" CssClass="red_new offset-md-3"
                                    ErrorMessage="Please select from date">
                                </asp:RequiredFieldValidator>
                                <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                                    errormessage="The date must be less than or equal to today date"
                                    CssClass="red_new offset-md-3"
                                    valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                                    controltovalidate="txtFDate" type="date" Operator="LessThanEqual" />
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Transaction Channel</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtTC" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="txtTC"
                                CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please enter transaction channel">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Payment Description</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPD" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvLName" ControlToValidate="txtPD"
                                CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please enter description">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Payer ID</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPayID" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfv5" ControlToValidate="txtPayID"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please enter payer id">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Institution ID</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtIns" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtIns"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please enter instition id">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Token</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtToken" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtToken"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please enter token">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Checksum</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtCheck" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtCheck"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please enter checksum">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Amount</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAmount" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtAmount"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please enter ammount">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="red_new offset-md-3"
                                ValidationExpression="^[0-9]{1,12}$" ControlToValidate="txtAmount" Display="Dynamic"
                                ErrorMessage="Please enter valid amount"> </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Transaction Ref</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRef" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtRef"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please enter transaction no.">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Payer Name</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPN" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtPN"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please enter payer name">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Amount Type</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAT" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtAT"
                                CssClass="red_new offset-md-3" Display="Dynamic"
                                ErrorMessage="Please enter amount type">
                            </asp:RequiredFieldValidator>
                        </div>
                        

                       

                        <div class="form-group col-12 d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                                OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Text="Update" Visible="false" OnClick="btnUpdate_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnApp" OnClientClick="return confirm('Are you sure want to approve this transaction?');"
                                CausesValidation="false" Visible="false" Text="Approve" OnClick="btnApp_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnRet" OnClientClick="return confirm('Are you sure want to return this transaction?');"
                                CausesValidation="false" Visible="false" Text="Return" OnClick="btnRet_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>


                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            OnRowDataBound="InbRowDataBound" HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                            OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                            oncheckedchanged="rbDept_CheckedChanged" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="SNO" HeaderText="SNO" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fee_Data_Sno" HeaderText="Payment Reference" />
                                <asp:BoundField DataField="Receipt_No" HeaderText="Transaction Ref" />
                                <asp:BoundField DataField="Payment_Date" HeaderText="Transaction Date" />
                                <asp:BoundField DataField="PaidAmount" HeaderText="Amount" />
                                <asp:BoundField DataField="Payer_Name" HeaderText="Payer Name" />
                                <asp:BoundField DataField="Admission_No" HeaderText="Admission No" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </div>
</asp:Content>