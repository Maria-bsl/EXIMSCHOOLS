<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="TimingsRet.aspx.cs" Inherits="Schools.Facili.TimingsRet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Period Timings</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1 mb-0">Period Timings</label></h5>

                        <div class="row">
                            <div>
                                <asp:Label runat="server" ID="lblCPN">Academic Year
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic"
                                    Enabled="false" >
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAcademic" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlAcademic" Display="Dynamic"
                                    ErrorMessage="Please select Academic Year"></asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <asp:Label runat="server" ID="Label1">Class
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCname"
                                    Enabled="false" >
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlCname" Display="Dynamic" ErrorMessage="Please select Class">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <asp:Label runat="server" ID="Label2"> Copy of Class</asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCCname"
                                    Enabled="false" >
                                </asp:DropDownList>
                            </div>
                            <div>
                                <asp:Label runat="server" ID="Label3">Day
                                    <span class="red_new">*</span>
                                </asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtDay" runat="server" Enabled="false"
                                    >
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvDay" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtDay" Display="Dynamic" ErrorMessage="Please Enter Day">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" ShowFooter="True" OnRowDataBound="gvRowDataBound">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Period Type">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlPeriod"
                                                AutoPostBack="true" runat="server"
                                                OnSelectedIndexChanged="ddlPeriod_SelectedIndexChanged">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem Value="Period">Period</asp:ListItem>
                                                <asp:ListItem Value="Break">Break</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvPeriod" runat="server"
                                                ControlToValidate="ddlPeriod" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Select Period Type">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Period No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" runat="server"
                                                Text='<%#Eval("Period_Sno") %>' />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Start Time">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtStart" runat="server" htmlencode="false"
                                                placeholder="HH:MM" MaxLength="5" Text='<%#Eval("Start_Time") %>'
                                                onkeypress="formatTime(this)" DataFormatString="{0:hh:mm}">
                                            </asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revstart" runat="server"
                                                CssClass="red_new" Display="Dynamic" SetFocusOnError="true"
                                                ControlToValidate="txtStart"
                                                ErrorMessage="Characters or letters are not allowed"
                                                ValidationExpression="[0-9 :]+">
                                            </asp:RegularExpressionValidator>

                                            <asp:RequiredFieldValidator ID="rfvStart" runat="server"
                                                ControlToValidate="txtStart" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please select Start Time">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="End Time">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtEnd" runat="server" htmlencode="false"
                                                placeholder="HH:MM" MaxLength="5" onchange="time()"
                                                Text='<%#Eval("End_Time") %>' onkeypress="formatTime(this)">
                                            </asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revend" runat="server"
                                                CssClass="red_new" Display="Dynamic" SetFocusOnError="true"
                                                ControlToValidate="txtEnd"
                                                ErrorMessage="Characters or letters are not allowed"
                                                ValidationExpression="[0-9 :]+">
                                            </asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="rfvEnd" runat="server"
                                                ControlToValidate="txtEnd" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please select End Time">
                                            </asp:RequiredFieldValidator>

                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Day_Per_Tim_Det_Sno" HeaderText="Department ID"
                                        ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Update"
                                OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>


                <script type="text/javascript">
                    function formatTime(timeInput) {

                        intValidNum = timeInput.value;

                        if (intValidNum < 24) {
                            if (intValidNum.length == 2) {
                                timeInput.value = timeInput.value + ":";
                                return false;
                            }
                        }
                        if (intValidNum == 24) {
                            if (intValidNum.length == 2) {
                                timeInput.value = timeInput.value.length - 2 + "0:";
                                return false;
                            }
                        }
                        if (intValidNum > 24) {
                            if (intValidNum.length == 2) {
                                timeInput.value = "";
                                return false;
                            }
                        }


                        //Here is where I had trouble targeting the
                        //mm and ss in order to add conditions (see hh above).
                        //I used slice to assist me.
                        //Please let me know if any of you have suggestions/enhancements/corrections.

                        if (intValidNum.length == 5 && intValidNum.slice(-2) < 60) {
                            timeInput.value = timeInput.value;
                            return false;
                        }
                        if (intValidNum.length == 5 && intValidNum.slice(-2) > 60) {
                            timeInput.value = timeInput.value.slice(0, 2) + ":";
                            return false;
                        }
                        if (intValidNum.length == 5 && intValidNum.slice(-2) == 60) {
                            timeInput.value = timeInput.value.slice(0, 2) + ":00:";
                            return false;
                        }


                        if (intValidNum.length == 8 && intValidNum.slice(-2) > 60) {
                            timeInput.value = timeInput.value.slice(0, 5) + ":";
                            return false;
                        }
                        if (intValidNum.length == 8 && intValidNum.slice(-2) == 60) {
                            timeInput.value = timeInput.value.slice(0, 5) + ":00";
                            return false;
                        }
                    }
                    //ContentPlaceHolder1_gvDept_txtStart_0
                </script>



                <script type="text/javascript">
                    function time() {

                        var stime = document.getElementById("ContentPlaceHolder1_gvDept_txtStart_0").value;
                        var endTimeValue = document.getElementById("ContentPlaceHolder1_gvDept_txtEnd_0").value;
                        if (endTimeValue == stime) {
                            alert("Start time end time should not be equal");

                        } else if (endTimeValue > stime) {

                        } else {
                            alert("Start time should not be less than end time")
                        }

                    }
                </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>