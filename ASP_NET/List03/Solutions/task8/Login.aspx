<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="list03task08.Login" %>

<!DOCTYPE html>


<html>

<head runat="server">
    <title>Login</title>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <h2>Log In</h2>
            <asp:Label ID="LabelUsername" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox><br />
            <asp:Label ID="LabelPassword" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox><br />
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
            <asp:Label ID="LabelMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>

</html>
