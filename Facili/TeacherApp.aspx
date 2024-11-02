<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="TeacherApp.aspx.cs" Inherits="Schools.Facili.TeacherApp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>


        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Teachers</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><label class="hd1 mb-0">Teachers</label></h5>

                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                        <label class="col-sm-3 col-form-label pl-0">IDNo</label>
                        <span class="red_new">*</span>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" Enabled="false" ID="txtRegion"
                            MaxLength="100">
                        </asp:TextBox> <br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvDept" CssClass="red_new offset-md-3"
                            ControlToValidate="txtRegion" Display="Dynamic" ErrorMessage="Please enter ID">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                        <label class="col-auto col-form-label pl-0">Gender</label>
                        <span class="red_new">*</span>
                        <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0"
                            RepeatDirection="Horizontal" Enabled="false" runat="server" ID="rblGender"
                            RepeatLayout="Flow">
                            <asp:ListItem class="asp-listItem col-form-label mr-3" Value="M" Selected="True">Male
                            </asp:ListItem>
                            <asp:ListItem class="asp-listItem col-form-label" Value="F">Female</asp:ListItem>
                        </asp:RadioButtonList><br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvGender" CssClass="red_new offset-md-3"
                            ControlToValidate="rblGender" Display="Dynamic" ErrorMessage="Please enter Gender">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                        <label class="col-sm-3 col-form-label pl-0">FirstName</label>
                        <span class="red_new">*</span>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtFirst" runat="server" Enabled="false"
                            MaxLength="100">
                        </asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvFirst" CssClass="red_new offset-md-3"
                            ControlToValidate="txtFirst" Display="Dynamic" ErrorMessage="Please enter FirstName">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                        <label class="col-sm-3 col-form-label pl-0">MiddleName</label>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtMiddle" Enabled="false" runat="server"
                            MaxLength="50">
                        </asp:TextBox>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                        <label class="col-sm-3 col-form-label pl-0">LastName</label>
                        <span class="red_new">*</span>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtLast" runat="server" Enabled="false"
                            MaxLength="100">
                        </asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvLast" CssClass="red_new offset-md-3"
                            ControlToValidate="txtLast" Display="Dynamic" ErrorMessage="Please enter LastName">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                        <label class="col-sm-3 col-form-label pl-0">UserName</label>
                        <span class="red_new">*</span>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtUser" runat="server" Enabled="false"
                            MaxLength="100">
                        </asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvUser" CssClass="red_new offset-md-3"
                            ControlToValidate="txtUser" Display="Dynamic" ErrorMessage="Please enter UserName">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                        <label class="col-sm-3 col-form-label pl-0">Email</label>
                        <span class="red_new">*</span>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtEmail" runat="server" Enabled="false"
                            MaxLength="200">
                        </asp:TextBox><br />
                        <asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Not valid email " CssClass="red_new offset-md-3"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new offset-md-3"
                            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter Email">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                        <label class="col-sm-3 col-form-label pl-0">PhoneNumber</label>
                        <span class="red_new">*</span>
                        <div class="input-group-prepend">
                                    <span class="input-group-text" id="my-addon"><asp:Label runat="server" ID="lblISD"></asp:Label></span></div>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtPhone" runat="server" MaxLength="9"
                            Enabled="false">
                        </asp:TextBox><br />
                        <asp:RegularExpressionValidator ID="rePhone" runat="server" ControlToValidate="txtPhone"
                            Display="Dynamic" ErrorMessage="Not valid PhoneNumber " CssClass="red_new offset-md-3"
                            ValidationExpression="[0-9]{9}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPhone" CssClass="red_new offset-md-3"
                            ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Please enter PhoneNumber">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                        <label class="col-auto col-form-label pl-0">Status:</label>
                        <span class="red_new">*</span>
                        <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0"
                            RepeatDirection="Horizontal" runat="server" Enabled="false" ID="rblStatus"
                            RepeatLayout="Flow">
                            <asp:ListItem class="asp-listItem col-form-label mr-3" Value="Active" Selected="True">Active
                            </asp:ListItem>
                            <asp:ListItem class="asp-listItem col-form-label" Value="InActive">InActive</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvStatus" ControlToValidate="rblStatus"
                            CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please select  Status">
                        </asp:RequiredFieldValidator>
                    </div>

                </div>


                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" ShowFooter="True">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <HeaderStyle CssClass="HeaderDatagrid" />
                        <PagerStyle CssClass="gridViewPager" />
                        <AlternatingRowStyle CssClass="AlternateItemStyle" />
                        <Columns>
                            <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top"
                                HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Class_Name" HeaderText="Class Name" />
                            <asp:BoundField DataField="Section_Name" HeaderText="Programme/Combination/Stream Name" />
                            <asp:BoundField DataField="Subject_Name" HeaderText="Subject" />


                        </Columns>
                    </asp:GridView>
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
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve" OnClientClick="return confirm('Are you sure you want to approve?');"
                      CausesValidation="false"  OnClick="btnSubmit_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Text="Return"
                         OnClientClick="return confirm('Are you sure you want to return?');"   OnClick="btnUpdate_Click"  />
                </div>
            </div>
        </div>
    </div>
</asp:Content>