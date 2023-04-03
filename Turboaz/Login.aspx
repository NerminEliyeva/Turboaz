<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Turboaz.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblTest" runat="server" ForeColor="Red"></asp:Label>
    <section class="vh-100">
        <div class="container-fluid h-custom ">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                        class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1 text-muted">
                    <div>
                        <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                            <p class=" fw-bold h1 my-4 text-dark">Daxil olun</p>
                        </div>
                          <asp:Label ID="lblNotFound" runat="server" ForeColor="Red"></asp:Label>
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <asp:Label runat="server" AssociatedControlID="txtEmailLogin" CssClass="form-label" Text="Email ünvanı"></asp:Label>
                            <asp:TextBox ID="txtEmailLogin" runat="server" CssClass="form-control form-control-lg" Placeholder="Email ünvanı daxil edin"></asp:TextBox>
                        </div>
                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <asp:Label runat="server" AssociatedControlID="txtPassword" Text="Şifrə"></asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password" Placeholder="Şifrə daxil edin"></asp:TextBox>
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <!-- Checkbox -->
                            <div class="form-check mb-0">
                                <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input me-2" />
                                <asp:Label ID="lblRememberMe" runat="server" AssociatedControlID="chkRememberMe" Text=" Remember me"></asp:Label>
                            </div>
                            <a href="#!" class="text-body">Forgot password?</a>
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                       
                            <asp:Button ID="btnLogin" runat="server"  Text="Təsdiqlə" OnClick="btnLogin_Click" CssClass="btn btn-primary btn-lg" />
                            <p class="small fw-bold mt-2 pt-1 mb-0">
                                Don't have an account? <a href="/Register"
                                    class="link-danger">Register</a>
                            </p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
