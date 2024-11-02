<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test_SMS.aspx.cs" Inherits="Schools.Test_SMS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox runat="server" ID="txtSMS" />
        <asp:RequiredFieldValidator runat="server" ID="rfvSMS" ControlToValidate="txtSMS" ErrorMessage="Please enter mobile no"></asp:RequiredFieldValidator>
        <asp:Button runat="server" ID="btnSubmit" Text="Snd SMS" OnClick="btnSubmit_Click" />
    </div>
    </form>
</body>
</html>
