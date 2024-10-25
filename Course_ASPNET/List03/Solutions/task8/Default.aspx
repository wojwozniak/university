<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="list03task08.Default" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Home Page</title>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <h1>Welcome to the Home Page</h1>
            <asp:Button ID="ButtonLogout" runat="server" Text="Logout" OnClick="ButtonLogout_Click" />
        </div>
    </form>
</body>

</html>