<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fee_Bal_Report.aspx.cs" MasterPageFile="~/Head_BAdmin.Master" Inherits="PresentationLayer.BAdmin.Fee_Bal_Report" %>

<%@ MasterType VirtualPath="~/Head_BAdmin.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>
                <table style="width: 100%;">
                    <tr>
                    <td style="width: 100%;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 100%;">
                            <a class="navigationbar" href="Dashboard.aspx">Home</a>&nbsp; &gt;&gt; &nbsp;<a class="navigationbar" href="Fee_Det_Report.aspx">Fee Details Report</a>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 100%; height: 10px;"></td>
                    </tr>
                    
                  </table>
                <fieldset>
                    <legend>
                            <label class="hd1">Fee Details Report</label>
                             </legend>
                <table style="width: 100%;">
                    <tr>
                        <td colspan="4" style="width: 100%; "></td>
                    </tr>
                    <tr>
                         <td style="width: 25%;">
                             <label>School</label>
                         </td>
                         <td style="width: 25%;">
                            <asp:DropDownList runat="server" ID="ddlSchool" Width="190"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new" ControlToValidate="ddlSchool" Display="Dynamic" ErrorMessage="Please select school"></asp:RequiredFieldValidator>
                         </td>
                         <td style="width: 25%;">
                             <asp:Label runat="server" ID="lblDesig">Academic</asp:Label>
                         </td>
                         <td style="width: 25%;">
                             <asp:DropDownList runat="server" ID="ddlAcademic" Width="190"></asp:DropDownList>
                             <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" CssClass="red_new" ControlToValidate="ddlAcademic" Display="Dynamic" ErrorMessage="Please select academic"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                        <td colspan="4" style="width: 100%; height: 10px;"></td>
                    </tr>
                    <tr>
                         <td style="width: 25%;">
                             <label>Term</label>
                         </td>
                         <td style="width: 25%;">
                            <asp:DropDownList runat="server" ID="ddlTerm" Width="190"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="red_new" ControlToValidate="ddlTerm" Display="Dynamic" ErrorMessage="Please select term"></asp:RequiredFieldValidator>
                         </td>
                         <td style="width: 25%;">
                             <asp:Label runat="server" ID="Label1">Fee</asp:Label>
                         </td>
                         <td style="width: 25%;">
                             <asp:DropDownList runat="server" ID="ddlFee" Width="190"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCountry" CssClass="red_new" ControlToValidate="ddlFee" Display="Dynamic" ErrorMessage="Please select fee"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                        <td colspan="4" style="width: 100%; height: 10px;"></td>
                    </tr>
                    <tr>
                         <td style="width: 25%;">
                             <label>Admission No.</label>
                         </td>
                         <td style="width: 25%;">
                            <asp:TextBox runat="server" ID="txtAN" Width="190"></asp:TextBox>
                         </td>
                         <td style="width: 25%;">
                             <asp:Label runat="server" ID="Label2">Reference No.</asp:Label>
                         </td>
                         <td style="width: 25%;">
                             <asp:TextBox runat="server" ID="txtRN" Width="190"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                        <td colspan="4" style="width: 100%; height: 10px;"></td>
                    </tr>
                     </table>
                    <table style="width: 100%;">
                    <tr>
                        <td style="width: 100%; text-align:center;" >
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnSubmit" Width="110" runat="server" Text="View Report" OnClick="btnSubmit_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnPdf" runat="server" Width="110" Text="Download PDF" OnClick="btnPdf_Click"  />
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnExcel" runat="server" Width="110" Text="Download Excel" OnClick="btnExcel_Click"  />
                        </td>
                    </tr>
                    
                    </table>
                    <!--<div style="width:100%;overflow:scroll;">-->
                    <table style="width: 100%;">
                    <tr>
                        <td style="width: 100%; text-align: center; vertical-align:top;">
                            <!--<div style="overflow: auto; max-width: 880px">-->
                            <asp:GridView ID="gvDept" Style="border-width: 0px; border-style: None; width: 100%; border-collapse: collapse;"
                                runat="server" AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="true"
                                HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" OnRowDataBound="gvRowDataBound" OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="true">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Fee_Type" HeaderText="Fee" ItemStyle-VerticalAlign="Top" />
                                    <asp:BoundField DataField="Term_Type" HeaderText="Term" ItemStyle-VerticalAlign="Top" />
                                    <asp:BoundField DataField="Student_Full_Name" HeaderText="Student Name" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Admission_No" HeaderText="Admission No." ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Fee_Data_Sno" HeaderText="Reference No." ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:TemplateField HeaderText="Fee Amount">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblRA" Text='<%#Eval("Requested_Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterTemplate>
                                         <asp:Label ID="lblRATot" runat="server"></asp:Label>
                                         </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paid Amount">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblPA" Text=''></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterTemplate>
                                         <asp:Label ID="lblPATot" runat="server"></asp:Label>
                                         </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Balance Amount">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblBA" Text=''></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterTemplate>
                                         <asp:Label ID="lblBATot" runat="server"></asp:Label>
                                         </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                
                            </asp:GridView>
                          <!-- </div>-->
                        </td>
                    </tr>
                </table>
                         <!--</div>-->
                           </fieldset>
                </td>
                    </tr>
                    <tr>
                        <td style="width: 100%; height: 20px;"></td>
                    </tr>
                </table>
                  </ContentTemplate>
            <Triggers>
         <asp:PostBackTrigger ControlID="btnSubmit" />
        <asp:PostBackTrigger ControlID="btnPdf" />
        <asp:PostBackTrigger ControlID="btnExcel" />
    </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
