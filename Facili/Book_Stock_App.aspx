<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="Book_Stock_App.aspx.cs" Inherits="Schools.Facili.Book_Stock_App" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table[id*=gvDept] th {
            white-space: nowrap;
        }
    </style>
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
        <asp:UpdatePanel ID="update" runat="server">
        </asp:UpdatePanel>

        <ContentTemplate>
            <script type="text/javascript">
                function showProgress() {
                    if (Page_ClientValidate()) {
                        var updateProgress = $get("<%= upProgress.ClientID %>");
                        updateProgress.style.display = "block";
                    }
                }
            </script>
            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Books Returning</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><label class="hd1 mb-0">Books Returning</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic
                                Year</asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAcademic"
                                Enabled="false"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Full Name
                            </asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtlFull" Enabled="false">
                            </asp:TextBox>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Free Days
                            </asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtfree" Enabled="false">
                            </asp:TextBox>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Location
                            </asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtloc" Enabled="false">
                            </asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <tr id="cll" runat="server" visible="false">
                            <td style="width: 25%;">
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label31">
                                        Class</asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtclas"
                                        Enabled="false"></asp:TextBox>
                                </div>
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">
                                        Section</asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtsec"
                                        Enabled="false"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                    </div>

                    <hr>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" Visible="false" CssClass="table table-bordered mb-1 display"
                            runat="server" AutoGenerateColumns="false" Width="100%"
                            AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="false"
                            HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" EmptyDataText="No records Found"
                            OnRowDataBound="gvDept_RowDataBound" OnPageIndexChanging="gvDept_PageIndexChanging"
                            AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top"
                                    HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsno" runat="server" CssClass="hide"
                                            Text='<%#Eval("Book_Iss_Det_Sno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--   <asp:BoundField DataField="Book_Iss_Det_Sno" HeaderText="Author" ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>--%>
                                <asp:BoundField DataField="Acad_Year" HeaderText="Academic Year"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Admission_NO" HeaderText="Admission NO"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Student_Full_Name" HeaderText="Student Name"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Subject" HeaderText="Subject" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Book_Title" HeaderText="Book Title"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Author" HeaderText="Author" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Qty" HeaderText="Quantity" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False">
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Book Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstat" runat="server" Text='<%#Eval("B_Status") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--      <asp:BoundField DataField="B_Status" HeaderText="Book Status" ItemStyle-VerticalAlign="Top" HtmlEncode="False"></asp:BoundField>--%>
                                <asp:BoundField DataField="Issued_Date" HeaderText="Taken Date"
                                    DataFormatString="{0:dd/M/yyyy}" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="showProgress();"
                                            Text="Return Book" OnClick="LinkButton1_Click" Width="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="GridView1" Visible="false" CssClass="table table-bordered mb-1 display"
                            runat="server" AutoGenerateColumns="false" Width="100%"
                            AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="true"
                            EmptyDataText="No records Found." HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                            AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top"
                                    HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="lblsno" runat="server" CssClass="hide"
                                            Text='<%#Eval("Book_Iss_Tea_Det_Sno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Acad_Year" HeaderText="Academic Year"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Teacher_Full_Name" HeaderText="Teacher Name"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:BoundField DataField="Subject" HeaderText="Subject" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Book_Title" HeaderText="Book Title"
                                    ItemStyle-VerticalAlign="Top" HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Author" HeaderText="Author" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Qty" HeaderText="Quantity" ItemStyle-VerticalAlign="Top"
                                    HtmlEncode="False">
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Book Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("B_Status") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="Issued_Date" HeaderText="Taken Date"
                                    DataFormatString="{0:dd/M/yyyy}" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton" runat="server" OnClientClick="showProgress();"
                                            Text="Return Book" OnClick="LinkButton_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>


                    <div class="form-group d-flex justify-content-end">
                        <asp:Button class="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Visible="false"
                            Text="Book Return" OnClick="btnSubmit_Click" />
                        <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnSubmit1" runat="server" Visible="false"
                            Text="Book Return" OnClick="btnSubmit1_Click" />
                        <asp:Button class="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />
                    </div>


                </div>
            </div>

        </ContentTemplate>
        <%-- <Triggers>
         <asp:PostBackTrigger ControlID="btnSubmit" />
        <asp:PostBackTrigger ControlID="btnPdf" />
        <asp:PostBackTrigger ControlID="btnExcel" />
    </Triggers>--%>
        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="update">
            <ProgressTemplate>
                <div
                    style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                    <span
                        style="border-width: 0px; position: fixed; padding: 20px; background-color: #FFFFFF; font-size: 30px; left: 40%; top: 40%; border-radius: 50px;">
                        <img alt="progress" src="/Images/loader1.gif" />Loading ...</span>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>