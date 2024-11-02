<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultsRet.aspx.cs" MasterPageFile="~/Head_Teach.Master" Inherits="Schools.Teach.ResultsRet" %>

<%@ MasterType VirtualPath="~/Head_Teach.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav aria-label="Page breadcrumb">
        <ol class="breadcrumb mb-1 bg-white py-1 border">
            <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
            <li class="breadcrumb-item">Results Update</li>
        </ol>
    </nav>

    <div class="card">
        <div class="card-body">
            <h5 class="card-title"> <label class="hd1">Results Update</label></h5>

            <div class="row">
                <div class="form-group col-md-6 row mx-0">
                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic Year
                        <span class="red_new">*</span>
                    </asp:Label>
                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic" Enabled="false">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvAcademic" CssClass="red_new offset-md-3"
                        ControlToValidate="ddlAcademic" Display="Dynamic" ErrorMessage="Please select Academic Year">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-6 row mx-0">
                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Teacher <span
                            class="red_new">*</span></asp:Label>
                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFull" Enabled="false">

                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvFull" CssClass="red_new offset-md-3"
                        InitialValue="-1" ControlToValidate="ddlFull" Display="Dynamic"
                        ErrorMessage="Please select TeacherName">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-6 row mx-0">
                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Class<span
                            class="red_new">*</span></asp:Label>

                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCname" Enabled="false">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new offset-md-3"
                        ControlToValidate="ddlCname" Display="Dynamic" ErrorMessage="Please select Class">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-6 row mx-0">
                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Programme/Combination/Stream<span
                            class="red_new">*</span></asp:Label>

                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection" Enabled="false">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvSection" CssClass="red_new offset-md-3"
                        ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-6 row mx-0">
                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Subject<span
                            class="red_new">*</span></asp:Label>
                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSubject" Enabled="false">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvSubject" CssClass="red_new offset-md-3"
                        ControlToValidate="ddlSubject" Display="Dynamic" ErrorMessage="Please select Subject">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-6 row mx-0">
                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label5">Exam<span
                            class="red_new">*</span></asp:Label>
                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlExam" Enabled="false">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvExam" CssClass="red_new offset-md-3"
                        ControlToValidate="ddlExam" Display="Dynamic" ErrorMessage="Please select Exam">
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
                        <asp:TemplateField HeaderText="SNo" ItemStyle-Width="25%" ItemStyle-VerticalAlign="Top"
                            HeaderStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Admission_No" HeaderText="Admission No" />
                        <asp:BoundField DataField="Student_Full_Name" HeaderText="Student" />
                        <asp:TemplateField HeaderText="Marks">
                            <ItemTemplate>
                                <asp:TextBox ID="txtMarks" runat="server" MaxLength="5" Width="100px"
                                    Text='<%#Eval("Marks") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvmarks" runat="server" ControlToValidate="txtMarks"
                                    CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please Enter Marks">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="revMarks"
                                    ValidationExpression="^[0-9.]{1,5}$" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtMarks" Display="Dynamic"
                                    ErrorMessage="Please enter valid marks">
                                </asp:RegularExpressionValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remarks">
                            <ItemTemplate>
                                <asp:TextBox ID="txtRemarks" runat="server" MaxLength="100" Width="100px"
                                    Text='<%#Eval("Remarks") %>'>
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Result_Det_Sno" HeaderText="Department ID" ShowHeader="false">
                            <ItemStyle CssClass="hide" />
                            <HeaderStyle CssClass="hide" />
                        </asp:BoundField>
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
                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Update"
                    OnClientClick="return confirm('Are you sure you want to approve');" OnClick="btnSubmit_Click" />
                

            </div>
        </div>
    </div>
</asp:Content>