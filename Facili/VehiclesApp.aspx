<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="VehiclesApp.aspx.cs" Inherits="Schools.Facili.VehiclesApp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Vehicles Approval</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1 mb-0">Vehicles Approval</label></h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">Registration No/Plate No
                                    <span class="red_new">*</span>
                                </label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" Enabled="false" ID="txtReg"
                                    MaxLength="50">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvReg" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtReg" Display="Dynamic"
                                    ErrorMessage="Please enter Registration No">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">Model<span class="red_new">*</span>
                                </label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtModel"
                                    Enabled="false" MaxLength="100">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvModel" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtModel" Display="Dynamic" ErrorMessage="Please enter Model">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">Chasis No<span class="red_new">*</span>
                                </label>

                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtChasis" runat="server"
                                    Enabled="false" MaxLength="100">
                                </asp:TextBox>

                                <asp:RequiredFieldValidator runat="server" ID="rfvChasis" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtChasis" Display="Dynamic"
                                    ErrorMessage="Please enter Chasis No"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">Manufacturer</label>

                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtMnfctr" runat="server"
                                    Enabled="false" MaxLength="100">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvMnfctr" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtMnfctr" Display="Dynamic"
                                    ErrorMessage="Please enter Manufacturer"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">Purchased Date<span class="red_new">*</span>
                                </label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtDate" runat="server"
                                    Format="dd/MM/yyyy" Enabled="false" ></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvDate" ControlToValidate="txtDate"
                                    Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select  Date">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">Loading Capacity<span
                                        class="red_new">*</span>
                                </label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtload" runat="server"
                                    MaxLength="100" Enabled="false">
                                </asp:TextBox>
                                <small class="form-text text-muted offset-md-3">The capacity should be in
                                    Kilograms</small>
                                <asp:RequiredFieldValidator runat="server" ID="rfvload" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtload" Display="Dynamic"
                                    ErrorMessage="Please enter Loading Capacity">
                                </asp:RequiredFieldValidator>

                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-sm-3 col-form-label pl-0">No. of Passengers<span
                                        class="red_new">*</span>
                                </label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtPass" runat="server" MaxLength="20"
                                    Enabled="false">
                                </asp:TextBox>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-auto col-form-label pl-0">Status<span class="red_new">*</span>
                                </label>

                                <asp:RadioButtonList CssClass="col asp-radioButtonList" RepeatDirection="Horizontal"
                                    runat="server" Enabled="false" ID="rblStatus">
                                    <asp:ListItem class="pt-0 mr-3" Value="Active" Selected="True">Active</asp:ListItem>
                                    <asp:ListItem class="pt-0" Value="InActive">InActive</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvStatus" ControlToValidate="rblStatus"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please select  Status">
                                </asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                ShowFooter="True">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sno">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:BoundField  DataField="Sno" HeaderText="Sno"  />--%>
                                    <asp:BoundField DataField="Veh_Dailry_Type" HeaderText="Vehicle Diary Type" />
                                    <asp:BoundField DataField="Start_Date" DataFormatString="{0:d}"
                                        HeaderText="Start Date" />
                                    <asp:BoundField DataField="Expiry_Date" DataFormatString="{0:d}"
                                        HeaderText="End Date" />
                                    <asp:BoundField DataField="Policy_No" HeaderText="Policy No" />
                                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve"
                                OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>