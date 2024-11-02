<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.master" CodeBehind="MobileReg.aspx.cs" Inherits="Schools.Mobile.MobileReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .px-10px {
            padding-left: 10px;
            padding-right: 10px;
        }

        @media (min-width: 62em) {
            .label-140 {
                width: 140px;
            }
        }

        .app-toggle,
        #sidebar {
            display: none !important;
        }

        .card-sized {
            max-width: 1080px;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="app-main d-flex flex-column pl-0">
        <div class="main-area">
            <div class="card card-sized mx-auto">
                <div class="card-body px-10px">
                    <h5 class="card-title">Parent - Registration</h5>
                    <div class="row mx-0">
                        <div class="form-group col-md-6 row mx-0 px-1">
                            <asp:Label class="col-lg-auto col-form-label label-140 pl-0" runat="server" ID="lblCompany">
                                Parent Name<span class="text-danger">*</span>
                            </asp:Label>
                            <asp:TextBox CssClass="form-control col" runat="server" ID="txtPName">
                            </asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new"
                                                ControlToValidate="txtPName" Display="Dynamic"
                                                ErrorMessage="Please enter name"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group col-md-6 row mx-0 px-1">
                            <asp:Label class="col-lg-auto col-form-label label-140 pl-0" runat="server" ID="lblEmail">
                                Email Address<span class="text-danger">*</span>
                            </asp:Label>
                            <asp:TextBox CssClass="form-control col" runat="server" ID="txtEmail">
                            </asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new"
                                                ControlToValidate="txtEmail" Display="Dynamic"
                                                ErrorMessage="Please enter email address"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" CssClass="red" runat="server"
                                                ControlToValidate="txtEmail"
                                                ErrorMessage="Please enter the valid Email ID"
                                                ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                                Display="Dynamic"></asp:RegularExpressionValidator>

                        </div>
                        <div class="form-group col-md-6 row mx-0 px-1">
                            <asp:Label class="col-lg-auto col-form-label label-140 pl-0" runat="server" ID="lblMobile">
                                Mobile No.<span class="text-danger">*</span>
                            </asp:Label>
                            <asp:TextBox CssClass="form-control col" runat="server" ID="txtWork"
                                ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator runat="server" ID="rfvWork" CssClass="red_new"
                                                ControlToValidate="txtWork" Display="Dynamic"
                                                ErrorMessage="Please enter mobile no"></asp:RequiredFieldValidator> 
                            <asp:RegularExpressionValidator runat="server" ID="revWork"
                                                CssClass="red_new" ValidationExpression="^[0-9]{1,12}$"
                                                ControlToValidate="txtWork" Display="Dynamic"
                                                ErrorMessage="Please enter valid number">
                                            </asp:RegularExpressionValidator> 

                        </div>
                        <div class="form-group col-md-6 row mx-0 px-1">
                            <asp:Label class="col-lg-auto col-form-label label-140 pl-0" runat="server" ID="lblCaptcha">
                                User Name<span class="text-danger">*</span>
                            </asp:Label>
                            <asp:TextBox CssClass="form-control col" runat="server" ID="txtUser">
                            </asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ID="rfvUser" CssClass="red_new"
                                                ControlToValidate="txtUser" Display="Dynamic"
                                                ErrorMessage="Please enter user name"></asp:RequiredFieldValidator>

                        </div>
                    </div>

                    <div class="table-details">
                        <asp:Label runat="server" ID="Label5">Student Details:
                        </asp:Label>

                        <div class="table-responsive">
                            <asp:GridView ID="gvDept" Style="border-width: 0px; border-style: None; width: 100%; border-collapse: collapse;"
                                runat="server" AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                                HeaderStyle-CssClass="HeaderDatagrid"   AllowPaging="True" ShowFooter="True"  >
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                   <asp:BoundField DataField="Sno" HeaderText="Sno" />
                                    <asp:TemplateField HeaderText = "School">
                                    <ItemTemplate>
                                      <asp:DropDownList ID="ddlSchool" runat="server" Width="120" AutoPostBack="true" OnSelectedIndexChanged="ddlSchool_SelectedIndexChanged">
                                         </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSchool" runat="server"  ControlToValidate="ddlSchool"  CssClass="red_new"  Display="Dynamic" ErrorMessage="Please Select School"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Admission No">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtAdmission" runat="server" Width="120" AutoPostBack="true" OnTextChanged="ddlAdmission_SelectedIndexChanged"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvAdmission" runat="server" ControlToValidate="txtAdmission" CssClass="red_new" Display="Dynamic" ErrorMessage="Please Enter Admission No"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText = "Academic Year">
                                    <ItemTemplate>
                                      <asp:DropDownList ID="ddlAcademic" runat="server" Width="120">
                                         </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvAcademic" runat="server"  ControlToValidate="ddlAcademic"  CssClass="red_new"  Display="Dynamic" ErrorMessage="Please Select Academic"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText = "Class">
                                    <ItemTemplate>
                                      <asp:DropDownList ID="ddlClass" runat="server" Width="120">
                                         </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvClass" runat="server"  ControlToValidate="ddlClass"  CssClass="red_new"  Display="Dynamic" ErrorMessage="Please Select Class"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText = "Section">
                                    <ItemTemplate>
                                     <asp:DropDownList ID="ddlSection" runat="server" Width="120">
                  
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSection" runat="server" ControlToValidate="ddlSection"  CssClass="red_new"  Display="Dynamic" ErrorMessage="Please Select Section"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                     <asp:TemplateField HeaderText = "Student">
                                    <ItemTemplate>
                                            <asp:TextBox ID="txtStudent" runat="server" Width="120" Enabled="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvStudent" runat="server" ControlToValidate="txtStudent" CssClass="red_new" Display="Dynamic" ErrorMessage="Please Enter student name"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                          <FooterStyle HorizontalAlign="Right" />

                                    <FooterTemplate>

                                     <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" CausesValidation="false" onclick="ButtonAdd_Click" />

                                    </FooterTemplate>
                                </asp:TemplateField>
                                   <asp:TemplateField>  
                                    <ItemTemplate>  
                                        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" CausesValidation="false">Remove</asp:LinkButton>  
                                    </ItemTemplate>  
                                </asp:TemplateField>  
                                        </Columns>
                                       </asp:GridView>
                        </div>

                        <div class="d-flex justify-content-end">
                            <%-- <asp:Button CssClass="btn btn-biz_logic" ID="btnReg" runat="server" Text="Register" OnClick="btnReg_Click" /> --%>
                            <asp:Button CssClass="btn btn-biz_logic" ID="btnReg" runat="server" Text="Register" OnClick="btnReg_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
       

        <div class="footer px-2">
            <p class="mb-0 small">Designed &amp; Developed by <a class="links" target="_blank" href="http://bizlogicsolutions.com/">Biz-Logic Solutions Ltd</a></p>
        </div>
    </div>
</asp:Content>
