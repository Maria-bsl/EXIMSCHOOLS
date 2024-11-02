<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllocUpd.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.AllocUpd" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table[id*=gvDept] tr {
            cursor: pointer;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Allocation Updation</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Allocation Updation</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Fee<span
                                        class="red_new">*</span></asp:Label>

                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFee" Enabled="false"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlFee_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCountry"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlFee" Display="Dynamic"
                                    ErrorMessage="Please select fee">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Payment
                                    Type<span class="red_new">*</span></asp:Label>

                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAmount" >
                                    <asp:ListItem class="asp-listItem col-form-label" Value="">Select Payment Type
                                    </asp:ListItem>
                                    <asp:ListItem class="asp-listItem col-form-label" Value="FIXED">FIXED</asp:ListItem>
                                    <asp:ListItem class="asp-listItem col-form-label" Value="FLEXIBLE">FLEXIBLE
                                    </asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlAmount" Display="Dynamic"
                                    ErrorMessage="Please select payment type"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Fee Account
                                    No<span class="red_new">*</span></asp:Label>

                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFANO" >
                                </asp:DropDownList>
                                <asp:TextBox runat="server" Visible="false" ID="txtFANA" MaxLength="200" CssClass="col-md-9 form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlFANO" Display="Dynamic"
                                    ErrorMessage="Please select account no"></asp:RequiredFieldValidator>
                                
                                
                            </div>
                        </div>
                        <div class="table-responsive mb-1">
                        <asp:GridView ID="gvComments"
                            Style="border-width: 0px; border-style: None; width: 100%; border-collapse: collapse;" runat="server" AutoGenerateColumns="false" Width="100%"
                            EmptyDataText="No comments exists" GridLines="None" AllowPaging="true" PageSize="10" OnPageIndexChanging="gvComments_PageIndexChanging"
                            ShowHeader="false">
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Commentd On" ItemStyle-VerticalAlign="Top" ItemStyle-Width="60px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCD" runat="server">
                                            <br />Commented By:<br />Commented
                                            Date:<br />Comment:<br />
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Commented By"
                                    ItemStyle-VerticalAlign="Top"
                                    ItemStyle-Width="200px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCB" runat="server"><br />
                                             <%# Eval("UserName") %><br />
                                                <%# Eval("C_Date") %><br />
                                                    <%# Eval("Comment") %><br />
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Add Comments <span
                                class="red"></span></label>
                        <asp:TextBox CssClass="form-control" runat="server"
                            TextMode="MultiLine" Rows="5" Columns="30" ID="txtComments">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvComments"
                            CssClass="red_new offset-md-3" ControlToValidate="txtComments" Display="Dynamic"
                            ErrorMessage="Please enter comments">
                        </asp:RequiredFieldValidator>
                    </div>
                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Update"
                              OnClientClick="return confirm('Are you sure you want to update?');"  OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Visible="false"
                              OnClientClick="return confirm('Are you sure you want to return?');"  Text="Return" OnClick="btnUpdate_Click"  />
                            

                        </div>

                        
                    </div>
                </div>
          
    </div>
</asp:Content>