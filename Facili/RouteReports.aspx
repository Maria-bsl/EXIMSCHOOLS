﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="RouteReports.aspx.cs" Inherits="Schools.Facili.RouteReports" %>
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
                        <li class="breadcrumb-item">Route Details Report</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Route Details Report</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-7 row mx-0 format-100">
                                <label class="col-md-3 col-form-label pl-0">RouteName</label>
                                <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlroutename" runat="server"
                                    >
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group d-flex justify-content-end ">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Text="View Report" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server"
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
                                    <asp:BoundField DataField="RouteName" HeaderText="Route"
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="AreaName" HeaderText="Area" ItemStyle-VerticalAlign="Top"
                                        HtmlEncode="False" />


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