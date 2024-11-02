<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events_Report.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Events_Report" %>

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
                    "columnDefs": [{
                        "targets": 1,
                        "type": "date-eu"
                    }, {
                        "targets": 2,
                        "type": "date-eu"
                    }],
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
      

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Events Report</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Events Report</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <label class="col-md-3 col-form-label pl-0">From Date <span
                                    class="red_new">*</span></label>
                            <div class="input-group col-md-9 px-0">
                                <asp:TextBox CssClass="Displaytext form-control" ID="txtDate" runat="server">
                                </asp:TextBox>
                                <div class="input-group-append rounded-right">
                                    <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                        ID="iPopup" ImageUrl="/images/calendar.png" height="38px" />
                                </div>
                            </div>
                            <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                TargetControlID="txtDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                            <asp:RequiredFieldValidator runat="server" ID="rfvDate" ControlToValidate="txtDate"
                                Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select  Start Date">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <label class="col-md-3 col-form-label pl-0">To Date<span class="red_new">*</span></label>
                            <div class="input-group col-md-9 px-0">
                                <asp:TextBox CssClass="Displaytext form-control" ID="txtTDate" runat="server">
                                </asp:TextBox>
                                <div class="input-group-append rounded-right">
                                    <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                        ID="iPopup1" ImageUrl="/images/calendar.png" height="38px" />
                                </div>
                            </div>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="iPopup1"
                                TargetControlID="txtTDate" Format="MM/dd/yyyy">
                            </ajaxToolkit:CalendarExtender><br />
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                ControlToValidate="txtTDate" Display="Dynamic" CssClass="red_new offset-md-3"
                                ErrorMessage="Please select end date"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cmpVal" ControlToCompare="txtDate" ControlToValidate="txtTDate"
                                Display="Dynamic" CssClass="red_new offset-md-3" Type="Date" Operator="GreaterThanEqual"
                                ErrorMessage="To Date should be greater than or equal to From Date" runat="server">
                            </asp:CompareValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <label class="col-md-3 col-form-label pl-0">Academic Year <span
                                    class="red_new">*</span></label>

                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcad">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvAcad" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlAcad" Display="Dynamic" ErrorMessage="Please select Academic Year">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">

                        <label class="col-md-3 col-form-label pl-0">Class<span class="red_new"></span></label>
                        <asp:DropDownList CssClass="form-control col-md-9" runat="server" ID="ddlClass">
                        </asp:DropDownList>

                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">

                        <label class="col-md-3 col-form-label pl-0">Programme/Combination/Stream<span class="red_new"></span></label>
                        <asp:DropDownList CssClass="form-control col-md-9" runat="server" ID="ddlSection" Width="190">
                        </asp:DropDownList>

                    </div>
                    </div>
                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="View Report"
                        OnClick="btnSubmit_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server" Text="Download PDF"
                        OnClick="btnPdf_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnExcel" runat="server"
                        Text="Download Excel" OnClick="btnExcel_Click" />

                    </div>
                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" OnRowDataBound="gvDept_RowDataBound"
                            OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top"
                                HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="Event_Date" HeaderText="Event Date" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Event_Off_Date" HeaderText="Event Off Date" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Event_Time" HeaderText="Event Time" />
                            <asp:BoundField DataField="Event_Subject" HeaderText="Event Subject" />
                            <asp:BoundField DataField="Event_Location" HeaderText="Event Location" />
                            <asp:BoundField DataField="Acad_Year" HeaderText="Academic Year" />
                            <asp:BoundField DataField="Class_Name" HeaderText="Class" />
                            <asp:BoundField DataField="Section_Name" HeaderText="Programme/Combination/Stream" />
                                
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        
    </div>
</asp:Content>