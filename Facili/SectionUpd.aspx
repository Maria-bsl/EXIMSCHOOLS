<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SectionUpd.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.SectionUpd" %>

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
        <asp:UpdatePanel ID="upRegister" runat="server">
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>

        <ContentTemplate>
            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Programme/Combination/Stream Update</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Programme/Combination/Stream Update</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-md-3 col-form-label pl-0">Programme/Combination/Stream:</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRegion" MaxLength="100">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDept" CssClass="red_new offset-md-3"
                                ControlToValidate="txtRegion" Display="Dynamic" ErrorMessage="Please enter Programme/Combination/Stream">
                            </asp:RequiredFieldValidator>

                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-85">
                            <label class="col-auto col-form-label pl-0">Status:</label>
                            <asp:RadioButtonList RepeatLayout="Flow" CssClass="col form-check form-check-inline mx-0 "
                                RepeatDirection="Horizontal" runat="server" ID="rblStatus" >
                                <asp:ListItem class="asp-listItem col-form-label mr-3" Value="Active" Selected="True">
                                    Active</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="InActive">InActive
                                </asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                ControlToValidate="rblStatus" Display="Dynamic"
                                ErrorMessage="Please select sector status"></asp:RequiredFieldValidator>

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
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Text="Return" Visible="false"
                            OnClick="btnUpdate_Click"  />
                        


                    </div>


                   
                </div>
            </div>
        </ContentTemplate>

    </div>
</asp:Content>