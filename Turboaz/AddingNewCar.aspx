<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddingNewCar.aspx.cs" Inherits="Turboaz.AddingNewCar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        <asp:UpdatePanel runat="server">
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnSave" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="form-group mt-3">
                                    <asp:DropDownList ID="ddlMark" runat="server" OnSelectedIndexChanged="ddlMark_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group mt-3">
                                    <asp:DropDownList ID="ddlModel" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group mt-3">
                                    <asp:TextBox ID="txtPrice" runat="server" ToolTip="Qiymət" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group mt-3">
                                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                                </div>
                                <div class="form-group mt-3 text-center w-100">
                                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" CssClass="btn btn-primary" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
</asp:Content>--%>
