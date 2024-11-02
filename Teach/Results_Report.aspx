<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Results_Report.aspx.cs" MasterPageFile="~/Head_Teach.Master" Inherits="Schools.Teach.Results_Report" %>

<%@ MasterType VirtualPath="~/Head_Teach.master" %>
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
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>
                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Results Report</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1">Results Report</label></h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-8 col-lg-6 row mx-0">
                                <asp:Label CssClass="col-sm-4 col-form-label pl-0" runat="server" ID="Label1">Academic
                                    Year
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-sm-8 form-control" runat="server" ID="ddlAcademic">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAcad" CssClass="red_new offset-sm-4"
                                    ControlToValidate="ddlAcademic" Display="Dynamic" ErrorMessage="Please select Year">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-8 col-lg-6 row mx-0">
                                <asp:Label CssClass="col-sm-4 col-lg-2 col-form-label pl-0" runat="server" ID="Label2">
                                    Class
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-sm-8 form-control" runat="server" ID="ddlClass">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCname"
                                    CssClass="red_new offset-sm-4 offset-lg-2" ControlToValidate="ddlClass"
                                    Display="Dynamic" ErrorMessage="Please select Class">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-8 col-lg-6 row mx-0">
                                <asp:Label CssClass="col-sm-4 col-form-label pl-0" runat="server" ID="Label3">Programme/Combination/Stream
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-sm-8 form-control" runat="server" ID="ddlSection">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvSection"
                                    CssClass="red_new offset-sm-4" ControlToValidate="ddlSection" Display="Dynamic"
                                    ErrorMessage="Please select Programme/Combination/Stream"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-8 col-lg-6 row mx-0">
                                <asp:Label CssClass="col-sm-4 col-lg-2 col-form-label pl-0" runat="server" ID="Label4">
                                    Exam
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-sm-8 form-control" runat="server" ID="ddlExam">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    CssClass="red_new offset-sm-4 offset-lg-2" ControlToValidate="ddlExam"
                                    Display="Dynamic" ErrorMessage="Please select Exam"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Text="View Report" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server"
                                Text="Download PDF" OnClick="btnPdf_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnExcel" runat="server"
                                Text="Download Excel" OnClick="btnExcel_Click" />
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
                                    <asp:BoundField DataField="Admission_No" ItemStyle-Width="2%"
                                        HeaderText="Admission No" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Student_Full_Name" HeaderText="Student Name"
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="" ItemStyle-Width="2%" HeaderText="Total Marks"
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="" ItemStyle-Width="2%" HeaderText="Avg Grade"
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="" ItemStyle-Width="2%" HeaderText="Result"
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                </Columns>

                            </asp:GridView>
                            <!-- </div>-->
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