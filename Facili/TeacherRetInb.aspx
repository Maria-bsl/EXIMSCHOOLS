﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="TeacherRetInb.aspx.cs" Inherits="Schools.Facili.TeacherRetInb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        $(document).ready(function () {
            $('table[id*=gvPermit]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            $('table[id*=gvPermit]').prepend($("<thead></thead>").append($(this).find("tr:first")))
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
                        <li class="breadcrumb-item">Teacher Return Inbox</li>
                    </ol>
                </nav>
    
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Teacher Return Inbox</h5>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvPermit" CssClass="table table-bordered mb-1 display"
                            runat="server" EmptyDataText="No data exists." ShowHeaderWhenEmpty="true"
                             OnRowDataBound="InbRowDataBound"
                             OnPageIndexChanging="gvPermit_PageIndexChanging" AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Teacher Name">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lnkView" Text='<%#Eval("Teacher_Id_No")%>' OnClick="lnkView_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblID" Text='<%#Eval("Tea_Mas_Sno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Teacher_First_Name" HeaderText="Teacher First Name" />
                                <asp:BoundField DataField="Teacher_Middle_Name" HeaderText="Teacher Middle Name" />
                                <asp:BoundField DataField="Teacher_Last_Name" HeaderText="Teacher Last Name" />
                                
                                <asp:BoundField DataField="Teacher_Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="Email" HeaderText="Email Id" />
                                
                            </Columns>
                        </asp:GridView>

                            </div>
    </div>
    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>