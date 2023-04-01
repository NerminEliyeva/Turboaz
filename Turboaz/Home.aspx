<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Turboaz.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  

    <asp:Button ID="btnAddNewCarPage" runat="server" OnClick="btnAddNewCarPage_Click" Text="masin elave et"/>

    <asp:Repeater ID="carsRepeater" runat="server">
        <ItemTemplate>
            <p><%# Eval("MarkName") %></p>
            <p><%# Eval("ModelName") %></p>
            <p><%# Eval("Price") %></p>
            <p><%# Eval("ImagePath") %></p>
            <img
                src="<%# Eval("ImagePath")%>"
                height="300"
                loading="lazy" />
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
