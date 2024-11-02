<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="B_With_Std_Tech_Report.aspx.cs" Inherits="Schools.Facili.B_With_Std_Tech_Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegister" runat="server">
        <ContentTemplate>


            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Books With Student/Teacher Report</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><label class="hd1 mb-0">Books With Student/Teacher Report</label></h5>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="View Report"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnPdf" runat="server" Text="Download PDF"
                            OnClick="btnPdf_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnExcel" runat="server"
                            Text="Download Excel" OnClick="btnExcel_Click" />
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            ShowFooter="true" HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                            OnRowDataBound="gvDept_RowDataBound" OnPageIndexChanging="gvDept_PageIndexChanging"
                            AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>


                                <asp:TemplateField HeaderText="LibraryFromLocation">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lnkView" Text='<%#Eval("Lib_Loc_Id")%>'
                                            OnClick="lnkView_Click">
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblID" Text='<%#Eval("Lib_Loc_Sno") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="BookTranSno">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblbrmsno" Text='<%#Eval("Book_Rec_Mas_Sno") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top"
                                    HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Teacher_Name" HeaderText="Teacher Name"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />

                                <asp:BoundField DataField="Book_Title" HeaderText="Book Title"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Subject" HeaderText="Subject" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Author" HeaderText="Author" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Location_From" HeaderText="Location From"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Taken_Date" HeaderText="Taken Date"
                                    DataFormatString="{0:dd/M/yyyy}" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Days_Consumed" HeaderText="Days Consumed"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />



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
</asp:Content>