<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeeSamp.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.FeeSamp" %>
<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <ContentTemplate>
                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Fee Sample Data</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Fee Sample Data</h5>
                    </div>
                </div>
            </ContentTemplate>

        </asp:UpdatePanel>
    </div>
</asp:Content>