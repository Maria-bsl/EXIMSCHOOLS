<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultSamp.aspx.cs" Inherits="Schools.DefaultSamp" %>

<!DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
  <title>B-Smart Academia</title>
  <link href="/Styles/styles_j.css" rel="stylesheet" type="text/css" />
</head>

<body
  style="background-image:url(/Images/background.png);  background-repeat: no-repeat;opacity: 1; filter: alpha(opacity=20); background-color: #f8f8f6;">
  <form id="form1" runat="server">

    <div>
      <h1 align="center" class="site-name style1"><b>
          SCHOOL FEES MANAGEMENT SYSTEM</b></h1>
      <table width="100%">
        <tr>
          <td width="30%" align="right" valign="top"><img src="/Images/logo1.png" alt="Biz-logic Solutions" width="219"
              height="152" /></td>

          <td width="40%">
            <div class="login-page">

              <div class="form">
                <div align="left">
                  <asp:Label ID="lblUName" runat="server">Username</asp:Label>
                  <asp:TextBox runat="server" ID="txtEmail" />

                  <asp:RequiredFieldValidator ID="rfvUName" runat="server" ControlToValidate="txtEmail"
                    CssClass="field-validation-error" ErrorMessage="The username field is required." />
                  <asp:Button CssClass="fbutton" ID="btnLogin" CausesValidation="true" runat="server" Text="Log in"
                    OnClick="Login_Click" />
                </div>
                <p align="left" class="message">Not registered? <a href="../Public/NewReg.aspx">Create an account</a>
                </p>

              </div>
              <div align="left"></div>
            </div>

            <div align="left"> </div>
          </td>

          <td width="30%" align="left" valign="top"><img src="/Images/CRDB-LOGO.png" alt="CRDB" width="247"
              height="137"> </td>
        </tr>
      </table>
    </div>
  </form>
</body>

</html>