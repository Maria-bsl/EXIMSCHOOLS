<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CUpliftApp.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.CUpliftApp" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!--<script>
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
    </script>-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Class Uplift Approve</li>
            </ol>
        </nav>


        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Class Uplift Approve</h5>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        OnRowDataBound="OnRowDataBound" HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false"
                        OnRowCancelingEdit="gvDept_RowCancelingEdit" OnRowDeleting="gvDept_RowDeleting"
                        DataKeyNames="Sno" OnRowEditing="gvDept_RowEditing" OnRowUpdating="gvDept_RowUpdating">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <PagerStyle CssClass="gridViewPager" />
                        <Columns>
                            <asp:TemplateField HeaderText="Admission">
                                <ItemTemplate>
                                    <asp:Label ID="lblAdmin" runat="server" Text='<%#Eval("Admission_No") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Sno" HeaderText="Sector ID" ShowHeader="false">
                                <ItemStyle CssClass="hide" />
                                <HeaderStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Student Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblSName" runat="server" Text='<%#Eval("Student_Full_Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class">
                                <ItemTemplate>
                                    <asp:Label ID="lblCLA" runat="server" Text='<%#Eval("Class_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Programme/Combination/Stream">
                                <ItemTemplate>
                                    <asp:Label ID="lblSEC" runat="server" Text='<%#Eval("Section_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Academic">
                                <ItemTemplate>
                                    <asp:Label ID="lblACA" runat="server" Text='<%#Eval("Acad_Year") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Uplift Class">
                                <ItemTemplate>
                                    <asp:Label ID="lblUCLA" runat="server" Text='<%#Eval("UClass_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Uplift Programme/Combination/Stream">
                                <ItemTemplate>
                                    <asp:Label ID="lblUSEC" runat="server" Text='<%#Eval("USection_Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Uplift Academic">
                                <ItemTemplate>
                                    <asp:Label ID="lblUACA" runat="server" Text='<%#Eval("UAcad_Year") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField ShowEditButton="false" />
                            <asp:CommandField ShowDeleteButton="false" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-group d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="lnkView" runat="server"
                        OnClientClick="return confirm('Are you sure you want to approve?');" Visible="false"
                        Text="Approve" OnClick="lnkView_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="lnkView1" runat="server"
                        OnClientClick="return confirm('Are you sure you want to return?');" Visible="false"
                        Text="Return" OnClick="lnkView1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>