<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentTransport1.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.StudentTransport1" %>
<%@ MasterType VirtualPath="~/Head_Faci.master" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hddvehM" runat="server" />
    <div>
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Student Transport Details</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Student Transport Details</h5>
                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-5 col-form-label pl-0">AcademicYear<span class="red_new">*</span></label>
                        <asp:DropDownList CssClass="col-md-7 form-control" ID="ddlAcademic" runat="server" >
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvacyear" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlAcademic" Display="Dynamic"
                            ErrorMessage="Please select Academic year">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-5 col-form-label pl-0">Class<span class="red_new">*</span></label>
                        <asp:DropDownList CssClass="col-md-7 form-control" ID="ddlCname" runat="server" 
                            AutoPostBack="true"></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvclassname" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlCname" Display="Dynamic" ErrorMessage="Please select Class Name">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <label class="col-md-5 col-form-label pl-0">Section<span class="red_new">*</span></label>
                        <asp:DropDownList CssClass="col-md-7 form-control" ID="ddlSection" runat="server" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged" 
                            AutoPostBack="true"></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvsecname" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Section name">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server" AutoGenerateColumns="False"
                        Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" ShowFooter="True">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <HeaderStyle CssClass="HeaderDatagrid" />
                        <PagerStyle CssClass="gridViewPager" />
                        <AlternatingRowStyle CssClass="AlternateItemStyle" />
                        <Columns>
                            <asp:BoundField DataField="Sno" HeaderText="Sno" />
                            <asp:TemplateField HeaderText="AdmissionNo">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtAdmission" runat="server" Enabled="false" Width="90"
                                        AppendDataBoundItems="true">
                                    </asp:TextBox>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student Name">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtStuname" runat="server" Enabled="false"
                                        AppendDataBoundItems="true" Width="100">

                                    </asp:TextBox><br />

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="stuID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblstuid" runat="server" Width="10"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="stuMID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblstuMid" runat="server" Width="10"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Route">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlroute" runat="server" AutoPostBack="true"
                                        AppendDataBoundItems="true" Width="100"
                                        OnSelectedIndexChanged="ddlroute_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">Select RouteName</asp:ListItem>
                                    </asp:DropDownList><br />
                                    <asp:RequiredFieldValidator ID="rfvrname" runat="server"
                                        ControlToValidate="ddlroute" InitialValue="-1" CssClass="red_new"
                                        Display="Dynamic" ErrorMessage="Please Select Route name">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Vehicle No">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlVN" runat="server" Width="100">
                                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                                    </asp:DropDownList><br />
                                    <asp:RequiredFieldValidator ID="rfvVN" runat="server" ControlToValidate="ddlVN"
                                        InitialValue="0" CssClass="red_new" Display="Dynamic"
                                        ErrorMessage="Please Select Vehicle No">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pickup Time">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlPT" runat="server" Width="100">
                                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                                    </asp:DropDownList><br />
                                    <asp:RequiredFieldValidator ID="rfvPT" runat="server" ControlToValidate="ddlPT"
                                        InitialValue="0" CssClass="red_new" Display="Dynamic"
                                        ErrorMessage="Please Select Pickup Time">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Area">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlarea" runat="server" Width="100"
                                        OnSelectedIndexChanged="ddlarea_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                                    </asp:DropDownList><br />
                                    <asp:RequiredFieldValidator ID="rfvarea" runat="server" ControlToValidate="ddlarea"
                                        InitialValue="0" CssClass="red_new" Display="Dynamic"
                                        ErrorMessage="Please Select AreaName">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Arrival">
                                <ItemTemplate>

                                    <asp:TextBox ID="txtatime" runat="server" Enabled="false" Width="55"
                                        htmlencode="false" placeholder="HH:MM" MaxLength="5"
                                        onkeypress="formatTime(this)"></asp:TextBox>
                                    <%--<asp:RegularExpressionValidator ID="revatime" runat="server" CssClass="red_new" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtatime" ErrorMessage="Characters or letters are not allowed" ValidationExpression="[0-9 :]+"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="rfvatime" runat="server" ControlToValidate="txtatime" CssClass="red_new" Display="Dynamic" ErrorMessage="Please enter ArrivalTime"></asp:RequiredFieldValidator>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Departure">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtdtime" runat="server" Width="55" Enabled="false"
                                        htmlencode="false" placeholder="HH:MM" MaxLength="5"
                                        onkeypress="formatTime(this)"></asp:TextBox>
                                    <%--<asp:RegularExpressionValidator ID="revdtime" runat="server" CssClass="red_new" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtatime" ErrorMessage="Characters or letters are not allowed" ValidationExpression="[0-9 :]+"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="rfvdtime" runat="server" ControlToValidate="txtdtime" CssClass="red_new" Display="Dynamic" ErrorMessage="Please enter DepartureTime"></asp:RequiredFieldValidator>--%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Landmark">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtland" runat="server" Width="80" Enabled="false">
                                    </asp:TextBox>

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="lbsno" runat="server" CssClass="hide"></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="valid" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblvalid" runat="server"></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lkremove" runat="server" OnClick="LinkButton1_Click"
                                        CausesValidation="false">Remove
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="form-group d-flex justify-content-end ">
                    <asp:Button class="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                        OnClick="btnSubmit_Click" />
                    <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnupdate" Visible="false" runat="server"
                        Text="Update" OnClick="btnupdate_click" />
                    <asp:Button class="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                        CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />
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


    </div>




</asp:Content>