<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersListS.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="Schools.Admin.UsersListS" %>

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
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Users(University/College/School) List</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1 mb-0">Users(University/College/School) List</label></h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                   <label class="col-md-3 col-form-label pl-0">Zone</label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlZone" AutoPostBack="true" OnSelectedIndexChanged="ddlZone_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                        CssClass="red_new offset-md-3" ControlToValidate="ddlZone" Display="Dynamic"
                                        ErrorMessage="Please select zone"></asp:RequiredFieldValidator>
                                </div>
                            
                            <div runat="server" id="dSch" visible="true" class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <label class="col-md-3 col-form-label pl-0">Schools
                                    
                                </label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSchools" >
                                </asp:DropDownList>
                            </div>
                            <div runat="server" id="Div1" visible="true" class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                            <label class="col-md-3 col-form-label pl-0">Status</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlStatus">
                                <asp:ListItem Value="">Select Status</asp:ListItem>
                                <asp:ListItem Value="Active">Active</asp:ListItem>
                                <asp:ListItem Value="InActive">InActive</asp:ListItem>
                                <asp:ListItem Value="Blocked">Blocked</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvSector" CssClass="red_new offset-md-3"
                                Display="Dynamic" ControlToValidate="ddlStatus" ErrorMessage="Please select status">
                            </asp:RequiredFieldValidator>
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
                                <asp:BoundField DataField="Facility_Name" HeaderText="University/College/School" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Status" HeaderText="Role" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Email_Address" HeaderText="Username" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Mobile_No" HeaderText="Mobile No." ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Log_Status" HeaderText="Progress" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="AuditBy" HeaderText="Last Modified" ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>
                                <asp:BoundField DataField="Facility_Reg_Sno" HeaderText="ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                            </Columns>

                        </asp:GridView>
                             
                    </div>
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