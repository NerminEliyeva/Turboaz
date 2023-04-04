<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appeal.aspx.cs" Inherits="Turboaz.Appeal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container">
                <h1>Müraciətlər Cədvəli</h1>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Şəkil</th>
                            <th>Marka</th>
                            <th>Model</th>
                            <th>Qiymət</th>
                            <th>Müraciət vaxtı</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="tblRepeater" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <img src="<%# Eval("ImagePath") %>" class="card-img-top" alt="<%# Eval("MarkName") %> <%# Eval("ModelName") %>" style="width:100%;""></td>
                                    <td><%# Eval("MarkName") %></td>
                                    <td><%# Eval("ModelName") %></td>
                                    <td><%# Eval("Price") %> AZN</td>
                                    <td><%# Eval("CreatedDate", "{0:d}") %></td>
                                    <td>
                                        <asp:LinkButton ID="btnConfirm" CommandArgument='<%# Eval("Id") %>' runat="server" OnClick="btnConfirm_Click" Text="Təsdiq" CssClass="btn btn-success"/>
                                        <asp:LinkButton ID="btnReject" CommandArgument='<%# Eval("Id") %>' runat="server" OnClick="btnReject_Click" Text="İmtina"  CssClass="btn btn-danger"/>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
