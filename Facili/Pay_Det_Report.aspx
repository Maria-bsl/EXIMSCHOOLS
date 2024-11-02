<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pay_Det_Report.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.Pay_Det_Report" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table[id$=gvDept] tr>td:nth-of-type(9) {
            text-align: right;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('table[id*=gvDept]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            var gvDeptTable = $('table[id$=gvDept]');

            if ($(gvDeptTable).length != 0) {

                var gridDeptFooter = $('[id$=lblOTZSTot]').parent().parent();

                $(gvDeptTable).prepend(
                    $("<thead></thead>").append(
                        $(this).find("tr:first")
                    )
                );

                if ($(gridDeptFooter).length != 0) {

                    $(gridDept).append(
                        $('<tfoot/>').append(
                            $(this).find($(gridDeptFooter))
                        )
                    );

                }

                $(gvDeptTable).DataTable({
                    "responsive": true,
                    "stateSave": true,
                    "lengthMenu": [
                        [10, 20, 30, 50, -1],
                        [10, 20, 30, 50, "All"]
                    ],
                    "sPaginationType": "full_numbers",

                    // Footer Callback Method
                    "footerCallback": function (row, data, start, end, display) {
                        var api = this.api(),
                            data;

                        // Remove the formatting to get integer data for summation
                        var intVal = function (i) {
                            return typeof i === 'string' ? i.replace(/[\$,]/g, '') * 1 :
                                typeof i === 'number' ? i : 0;
                        };

                        // Total over this page
                        var invoiceAmountPageTotal = api
                            .column(8, {
                                page: 'current'
                            })
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0);

                        //Note: Solve is NaN exception
                        var value_invoiceAmountPageTotal = checkIsNaN(
                                Intl.NumberFormat().format(invoiceAmountPageTotal)
                            ) === true ?
                            0 : Intl.NumberFormat().format(invoiceAmountPageTotal);

                        // Update footer
                        $('[id$=lblOTZSTot]').text(value_invoiceAmountPageTotal);

                    }
                });
            }

            var gvCopyTable = $('table[id$=gvCopy]');

            if ($(gvCopyTable).length != 0) {

                $(gvCopyTable).prepend(
                    $("<thead></thead>").append(
                        $(this).find("tr:first")
                    )
                );

                $(gvCopyTable).DataTable({
                    "responsive": true,
                    "stateSave": true,
                    "lengthMenu": [
                        [10, 20, 30, 50, -1],
                        [10, 20, 30, 50, "All"]
                    ],
                    "sPaginationType": "full_numbers"
                });

            }

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegister" runat="server">
        <ContentTemplate>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Payment Details Report</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Payment Details Report</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">University/College/School</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSchool">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlSchool" Display="Dynamic" ErrorMessage="Please select school">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Fee
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFee">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCountry" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlFee" Display="Dynamic" ErrorMessage="Please select fee">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Class</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlClass" Display="Dynamic"
                                ErrorMessage="Please select class"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Programme/Combination/Stream
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Admission No.</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAN"></asp:TextBox>

                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Reference No.
                            </asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRN"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Currency
                            </asp:Label>
                            <asp:DropDownList ID="ddlCur" runat="server"  CssClass="col-md-9 form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Date From</label>
                            <div class="input-group col-md-9 px-0">
                                <asp:TextBox CssClass="Displaytext form-control" ID="txtFDate" runat="server">
                                </asp:TextBox>
                                <div class="input-group-append rounded-right">
                                    <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                        ID="iPopup" ImageUrl="/images/calendar.png" height="38px" />
                                </div>
                            </div>
                            <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                TargetControlID="txtFDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                            <asp:RequiredFieldValidator runat="server" ID="rfvFDate" ControlToValidate="txtFDate"
                                Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select from date">
                            </asp:RequiredFieldValidator>
                            <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                                errormessage="The date must be less than equal today date"
                                CssClass="red_new offset-md-3"
                                valuetocompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFDate"
                                type="date" Operator="LessThanEqual" />
                        </div>


                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Date To</label>
                            <div class="input-group col-md-9 px-0">
                                <asp:TextBox CssClass="Displaytext form-control" ID="txtTDate" runat="server">
                                </asp:TextBox>
                                <div class="input-group-append rounded-right">
                                    <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                        ID="iPopup1" ImageUrl="/images/calendar.png" height="38px" />
                                </div>
                            </div>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="iPopup1"
                                TargetControlID="txtTDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                ControlToValidate="txtTDate" Display="Dynamic" CssClass="red_new offset-md-3"
                                ErrorMessage="Please select to date"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cmpVal" ControlToCompare="txtFDate" ControlToValidate="txtTDate"
                                Display="Dynamic" CssClass="red_new offset-md-3" Type="Date" Operator="GreaterThanEqual"
                                ErrorMessage="To Date should be greater than equal to From Date" runat="server">
                            </asp:CompareValidator>
                        </div>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="View Report"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server"
                            Text="Download PDF" OnClick="btnPdf_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnExcel" runat="server"
                            Text="Download Excel" OnClick="btnExcel_Click" />
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            HeaderStyle-CssClass="HeaderDatagrid" OnRowCreated = "OnRowCreated"
                            OnRowDataBound="gvRowDataBound" 
                            AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top"
                                    HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Class_Name" HeaderText="Class" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False" />
                                <asp:BoundField DataField="Section_Name" HeaderText="Programme/Combination/Stream"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Payment_Date" HeaderText="Date"
                                    DataFormatString="{0:dd/M/yyyy}" ItemStyle-VerticalAlign="Top" />
                                <asp:BoundField DataField="Admission_No" HeaderText="Admission No"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="" HeaderText="Student Name"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Payer_Name" HeaderText="Payer Name"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Fee_Type" HeaderText="Fee" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False" />
                                <asp:BoundField DataField="Term_Type" HeaderText="Term" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False" />
                                <asp:BoundField DataField="PaidAmount" HeaderText="Paid Amount"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                
                                <asp:BoundField DataField="Fee_Data_Sno" HeaderText="Reference No"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Trans_Channel" HeaderText="Transaction Channel"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Receipt_No" HeaderText="Receipt No"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Currency_Code" HeaderText="Currency"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False">
                                </asp:BoundField>

                            </Columns>
                            <FooterStyle HorizontalAlign="Left" />
                        </asp:GridView>
                    </div>

                   
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:PostBackTrigger ControlID="btnPdf" />
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>