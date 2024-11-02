<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayInvoice_Report.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.PayInvoice_Report" %>

<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table[id$=gvDept] tr>td:nth-of-type(3) {
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

            var gvDeptTable = $('table[id*=gvDept]');

            if ($(gvDeptTable).length != 0) {

                var gvDeptFooter = $('[id$=lblOUSDTot]').parent().parent();

                $(gvDeptTable).prepend(
                    $('<thead/>').append(
                        $(this).find("tr:first")
                    )
                );

                if ($(gvDeptFooter).length != 0) {

                    $(gvDeptTable).append(
                        $('<tfoot/>').append(
                            $(this).find($(gvDeptFooter))
                        )
                    );

                }

                $(gvDeptTable).DataTable({
                    "responsive": true,
                    "stateSave": true,
                    "stateDuration": 60 * 3,
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
                            .column(2, {
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
                        $('[id$=lblOUSDTot]').text(value_invoiceAmountPageTotal);
                    }
                });



            }

            var gvCopyTable = $('table[id*=gvCopy]');

            if ($(gvCopyTable).length != 0) {

                $(gvCopyTable).prepend(
                    $("<thead></thead>").append(
                        $(this).find("tr:first")
                    )
                );

                $(gvCopyTable).DataTable({
                    "responsive": true,
                    "stateSave": true,
                    "stateDuration": 60 * 3,
                    "lengthMenu": [
                        [10, 20, 30, 50, -1],
                        [10, 20, 30, 50, "All"]
                    ],
                    "sPaginationType": "full_numbers"
                });
            }

        });

        function checkIsNaN(params) {
            params = String(params);
            return Number.isNaN(Number(params.replace(/,/g, "")));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>


                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                        <li class="breadcrumb-item">Charges to University/College/School</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Charges to University/College/School</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-90">
                                <label class="col-md-3 col-form-label pl-0">Zone</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlZone" AutoPostBack="true" OnSelectedIndexChanged="ddlZone_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlZone" Display="Dynamic"
                                    ErrorMessage="Please select zone"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                                <label class="col-md-3 col-form-label pl-0">Facility</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFacility">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlFacility" Display="Dynamic"
                                    ErrorMessage="Please select facility"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-90">
                                <label class="col-md-3 col-form-label pl-0">Date From</label>
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
                                    ErrorMessage="Please select from date">
                                </asp:RequiredFieldValidator>
                                <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                                    errormessage="The date must be less than equal today date"
                                    CssClass="red_new offset-md-3"
                                    valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                                    controltovalidate="txtFDate" type="date" Operator="LessThanEqual" />
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                                <label class="col-md-3 col-form-label pl-0">Date To</label>
                                <div class="input-group col-md-9 px-0">
                                    <asp:TextBox CssClass="Displaytext form-control" ID="txtTDate" runat="server">
                                    </asp:TextBox>
                                    <div class="input-group-append rounded-right">
                                        <asp:ImageButton CssClass="input-group-text" runat="server"
                                            CausesValidation="false" ID="iPopup1" ImageUrl="/images/calendar.png"
                                            Height="38" />
                                    </div>
                                </div>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                    PopupButtonID="iPopup1" TargetControlID="txtTDate" Format="MM/dd/yyyy">
                                </ajaxToolkit:CalendarExtender><br />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    ControlToValidate="txtTDate" Display="Dynamic" CssClass="red_new offset-md-3"
                                    ErrorMessage="Please select to date"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cmpVal" ControlToCompare="txtFDate"
                                    ControlToValidate="txtTDate" Display="Dynamic" CssClass="red_new offset-md-3"
                                    Type="Date" Operator="GreaterThanEqual"
                                    ErrorMessage="To Date should be greater than equal to From Date" runat="server">
                                </asp:CompareValidator>
                            </div>

                            <div class="form-group col-12 d-flex justify-content-end">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                    Text="View Report" OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server"
                                    Text="Download PDF" OnClick="btnPdf_Click" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnExcel" runat="server"
                                    Text="Download Excel" OnClick="btnExcel_Click" />
                            </div>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="true"
                                HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" OnRowDataBound="gvRowDataBound"
                                OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SNo" ItemStyle-Width="1%"
                                        ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Facility_Name" HeaderText="Facility"
                                        ItemStyle-Width="35%" ItemStyle-VerticalAlign="Top" HtmlEncode="False">
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="No. of Transactions" ItemStyle-Width="25%"
                                        HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblOUSD" Text=''></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                        <FooterTemplate>
                                            <asp:Label ID="lblOUSDTot" runat="server"></asp:Label><br />
                                            <asp:Label ID="lblOUSDTot1" runat="server"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle HorizontalAlign="Left" />
                            </asp:GridView>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvCopy" Visible="false" CssClass="table table-bordered mb-1 display"
                                runat="server" AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="true"
                                HeaderStyle-CssClass="HeaderDatagrid" OnRowDataBound="gvCopyRowDataBound"
                                OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SNo" ItemStyle-Width="25%"
                                        ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Facility_Name" HeaderText="Facility"
                                        ItemStyle-Width="25%" ItemStyle-VerticalAlign="Top" HtmlEncode="False">
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="No. of Transactions" ItemStyle-Width="25%"
                                        HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblOUSD1"></asp:Label><br />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
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
    </div>
</asp:Content>