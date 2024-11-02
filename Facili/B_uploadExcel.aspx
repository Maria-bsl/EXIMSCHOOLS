<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="B_uploadExcel.aspx.cs" Inherits="Schools.Facili.B_uploadExcel" %>
<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>
                <table style="width: 100%;">
                    <tr>
                    <td style="width: 100%;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 50%;">
                            <a class="navigationbar" href="HvL7a8">Home</a>
                            &nbsp; &gt;&gt; &nbsp;<a class="navigationbar" href="B_uploadExcel.aspx">Books Upload</a>
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
                            <asp:Label runat="server" ID="lblTrans" CssClass="hd1">Books </asp:Label> - <asp:Label runat="server" ID="lblReg" CssClass="hd1"> Upload</asp:Label>
                         </legend>
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 100%; height: 20px;"></td>
                    </tr>
                  </table>
        <table style="width: 100%;">
            <tr>
                <td style="width: 10%;"></td>
                <td style="width: 30%;">
                    <asp:Label runat="server" ID="lblCity">Subject</asp:Label>
                    <span class="red_new">*</span>
                </td>
                <td style="width: 50%;">
                    <asp:DropDownList runat="server" ID="ddlSubject2" Width="190"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new" ControlToValidate="ddlSubject2" Display="Dynamic" ErrorMessage="Please select section"></asp:RequiredFieldValidator>
                </td>
                <td style="width: 10%;"></td>
            </tr>
            <tr>
                <td colspan="4" style="width: 100%; height: 10px;"></td>
            </tr>
            <tr>
                <td style="width: 10%;"></td>
                <td style="width: 30%;">
                    <asp:Label runat="server" ID="Label1">Upload Excel File</asp:Label>
                    <span class="red_new">*</span>
                </td>
                <td style="width: 50%;">
                    <asp:FileUpload runat="server" Width="190" ID="Bfile" ToolTip="Supported file name should not contain Special Characters, Supported file formats are xls,xlsx,xlsm,xlsb" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="red_new" ControlToValidate="Bfile" Display="Dynamic" ErrorMessage="Please select excel file"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="red_new" 
                            ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx|.XLS|.XLSX|.xlsm|.XLSM|.xlsb|.XLSB)$"
                            ControlToValidate="Bfile" Display="Dynamic" 
                            ErrorMessage="Supported file name should not contain Special Characters, Supported file formats are xls,xlsx,xlsm,xlsb"> 
                    </asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cvExcel" runat="server" ControlToValidate="Bfile" CssClass="red_new"
                        ErrorMessage="File size should not be greater than 20 MB." Display="Dynamic" 
                        OnServerValidate="cvExcel_ServerValidate"></asp:CustomValidator>
                </td>
                <td style="width: 10%;"></td>
            </tr>
            <tr>
                <td colspan="4" style="width: 100%; height: 10px;"></td>
            </tr>
            
            </table>
            <table style="width: 100%;">
            <tr>
                <td colspan="4" style="width: 100%; text-align: center;">
                    <asp:Button ID="btnReg" runat="server" Text="Upload" OnClick="btnupload_Click" />&nbsp;&nbsp;
                                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="width: 100%; height: 20px;"></td>
            </tr>
        </table>
               <%-- <table style="width: 100%;">
                    <tr>
                        <td style="width: 100%; height: 20px;"></td>
                    </tr>
                     <tr>
                        <td style="width: 100%; text-align: center;">
                            <asp:GridView ID="gvDept" Style="border-width: 0px; border-style: None; width: 100%; border-collapse: collapse;"
                                runat="server" AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                                HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="true">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:BoundField DataField="Admission_No" HeaderText="Admission No" />
                                    <asp:BoundField DataField="Admission_Date" HeaderText="Admission Date" DataFormatString="{0:dd/M/yyyy}" />
                                    <asp:BoundField DataField="Student_Full_Name" HeaderText="Full Name" />
                                    <asp:BoundField DataField="Medium_Type" HeaderText="Medium" />
                                    <asp:BoundField DataField="Class_Name" HeaderText="Class" />
                                    <asp:BoundField DataField="Section_Name" HeaderText="Section" />
                                    <asp:BoundField DataField="Roll_No" HeaderText="Roll No" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%; height: 20px;"></td>
                    </tr>
                    </table>--%>
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
