<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeeUpInd.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.FeeUpInd" %>
<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>
                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Fee Invoice Generation Individual</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">

                        <h5 class="card-title">Fee Invoice Generation Individual</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">University/College/School
                                    Name<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFaci"
                                    MaxLength="200" Enabled="false"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtFaci" Display="Dynamic"
                                    ErrorMessage="Please enter University/College/School name"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">
                                    Academic<span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                                    ErrorMessage="Please select academic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblDesig">
                                    Term<span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlTerm">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlTerm" Display="Dynamic" ErrorMessage="Please select term">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Fee<span
                                        class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFee" AutoPostBack="true" OnSelectedIndexChanged="ddlFee_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCountry"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlFee" Display="Dynamic"
                                    ErrorMessage="Please select fee">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label5">Currency<span
                                        class="red_new">*</span></asp:Label>
                                <asp:Label CssClass="col-md-9 form-control" runat="server" ID="lblCur">
                                </asp:Label>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Due Date<span
                                        class="red_new">*</span></asp:Label>
                                <div class="input-group col-md-9 px-0">
                                    <asp:TextBox CssClass="Displaytext form-control" ID="txtFDate" runat="server">
                                    </asp:TextBox>
                                    <div class="input-group-append rounded-right">
                                        <asp:ImageButton CssClass="input-group-text" runat="server"
                                            CausesValidation="false" ID="iPopup" ImageUrl="/images/calendar.png"
                                            Height="38" />
                                    </div>
                                </div>
                                <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                    TargetControlID="txtFDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                                <asp:RequiredFieldValidator runat="server" ID="rfvFDate" ControlToValidate="txtFDate"
                                    Display="Dynamic" CssClass="red_new offset-md-3"
                                    ErrorMessage="Please select due date">
                                </asp:RequiredFieldValidator>
                                <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                                    errormessage="The date must be greater than equal to today date"
                                    CssClass="red_new offset-md-3"
                                    valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                                    controltovalidate="txtFDate" type="date" Operator="GreaterThanEqual" />
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Admission
                                    No<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtADN"
                                    MaxLength="200"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtADN" Display="Dynamic"
                                    ErrorMessage="Please enter admission no"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Fee<span
                                        class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFee" MaxLength="10">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtFee" Display="Dynamic"
                                    ErrorMessage="Please enter fee"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="revWork"
                                    CssClass="red_new offset-md-3" ValidationExpression="^[0-9]{1,12}$"
                                    ControlToValidate="txtFee" Display="Dynamic" ErrorMessage="Please enter valid fee">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Upload"
                                OnClick="btnReg_Click" />&nbsp;&nbsp;
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel" CausesValidation="false" OnClick="btnCancel_Click"
                                Text="Cancel" />
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" Visible="false" CssClass="table table-bordered mb-1 display"
                                runat="server" AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                PageSize="10" OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:BoundField DataField="Admission_No" HeaderText="Admission No" />
                                    <asp:BoundField DataField="Upload_Date" HeaderText="Upload Date"
                                        DataFormatString="{0:dd/M/yyyy}" />
                                    <asp:BoundField DataField="Student_Full_Name" HeaderText="Full Name" />
                                    <asp:BoundField DataField="Term_Type" HeaderText="Term" />
                                    <asp:BoundField DataField="Fee_Type" HeaderText="Fee" />
                                    <asp:BoundField DataField="Requested_Amount" HeaderText="Amount"
                                        DataFormatString="{0:n0}" />
                                    <asp:BoundField DataField="Parent_Name" HeaderText="Parent Name" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                </Columns>
                            </asp:GridView>
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