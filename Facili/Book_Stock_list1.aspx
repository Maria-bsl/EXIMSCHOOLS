<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="Book_Stock_list1.aspx.cs" Inherits="Schools.Facili.Book_Stock_list1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <style type="text/css">
            table.gvDept {
                border-collapse: collapse;
                border: solid 2px black;
            }

            table.gvDept td,
            th {
                border: solid 1px black;
            }
        </style>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>
                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Books With Teacher And
                            Student</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <asp:TextBox ID="txtsm" runat="server" Visible="false"></asp:TextBox>
                        <h5 class="card-title">
                            <label class="hd1">Books With Teacher And Student</label>
                        </h5>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display"
                                OnDataBound="gvDept_DataBound" runat="server" AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="true"
                                GridLines="Horizontal" HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                                OnRowDataBound="gvDept_RowDataBound" OnPageIndexChanging="gvDept_PageIndexChanging"
                                AllowPaging="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Teacher/Student">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblFee" runat="server" Text='<%#Eval("Teacher_Name") %>'
                                                OnClick="lblFee_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Book_Iss_Tea_Mas_Sno" HeaderText="Sno"
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Section" HeaderText="Section"
                                        ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Location_From" HeaderText="Location From"
                                        ItemStyle-HorizontalAlign="Center" HtmlEncode="False">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Taken_Date" HeaderText="Taken Date"
                                        DataFormatString="{0:dd/M/yyyy}" ItemStyle-VerticalAlign="Middle"
                                        ItemStyle-HorizontalAlign="Center" HtmlEncode="False" />


                                    <asp:TemplateField ShowHeader="false" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsno" runat="server" CssClass="hide"
                                                Text='<%#Eval("Book_Iss_Tea_Mas_Sno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="false" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsno" runat="server" CssClass="hide"
                                                Text='<%#Eval("Section") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <%-- <Triggers>
         <asp:PostBackTrigger ControlID="btnSubmit" />
        <asp:PostBackTrigger ControlID="btnPdf" />
        <asp:PostBackTrigger ControlID="btnExcel" />
    </Triggers>--%>
        </asp:UpdatePanel>
    </div>
</asp:Content>