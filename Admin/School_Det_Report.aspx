<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="School_Det_Report.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.School_Det_Report" %>

<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <ContentTemplate>



                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                        <li class="breadcrumb-item">Registered University/College/School Report</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Registered University/College/School Report</h1>

                            <div class="row">
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-90">
                                   <label class="col-md-3 col-form-label pl-0">Zone</label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlZone" AutoPostBack="true" OnSelectedIndexChanged="ddlZone_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                        CssClass="red_new offset-md-3" ControlToValidate="ddlZone" Display="Dynamic"
                                        ErrorMessage="Please select zone"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-90">
                                    <label class="col-md-3 col-form-label pl-0">University/College/School</label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSchool">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvRegion"
                                        CssClass="red_new offset-md-3" ControlToValidate="ddlSchool" Display="Dynamic"
                                        ErrorMessage="Please select school"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-90">
                                    <label class="col-md-3 col-form-label pl-0">Date From</label>
                                    <div class="input-group col-md-9 px-0">
                                        <asp:TextBox CssClass="Displaytext form-control" ID="txtFDate" runat="server">
                                        </asp:TextBox>
                                        <div class="input-group-append rounded-right">
                                            <asp:ImageButton class="input-group-text" runat="server"
                                                CausesValidation="false" ID="iPopup" ImageUrl="/images/calendar.png"
                                                Height="38" />
                                        </div>
                                    </div>
                                    <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                        TargetControlID="txtFDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                    <br />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvFDate"
                                        ControlToValidate="txtFDate" Display="Dynamic" CssClass="red_new offset-md-3"
                                        ErrorMessage="Please select from date"></asp:RequiredFieldValidator>
                                    <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                                        errormessage="The date must be less than or equal to today date"
                                        CssClass="red_new offset-md-3"
                                        valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                                        controltovalidate="txtFDate" type="date" Operator="LessThanEqual" />
                                </div>

                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-90">
                                    <label class="col-md-3 col-form-label pl-0">Date To</label>
                                    <div class="input-group col-md-9 px-0">
                                        <asp:TextBox CssClass="Displaytext form-control" ID="txtTDate" runat="server">
                                        </asp:TextBox>
                                        <div class="input-group-append rounded-right">
                                            <asp:ImageButton class="input-group-text" runat="server"
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
                                        ErrorMessage="To Date should be greater than or equal to From Date"
                                        runat="server"></asp:CompareValidator>
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
                                    AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="false"
                                    HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" OnRowDataBound="gvRowDataBound"
                                    OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                    <PagerStyle CssClass="gridViewPager" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%"
                                            ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Facility_Name" HeaderText="University/College/School"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Region_Name" HeaderText="Region"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="District_Name" HeaderText="District"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Ward_Name" HeaderText="Ward"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Bank_Name" HeaderText="Branch"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Mobile_No" HeaderText="Phone No."
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Email_Address" HeaderText="Email"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Bank_Swift_Code" HeaderText="Institution ID"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>
                                        <asp:BoundField DataField="Status" HeaderText="Status"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>
                                        <asp:BoundField DataField="Status" HeaderText="No. of Students Approved"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>
                                        <asp:BoundField DataField="Create_Date" HeaderText="Created Date"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False"
                                            DataFormatString="{0:dd/M/yyyy}"></asp:BoundField>
                                    </Columns>

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