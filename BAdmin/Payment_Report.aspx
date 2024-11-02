<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment_Report.aspx.cs" MasterPageFile="~/Head_BAdmin.Master" Inherits="PresentationLayer.BAdmin.Payment_Report" %>

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
                            <a class="navigationbar" href="Dashboard.aspx">Home</a>&nbsp; &gt;&gt; &nbsp;<a class="navigationbar" href="Payment_Report.aspx">Payment Summary</a>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 100%; height: 10px;"></td>
                    </tr>
                    
                  </table>
                <fieldset>
                    <legend>
                            <label class="hd1">Payment Summary</label>
                             </legend>
                <table style="width: 100%;">
                    <tr>
                        <td colspan="4" style="width: 100%; "></td>
                    </tr>
                    <tr>
                         <td style="width: 25%;">
                             <label>Facility</label>
                         </td>
                         <td style="width: 25%;">
                            <asp:DropDownList runat="server" ID="ddlFacility" Width="190"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new" ControlToValidate="ddlFacility" Display="Dynamic" ErrorMessage="Please select facility"></asp:RequiredFieldValidator>
                         </td>
                         <td style="width: 25%;">
                             
                         </td>
                         <td style="width: 25%;">
                         </td>
                     </tr>
                     <tr>
                        <td colspan="4" style="width: 100%; height: 10px;"></td>
                    </tr>
                    
                    <tr>
                        <td style="width: 25%;">
                            <label>Date From</label>
                        </td>
                        <td style="width: 25%;">
                            <asp:TextBox ID="txtFDate" runat="server" CssClass="Displaytext" Width="150"></asp:TextBox>
                    <asp:ImageButton runat="server" CausesValidation="false" ID="iPopup" ImageUrl="/images/calendar.png" />
                    <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                        TargetControlID="txtFDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                    <asp:RequiredFieldValidator runat="server" ID="rfvFDate" ControlToValidate="txtFDate" Display="Dynamic" CssClass="red_new" ErrorMessage="Please select from date"></asp:RequiredFieldValidator>
                    <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic" 
                      errormessage="The date must be less than equal today date" CssClass="red_new"  valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                      controltovalidate="txtFDate" type="date"  Operator="LessThanEqual" />
                        </td>
                         <td style="width: 25%;">
                             <label>Date To</label>
                        </td>
                        <td style="width: 25%;">
                            <asp:TextBox ID="txtTDate" runat="server" CssClass="Displaytext" Width="150"></asp:TextBox>
                    <asp:ImageButton runat="server" CausesValidation="false" ID="iPopup1" ImageUrl="/images/calendar.png" />
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="iPopup1"
                        TargetControlID="txtTDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtTDate" Display="Dynamic" CssClass="red_new" ErrorMessage="Please select to date"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmpVal" ControlToCompare="txtFDate" ControlToValidate="txtTDate" Display="Dynamic" CssClass="red_new"
                         Type="Date" Operator="GreaterThanEqual"  ErrorMessage="To Date should be greater than equal to From Date" 
                         runat="server"></asp:CompareValidator>
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
                                    <asp:TemplateField HeaderText="SNo" ItemStyle-Width="25%" ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Facility_Name" HeaderText="Facility" ItemStyle-Width="25%" ItemStyle-VerticalAlign="Top" >
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="No. of Transactions" ItemStyle-Width="25%" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblOUSD" Text=''></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                        <FooterTemplate>
                                         <asp:Label ID="lblOUSDTot" runat="server"></asp:Label>
                                         </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount" ItemStyle-Width="25%" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblOTZS" Text=''></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                        <FooterTemplate>
                                         <asp:Label ID="lblOTZSTot" runat="server"></asp:Label>
                                         </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle HorizontalAlign="Left" />
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
