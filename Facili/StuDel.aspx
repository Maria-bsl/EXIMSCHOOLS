<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StuDel.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.StuDel" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Students Deletion</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><label class="hd1 mb-0">Students Deletion</label></h5>

                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCPN">University/College/School Name
                            <span class="red_new">*</span></asp:Label>

                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFaci" MaxLength="200"
                            Enabled="false">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                            ControlToValidate="txtFaci" Display="Dynamic" ErrorMessage="Please enter University/College/School name">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblPB">Class<span
                                class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCountry" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select class">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCity">Programme/Combination/Stream
                            <span class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                        </asp:RequiredFieldValidator>
                    </div>

                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false"
                        OnRowCancelingEdit="gvDept_RowCancelingEdit" OnRowDeleting="gvDept_RowDeleting"
                        DataKeyNames="Sno" OnRowEditing="gvDept_RowEditing" OnRowUpdating="gvDept_RowUpdating">
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
                            <asp:TemplateField HeaderText="Admission Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblADate" runat="server"
                                        Text='<%#Eval("Admission_Date","{0:dd/M/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Roll No">
                                <ItemTemplate>
                                    <asp:Label ID="lblRNo" runat="server" Text='<%#Eval("Roll_No") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class">
                                <ItemTemplate>
                                    <asp:Label ID="lblCLA" runat="server" Text='<%#Eval("Class_Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Programme/Combination/Stream">
                                <ItemTemplate>
                                    <asp:Label ID="lblSEC" runat="server" Text='<%#Eval("Section_Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblFName" runat="server" Text='<%#Eval("Student_Frist_Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFName"
                                        MaxLength="100" Width="100" Text='<%#Eval("Student_Frist_Name") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvFName" CssClass="red_new"
                                        ControlToValidate="txtFName" Display="Dynamic"
                                        ErrorMessage="Please enter first name">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Middle Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblMName" runat="server" Text='<%#Eval("Student_Middle_Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtMName"
                                        MaxLength="100" Width="100" Text='<%#Eval("Student_Middle_Name") %>'>
                                    </asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblLName" runat="server" Text='<%#Eval("Student_Last_Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtLName"
                                        MaxLength="100" Width="100" Text='<%#Eval("Student_Last_Name") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvLName" CssClass="red_new"
                                        ControlToValidate="txtLName" Display="Dynamic"
                                        ErrorMessage="Please enter last name">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Parent Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblPName" runat="server" Text='<%#Eval("Parent_Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPName"
                                        MaxLength="100" Width="100" Text='<%#Eval("Parent_Name") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvPName" CssClass="red_new"
                                        ControlToValidate="txtPName" Display="Dynamic"
                                        ErrorMessage="Please enter parent name">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile">
                                <ItemTemplate>
                                    <asp:Label ID="lblMobile" runat="server" Text='<%#Eval("Parent_Mobile_No") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="col-md-9 px-0  input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text country">TZ</span>
                                        </div>
                                        <asp:TextBox CssClass="form-control phone-num" type="tel" runat="server"
                                            ID="txtMobile" MaxLength="100" Width="100"
                                            Text='<%#Eval("Parent_Mobile_No") %>'></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvMobile" CssClass="red_new"
                                        ControlToValidate="txtMobile" Display="Dynamic"
                                        ErrorMessage="Please enter mobile no">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Parent_Email_Address") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmail"
                                        MaxLength="100" Width="100" Text='<%#Eval("Parent_Email_Address") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new"
                                        ControlToValidate="txtEmail" Display="Dynamic"
                                        ErrorMessage="Please enter parent name">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revEmail" CssClass="red_new" runat="server"
                                        ControlToValidate="txtEmail" ErrorMessage="Please enter the valid Email ID"
                                        ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                        Display="Dynamic"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="false" />
                            <asp:CommandField ShowDeleteButton="true" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-group d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Visible="false"
                        Text="Approve" OnClick="btnSubmit_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel" Visible="false"
                        CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete All" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>

    </div>
</asp:Content>