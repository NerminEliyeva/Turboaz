<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddingNewCar.aspx.cs" Inherits="Turboaz.AddingNewCar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="vh-100 d-flex align-items-center">
        <div class="container my-3">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body ">
                            <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4 text-dark">Maşın əlavə et</p>
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                            <asp:UpdatePanel runat="server">
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnSave" />
                                </Triggers>
                                <ContentTemplate>
                                    <div class="form-group mt-3">
                                        <asp:Label runat="server" AssociatedControlID="ddlMark" CssClass="form-label" Text="Marka"></asp:Label>
                                        <asp:DropDownList ID="ddlMark" runat="server" OnSelectedIndexChanged="ddlMark_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group mt-3">
                                        <asp:Label runat="server" AssociatedControlID="ddlModel" CssClass="form-label" Text="Model"></asp:Label>
                                        <asp:DropDownList ID="ddlModel" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group mt-3">
                                        <asp:Label runat="server" AssociatedControlID="txtPrice" CssClass="form-label" Text="Qiymət"></asp:Label>
                                        <asp:TextBox ID="txtPrice" runat="server" ToolTip="Qiymət" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group mt-3">
                                        <asp:Label runat="server" AssociatedControlID="fileUpload" CssClass="form-label" Text="Şəkil"></asp:Label>
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
    </section>
</asp:Content>
