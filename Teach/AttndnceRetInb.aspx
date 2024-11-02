﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Teach.Master" AutoEventWireup="true" CodeBehind="AttndnceRetInb.aspx.cs" Inherits="Schools.Teach.AttndnceRetInb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>
                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Attendence Return Inbox</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label runat="server" ID="lblInbox" CssClass="hd1">Attendence Return Inbox
                            </asp:Label>
                        </h5>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvPermit" CssClass="table table-bordered mb-1 display" runat="server"
                                EmptyDataText="No data exists." ShowHeaderWhenEmpty="true"
                                OnRowDataBound="gvPermit_RowDataBound" OnPageIndexChanging="gvPermit_PageIndexChanging"
                                AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                PageSize="10" AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Academic Year">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lnkView"
                                                Text='<%#Eval("Academic_Year")%>' OnClick="lnkView_Click">
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblID" Text='<%#Eval("Att_Mas_Sno") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Class_Name" HeaderText="Class" />
                                    <asp:BoundField DataField="Section_Name" HeaderText="Programme/Combination/Stream" />
                                    <asp:BoundField DataField="Attendance_Date" HeaderText="Attendance Date"
                                        DataFormatString="{0:dd/MM/yyyy}" />
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>