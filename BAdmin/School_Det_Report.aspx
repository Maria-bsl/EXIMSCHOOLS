<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="School_Det_Report.aspx.cs" MasterPageFile="~/Head_BAdmin.Master" Inherits="PresentationLayer.BAdmin.School_Det_Report" %>

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
                            <a class="navigationbar" href="Dashboard.aspx">Home</a>&nbsp; &gt;&gt; &nbsp;<a class="navigationbar" href="School_Det_Report.aspx">School Details Report</a>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 100%; height: 10px;"></td>
                    </tr>
                    
                  </table>
                <fieldset>
                    <legend>
                            <label class="hd1">School Details Report</label>
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
                             
                         </td>
                         <td style="width: 25%;">
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
                                    <asp:BoundField DataField="Facility_Name" HeaderText="School" ItemStyle-VerticalAlign="Top" />
                                    <asp:BoundField DataField="Region_Name" HeaderText="Region" ItemStyle-VerticalAlign="Top" />
                                    <asp:BoundField DataField="District_Name" HeaderText="District" ItemStyle-VerticalAlign="Top" />
                                    <asp:BoundField DataField="Ward_Name" HeaderText="Ward" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Physical_Address" HeaderText="Physical Address" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Mobile_No" HeaderText="Phone No." ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Email_Address" HeaderText="Email" ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                                    <asp:BoundField DataField="Reg_No" HeaderText="Institution ID" ItemStyle-VerticalAlign="Top" ></asp:BoundField>
                                    
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
