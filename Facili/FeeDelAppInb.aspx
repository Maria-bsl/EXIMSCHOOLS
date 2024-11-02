<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeeDelAppInb.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.FeeDelAppInb" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>


        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Fee Deletion Approve Inbox</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Fee Deletion Approve Inbox</h5>

                <div class="row">
                    <div class="form-group col-sm-11 col-md-6 row mx-0 format-120">
                        <label class="col-md-3 col-form-label pl-0">Class</label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCountry" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select class">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-6 row mx-0 format-120">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Programme/Combination/Stream
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-6 row mx-0 format-120">
                        <label class="col-md-3 col-form-label pl-0">Admission No.</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAN"></asp:TextBox>

                    </div>
                </div>

                <div class="form-group d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSub" runat="server" Text="Submit"
                        OnClick="btnSub_Click" />
                </div>


                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        OnPageIndexChanging="gvDept_PageIndexChanging" HeaderStyle-CssClass="HeaderDatagrid"
                        AllowPaging="false" PageSize="50" OnRowCancelingEdit="gvDept_RowCancelingEdit"
                        OnRowDataBound="gvDept_RowDatabound" OnRowDeleting="gvDept_RowDeleting" DataKeyNames="Sno"
                        OnRowEditing="gvDept_RowEditing" OnRowUpdating="gvDept_RowUpdating">
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
                            <asp:TemplateField HeaderText="Term">
                                <ItemTemplate>
                                    <asp:Label ID="lblTerm" runat="server" Text='<%#Eval("Term_Type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fee">
                                <ItemTemplate>
                                    <asp:Label ID="lblFee" runat="server" Text='<%#Eval("Fee_Type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Invoice No">
                                <ItemTemplate>
                                    <asp:Label ID="lblInvoice" runat="server" Text='<%#Eval("Fee_Data_Sno") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Requested Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblRAmount" runat="server" Text='<%#Eval("Requested_Amount") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="txtRAmount" MaxLength="10" Width="100"
                                        Text='<%#Eval("Requested_Amount") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvRAmount" CssClass="red_new"
                                        ControlToValidate="txtRAmount" Display="Dynamic"
                                        ErrorMessage="Please enter amount"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ID="revDays" CssClass="red_new"
                                        ValidationExpression="^[0-9]{1,7}$" ControlToValidate="txtRAmount"
                                        Display="Dynamic" ErrorMessage="Please enter valid amount">
                                    </asp:RegularExpressionValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField ShowEditButton="false" />
                            <asp:CommandField ShowDeleteButton="true" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-group d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Visible="false"
                        Text="Delete" OnClick="btnSubmit_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel" Visible="false"
                        CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />

                </div>
            </div>
        </div>
    </div>
</asp:Content>