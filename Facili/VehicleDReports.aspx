<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="VehicleDReports.aspx.cs" Inherits="Schools.Facili.VehicleDReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        $(document).ready(function () {
            $('table[id*=gvDrive]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            $('table[id*=gvDrive]').prepend($("<thead></thead>").append($(this).find("tr:first")))
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
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Vehicles Details Report</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Vehicles Details Report</h1>
                            <div class="form-group d-flex justify-content-end ">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnPdf" runat="server"
                                    Text="Download PDF" OnClick="btnPdf_Click" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnExcel" runat="server"
                                    Text="Download Excel" OnClick="btnExcel_Click" />
                            </div>

                            <div class="table-responsive mb-1">
                                <asp:GridView ID="gvDrive" CssClass="table table-bordered mb-1 display" runat="server"
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
                                        <asp:BoundField DataField="Veh_Reg_No" HeaderText="Registration No/Plate No"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Veh_Model" HeaderText="Model No"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Veh_Chasis_No" HeaderText="Chasis No"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Veh_Manufuaterer" HeaderText="Manufacture"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Purchased_Date" HeaderText="Purchase Date"
                                            DataFormatString="{0:dd/M/yyyy}" ItemStyle-VerticalAlign="Top"
                                            HtmlEncode="False" />
                                        <asp:BoundField DataField="Loading_Capacity" HeaderText="Loading Capacity"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />

                                    </Columns>

                                </asp:GridView>
                            </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <%--<asp:PostBackTrigger ControlID="btnSubmit" />--%>
                <asp:PostBackTrigger ControlID="btnPdf" />
                <asp:PostBackTrigger ControlID="btnExcel" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>