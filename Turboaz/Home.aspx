<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Turboaz.Home" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="btnAddNewCarPage" runat="server" OnClick="btnAddNewCarPage_Click" Text="masin elave et"/>
    <asp:Repeater ID="carsRepeater" runat="server">
        <ItemTemplate>
            <img
                src="<%# Eval("ImagePath")%>"
                height="300"
                loading="lazy" />
            <p><%# Eval("MarkName") %></p>
            <p><%# Eval("ModelName") %></p>
            <p><%# Eval("Price") %></p>
            
            <p><%# Eval("CreatedDate") %></p>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="btnAddNewCarPage" runat="server" OnClick="btnAddNewCarPage_Click" Text="Əlavə et" CssClass="btn btn-dark" />

    <div class="container">
        <asp:Label ID="lblMessageFilter" runat="server" ForeColor="Red"></asp:Label>
        <div class="row my-5 filterForm">
            <div class="col-2">
                <asp:DropDownList ID="ddlMark" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMark_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="col-2">
                <asp:DropDownList ID="ddlModel" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-3">
                <asp:TextBox ID="txtMinPrice" runat="server" CssClass="form-control" Placeholder="Min. Qiymət"></asp:TextBox>
            </div>
            <div class="col-3">
                <asp:TextBox ID="txtMaxPrice" runat="server" CssClass="form-control" Placeholder="Max. Qiymət"></asp:TextBox>
            </div>
            <div class="col-2">
                <asp:Button ID="btnSearch" runat="server" Text="Axtar" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
            </div>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4 ">
            <asp:Repeater ID="carsRepeater" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card h-100">
                            <img src="<%# Eval("ImagePath") %>" class="card-img-top" alt="<%# Eval("MarkName") %> <%# Eval("ModelName") %>">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("MarkName") %> <%# Eval("ModelName") %></h5>
                                <p class="card-text"><%# Eval("Price") %> AZN</p>
                                <p class="card-text text-muted"><small><%# Eval("CreatedDate", "{0:d}") %></small></p>
                                <a href="#" class="btn btn-success">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>


