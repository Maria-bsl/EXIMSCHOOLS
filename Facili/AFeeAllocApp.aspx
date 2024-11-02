<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AFeeAllocApp.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.AFeeAllocApp" %>
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
                        <li class="breadcrumb-item">Admission Fee Approval</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Admission Fee Approval</h5>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle"
                                OnRowCancelingEdit="gvDept_RowCancelingEdit" OnRowDeleting="gvDept_RowDeleting"
                                DataKeyNames="Sno" OnRowEditing="gvDept_RowEditing" OnRowUpdating="gvDept_RowUpdating"
                                HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                                OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:BoundField DataField="Facility_Name" HeaderText="Facility" />
                                    <asp:BoundField DataField="Sno" HeaderText="Sector ID" ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Class_Name" HeaderText="Class" />
                                    <asp:BoundField DataField="Acad_Year" HeaderText="Academic" />
                                    <asp:BoundField DataField="Currency_Code" HeaderText="Currency" />
                                    <asp:BoundField DataField="Fee_Type" HeaderText="Fee" />
                                    <asp:BoundField DataField="Requested_Amount" HeaderText="Amount"
                                        DataFormatString="{0:n0}" />
                                    <asp:BoundField DataField="Posted_Date" HeaderText="Upload Date"
                                        DataFormatString="{0:dd/M/yyyy}" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                    <asp:CommandField ShowEditButton="false" />
                                    <asp:CommandField ShowDeleteButton="false" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnApprove" runat="server"
                                OnClientClick="return confirm('Are you sure you want to approve?');" Visible="false"
                                Text="Approve" OnClick="btnApprove_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnReturn" runat="server"
                                OnClientClick="return confirm('Are you sure you want to return?');" Visible="false"
                                Text="Return" OnClick="btnReturn_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnApprove" />
                <asp:PostBackTrigger ControlID="btnReturn" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>