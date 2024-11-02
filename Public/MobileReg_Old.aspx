<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobileReg_Old.aspx.cs" MasterPageFile="~/Head_Public.Master" Inherits="PresentationLayer.Public.MobileReg_Old" %>
<%@ MasterType VirtualPath="~/Head_Admin.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
         <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>
                <table style="width: 100%;">
                    <tr>
                    <td style="width: 100%;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 50%;">
                            <a class="navigationbar" href="/Default.aspx">Home</a>
                            &nbsp; &gt;&gt; &nbsp;<a class="navigationbar" href="MobileReg.aspx">Registration</a>
                            </td>
                        <td style="width: 50%; text-align:right">
                          
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 100%; height: 10px;"></td>
                    </tr>
                  </table>
                        <fieldset>
                        <legend>
                            <asp:Label runat="server" ID="lblTrans" CssClass="hd1">University/College/School</asp:Label> - <asp:Label runat="server" ID="lblReg" CssClass="hd1"> Registration</asp:Label>
                         </legend>
                <table style="width: 100%;">

                  </table>
        <table style="width: 100%;">
                    
           
                    <tr>
                        <td style="width: 20%;">
                            <asp:Label runat="server" ID="lblCompany">Parent Name</asp:Label>
                            <span class="red_new">*</span>
                        </td>
                        <td style="width: 30%;">
                            <asp:TextBox runat="server" ID="txtPName" MaxLength="200" Width="190"></asp:TextBox><br />
							<asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new" ControlToValidate="txtPName" Display="Dynamic" ErrorMessage="Please enter name"></asp:RequiredFieldValidator>
                        </td>
						<td style="width: 20%;">
							<asp:Label runat="server" ID="lblEmail">Email Address</asp:Label>
							<span class="red_new">*</span>
						</td>
							<td style="width: 30%;">
							<asp:TextBox runat="server" ID="txtEmail" MaxLength="200" Width="190"></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter email address"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" CssClass="red" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter the valid Email ID" ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" Display="Dynamic"></asp:RegularExpressionValidator>
						</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="width: 100%; height: 1px;"></td>
                    </tr>
                    <tr>
                        
                    <td style="width: 20%;">
                            <asp:Label runat="server" ID="lblMobile">Mobile No.</asp:Label>
                            <span class="red_new">*</span>
                    </td>
                    <td style="width: 30%;">
                            <asp:TextBox runat="server" ID="txtWork" MaxLength="20" Width="190" ToolTip="Mobile No:(ex:784777777)"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ID="rfvWork" CssClass="red_new" ControlToValidate="txtWork" Display="Dynamic" ErrorMessage="Please enter mobile no"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="revWork" CssClass="red_new" ValidationExpression="^[0-9]{1,12}$"
                                ControlToValidate="txtWork" Display="Dynamic" ErrorMessage="Please enter valid number"> </asp:RegularExpressionValidator>
                    </td>
					<td style="width: 20%;">
							<asp:Label runat="server" ID="lblCaptcha">User Name</asp:Label>
							<span class="red_new">*</span>
					</td>
					<td style="width: 30%;">
							<asp:TextBox runat="server" ID="txtUser" MaxLength="20" Width="190"></asp:TextBox><br />
							<asp:RequiredFieldValidator runat="server" ID="rfvUser" CssClass="red_new" ControlToValidate="txtUser" Display="Dynamic" ErrorMessage="Please enter user name"></asp:RequiredFieldValidator>
					</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="width: 100%; height: 1px;"></td>
                    </tr>
            
            
            
         
            
            </table>
            <fieldset>
                <legend>
                    <asp:Label runat="server" ID="Label5">University/College/School Registration Account Details:</asp:Label>
                    </legend>
                <table style="width: 100%;">
                                   
                         <tr>
                            <td style="width: 100%; text-align:center">
                                
                                <asp:GridView ID="gvDept" Style="border-width: 0px; border-style: None; width: 100%; border-collapse: collapse;"
                                runat="server" AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                                HeaderStyle-CssClass="HeaderDatagrid"   AllowPaging="True" ShowFooter="True"  >
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                   <asp:BoundField DataField="Sno" HeaderText="Sno" />
                                    <asp:TemplateField HeaderText = "University/College/School">
                                    <ItemTemplate>
                                      <asp:DropDownList ID="ddlSchool" runat="server" Width="120" AutoPostBack="true" OnSelectedIndexChanged="ddlSchool_SelectedIndexChanged">
                                         </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSchool" runat="server"  ControlToValidate="ddlSchool"  CssClass="red_new"  Display="Dynamic" ErrorMessage="Please Select University/College/School"></asp:RequiredFieldValidator>
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
                                    
                            </td>
                        </tr>
                            

                    </table>
            </fieldset>
            <table style="width: 100%;">
            <tr>
                <td colspan="4" style="width: 100%; text-align: center;">
                    <asp:Button ID="btnReg" runat="server" Text="Register" OnClick="btnReg_Click" />&nbsp;&nbsp;
                                        
                </td>
            </tr>
        </table>
                </fieldset>
                  </td>
                    </tr>
                    <tr>
                        <td style="width: 100%; height: 20px;"></td>
                    </tr>
                </table>
                </ContentTemplate>
             <Triggers>
            <asp:PostBackTrigger ControlID = "btnReg" />
    </Triggers>
        </asp:UpdatePanel>
           </div>     
</asp:Content>