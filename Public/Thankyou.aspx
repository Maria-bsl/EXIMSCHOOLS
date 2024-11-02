<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Thankyou.aspx.cs" MasterPageFile="~/Head_Public.Master" Inherits="PresentationLayer.Public.Thankyou" %>

<%@ MasterType VirtualPath="~/Head_Public.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .main-area {
          display: flex;
          justify-content: center;
          align-items: center;
        }
      </style>
    <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>

                <div class="card card-auth">
                    <div class="card-body">
                        <div class="corp-logo">
                            <img src="../Images/logo.png" alt="">
                          </div>
                        <h5 class="card-title text-center text-normal mb-2">Password Sent</h5>
                        <hr class="mt-2">

                        <div> <label>Thank You for activating account. <a href="/Default.aspx">Click here</a> to
                                login.</label></div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>