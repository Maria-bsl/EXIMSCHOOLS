<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parent_Det_SMS.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.Parent_Det_SMS" %>

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
                        <li class="breadcrumb-item">Send SMS to Parents</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Send SMS to Parents</h1>

                            <div class="row">
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-90">
                                    <label class="col-md-3 col-form-label pl-0">University/College/School</label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSchool">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvRegion"
                                        CssClass="red_new offset-md-3" ControlToValidate="ddlSchool" Display="Dynamic"
                                        ErrorMessage="Please select school"></asp:RequiredFieldValidator>
                                </div>

                               

                               

                                <div class="form-group col-12 d-flex justify-content-end">
                                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                        Text="Send SMS to Parents" OnClick="btnSubmit_Click" />
                                    
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
                                        <asp:BoundField DataField="Parent_Name" HeaderText="Parent Name"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Parent_Email_Address" HeaderText="Parent Email"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Ward_Name" HeaderText="Ward"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Parent_Mobile_No" HeaderText="Parent Mobile"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Student_Full_Name" HeaderText="Student"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                        <asp:BoundField DataField="Class_Name" HeaderText="Class"
                                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    </Columns>

                                </asp:GridView>
                            </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>