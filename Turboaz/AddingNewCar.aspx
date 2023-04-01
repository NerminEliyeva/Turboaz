<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddingNewCar.aspx.cs" Inherits="Turboaz.AddingNewCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:DropDownList ID="ddlMark" runat="server" OnSelectedIndexChanged="ddlMark_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>

            <asp:DropDownList ID="ddlModel" runat="server">
            </asp:DropDownList>

            <asp:TextBox ID="txtPrice" runat="server" ToolTip="qiymet">

            </asp:TextBox>

            <asp:FileUpload ID="fileUpload" runat="server" />

            <asp:Button ID="btnSave" runat="server" OnClientClick="save()" Text="Save" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        function save() {
            var dto = {
                'markId': 1,
                'modelId': 2,
                'price': 10000,
            };
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: 'json',   
                url:"AddingNewCar.aspx/Save",
                data: JSON.stringify(DTO),
                success: function (result) {
                    alert("SUCCESS = " + result.id);
                    console.log(result);
                },
                error: function (xmlhttprequest, textstatus, errorthrown) {
                    alert(" conection to the server failed ");
                    console.log("error: " + errorthrown);
                }
            });//end of $.ajax()
        }
    </script>
</asp:Content>
