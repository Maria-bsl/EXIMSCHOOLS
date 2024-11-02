<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fee_Adjustment.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.Fee_Adjustment" %>

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
        function Comma(Num) { //function to add commas to textboxes
            Num += '';
            Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
            Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
            x = Num.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1))
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            return x1 + x2;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegister" runat="server">
        <ContentTemplate>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Fee Adjustment</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Fee Adjustment</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">University/College/School</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSchool">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlSchool" Display="Dynamic" ErrorMessage="Please select school">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblDesig">Control No.
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlControl" AutoPostBack="true" OnSelectedIndexChanged="ddlControl_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlControl" Display="Dynamic"
                                ErrorMessage="Please select control no">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Student Name</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtSN" Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Admission No</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAN" Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Class</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtCla" Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Programme/Combination/Stream</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtSec" Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Term</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtTer" Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Fee</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFee" Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Requested Amount</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtReq" Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Paid Amount</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPaid" Enabled="false">
                            </asp:TextBox>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Additional Amount</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAA" Enabled="false">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        OnRowCreated="gvDept_RowCreated" AutoGenerateColumns="False" Width="100%"
                        AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                        ShowFooter="True">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <HeaderStyle CssClass="HeaderDatagrid" />
                        <PagerStyle CssClass="gridViewPager" />
                        <AlternatingRowStyle CssClass="AlternateItemStyle" />
                        <Columns>
                            <asp:BoundField DataField="RowNumber" ItemStyle-VerticalAlign="Middle" HeaderText="SNo" />
                            <asp:TemplateField HeaderText="Control No">
                                <ItemTemplate>
                                    <asp:DropDownList class="form-control" ID="ddlCT"
                                        OnSelectedIndexChanged="ddlCT_SelectedIndexChanged" runat="server"
                                        AutoPostBack="true" width="200px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvehtype" runat="server" 
                                        ControlToValidate="ddlCT" Display="Dynamic" CssClass="red_new"
                                        ErrorMessage="Please select control no">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Balance Amount">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtRA" runat="server" class="form-control" Enabled="false"
                                        style="min-width: 100px;"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="rfvPolicy" runat="server"
                                        ControlToValidate="txtRA" CssClass="red_new" Display="Dynamic"
                                        ErrorMessage="Please enter requested amount">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblF" class="form-control" runat="server">Total:</asp:Label>
                                </FooterTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Adjustment Amount">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtAJ" runat="server" class="form-control" onkeyup="javascript:this.value=Comma(this.value);" OnTextChanged="txtAJ_TextChanged" AutoPostBack="true"
                                        style="min-width: 200px;" MaxLength="12"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvrmrk" runat="server"
                                        ControlToValidate="txtAJ" CssClass="red_new" Display="Dynamic"
                                        ErrorMessage="Please enter adjustment amount">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ID="revWork" CssClass="red_new"
                                ValidationExpression="^[0-9,]{1,12}$" ControlToValidate="txtAJ" Display="Dynamic"
                                ErrorMessage="Please enter valid amount"> </asp:RegularExpressionValidator>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblFamt" class="form-control" runat="server"></asp:Label>
                                </FooterTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton_Click"
                                        CausesValidation="false">Remove
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="ButtonAdd" class="btn btn-sm btn-biz_logic" runat="server"
                                        Text="Add New Row" OnClick="ButtonAdd_Click" CausesValidation="true" />
                                </FooterTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Submit"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server"
                            Text="Update" OnClick="btnPdf_Click" />
                        
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept1" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%"
                            AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                            PageSize="10" OnPageIndexChanging="gvDept1_PageIndexChanging" AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                            oncheckedchanged="rbDept_CheckedChanged" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Pay_Ext_Adj_Mas_Sno" HeaderText="Module ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fee_Data_Sno" HeaderText="Control No"  />
                                <asp:BoundField DataField="Pay_Adj_Date" HeaderText="Adjustment Date" DataFormatString="{0:dd/M/yyyy}" />
                                <asp:BoundField DataField="Class_Name" HeaderText="Class" />
                                <asp:BoundField DataField="Section_Name" HeaderText="Programme/Combination/Stream" />
                                <asp:BoundField DataField="Acad_Year" HeaderText="Academic" />
                                <asp:BoundField DataField="Additional_Amount" HeaderText="Additional Amount" DataFormatString="{0:N0}" />
                            </Columns>
                        </asp:GridView>

                    </div>
                    
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:PostBackTrigger ControlID="btnPdf" />
            
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>