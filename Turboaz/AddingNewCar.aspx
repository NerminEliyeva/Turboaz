<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddingNewCar.aspx.cs" Inherits="Turboaz.AddingNewCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    <asp:UpdatePanel runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>
        <ContentTemplate>

            <asp:DropDownList ID="ddlMark" runat="server" OnSelectedIndexChanged="ddlMark_SelectedIndexChanged" AutoPostBack="true" >
            </asp:DropDownList>
            <asp:DropDownList ID="ddlModel" runat="server">
            </asp:DropDownList>

            <asp:TextBox ID="txtPrice" runat="server" ToolTip="Qiymət">
            </asp:TextBox>

            <asp:FileUpload ID="fileUpload" runat="server" />

            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
