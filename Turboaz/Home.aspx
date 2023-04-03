<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Turboaz.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
    <asp:Button ID="btnAddNewCarPage" runat="server" OnClick="btnAddNewCarPage_Click" Text="Maşın əlavə et" CssClass="btn btn-danger" />
        <div class="row my-4 filterForm">
        <asp:Label ID="lblMessageFilter" runat="server" ForeColor="Red"></asp:Label>
            <div class="col-2">
                <asp:DropDownList ID="ddlMark" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMark_SelectedIndexChanged" CssClass="form-select">
                </asp:DropDownList>
            </div>
            <div class="col-2">
                <asp:DropDownList ID="ddlModel" runat="server" CssClass="form-select">
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


