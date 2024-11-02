<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fee_AdjustApp.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.Fee_AdjustApp" %>

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
    <asp:UpdatePanel ID="upRegister" runat="server">
        <ContentTemplate>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Fee Adjustment Approve</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Fee Adjustment Approve</h5>

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
                            <asp:DropDownList CssClass="col-md-9 form-control" Enabled="false" runat="server" ID="ddlControl" >
                            </asp:DropDownList>
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
                        ShowFooter="False">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <HeaderStyle CssClass="HeaderDatagrid" />
                        <PagerStyle CssClass="gridViewPager" />
                        <AlternatingRowStyle CssClass="AlternateItemStyle" />
                        <Columns>
                            <asp:BoundField DataField="RowNumber" ItemStyle-VerticalAlign="Middle" HeaderText="SNo" />
                            <asp:TemplateField HeaderText="Control No">
                                <ItemTemplate>
                                    <asp:DropDownList class="form-control" ID="ddlCT" Enabled="false"
                                        runat="server" width="200px">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Balance Amount">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtRA" runat="server" class="form-control" Enabled="false"
                                        style="min-width: 100px;"></asp:TextBox>

                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Adjustment Amount">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtAJ" runat="server" class="form-control" Enabled="false"
                                        style="min-width: 200px;" MaxLength="12"></asp:TextBox>
                                
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" Visible="false" OnClick="LinkButton_Click"
                                        CausesValidation="false">Remove
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="ButtonAdd" class="btn btn-sm btn-biz_logic" runat="server"
                                        Text="Add New Row" OnClick="ButtonAdd_Click" Visible="false" CausesValidation="true" />
                                </FooterTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve" OnClientClick="return confirm('Are you sure you want to approve?');"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server" OnClientClick="return confirm('Are you sure you want to return?');"
                            Text="Return" OnClick="btnPdf_Click" />
                        
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