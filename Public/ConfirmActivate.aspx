<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmActivate.aspx.cs" MasterPageFile="~/Head_Public.Master" Inherits="PresentationLayer.Public.ConfirmActivate" %>

<%@ MasterType VirtualPath="~/Head_Public.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>

                <style>
                    .main-area {
                      display: flex;
                      justify-content: center;
                      align-items: center;
                    }
                  </style>

                <!-- <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="/Default.aspx">Home</a></li>
                        <li class="breadcrumb-item">Confirm Activation</li>
                    </ol>
                </nav> -->

                <div class="card card-auth">
                    <div class="card-body">
                        <div class="corp-logo">
                            <img src="../Images/logo.png" alt="">
                          </div>
                        <h5 class="card-title text-center text-normal mb-2">Confirm Activation</h5>
                        <hr class="mt-2">
                        <div>
                            <label>You have registered succesfully, Activation link sent to your
                                register email account, please activate within 48 hours, otherwise
                                activation link will expire. <a href="../Default.aspx">Click here</a> to login.</label>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>