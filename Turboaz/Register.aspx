<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Turboaz.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container">
        <div class="row d-flex justify-content-center align-items-center ">
            <div class="col-lg-12 col-xl-11">
                <div class="card text-muted" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4 text-dark">Qeydiyyat</p>
                                <div class="mx-1 mx-md-4">
                        
                                    <asp:Label ID="lblMessageError" runat="server" ForeColor="Red"></asp:Label>
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div class="form-outline flex-fill mb-0">
                                            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="form-label" Text="Ad"></asp:Label>
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-lg " Placeholder="Adınızi daxil edin"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div class="form-outline flex-fill mb-0">
                                            <asp:Label runat="server" AssociatedControlID="txtEmailRegister" CssClass="form-label" Text="Email ünvanı"></asp:Label>
                                            <asp:TextBox ID="txtEmailRegister" runat="server" CssClass="form-control form-control-lg" Placeholder="Email ünvanı daxil edin"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div class="form-outline flex-fill mb-0">
                                            <asp:Label AssociatedControlID="txtPhone" runat="server" CssClass="form-label" Text="Telefon nömrəsi"></asp:Label>
                                            <asp:TextBox ID="txtPhone" runat="server" MaxLength="14" CssClass="form-control form-control-lg" Placeholder="Telefon nömrəsi daxil edin"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div class="form-outline flex-fill mb-0">
                                            <asp:Label runat="server" AssociatedControlID="txtPasswordRegister" Text="Şifrə"></asp:Label>
                                            <asp:TextBox ID="txtPasswordRegister" runat="server" CssClass="form-control form-control-lg" TextMode="Password" Placeholder="Şifrə daxil edin"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Təsdiqlə" CssClass="btn btn-primary btn-lg" />
                                    </div>
                         
                                </div>
                            </div>
                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                    class="img-fluid" alt="Sample image">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

