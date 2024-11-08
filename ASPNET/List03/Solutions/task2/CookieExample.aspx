<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CookiesExample.aspx.cs" Inherits="list03task02.CookiesExample"
  %>

  <!DOCTYPE html>
  <html xmlns="http://www.w3.org/1999/xhtml">

  <head runat="server">
    <title>Przykład Cookies</title>
  </head>

  <body>
    <form id="form1" runat="server">
      <div>
        <h2>Dodaj ciastko</h2>
        <asp:TextBox ID="txtCookieName" runat="server" placeholder="Nazwa ciastka"></asp:TextBox>
        <asp:TextBox ID="txtCookieValue" runat="server" placeholder="Wartość ciastka"></asp:TextBox>
        <asp:Button ID="btnAddCookie" runat="server" Text="Dodaj ciastko" OnClick="btnAddCookie_Click" />
        <br /><br />

        <h2>Odczytaj ciastka</h2>
        <asp:Button ID="btnReadCookies" runat="server" Text="Odczytaj ciastka" OnClick="btnReadCookies_Click" />
        <asp:Label ID="lblCookies" runat="server" Text=""></asp:Label>
        <br /><br />

        <h2>Usuń ciastko</h2>
        <asp:TextBox ID="txtDeleteCookie" runat="server" placeholder="Nazwa ciastka do usunięcia"></asp:TextBox>
        <asp:Button ID="btnDeleteCookie" runat="server" Text="Usuń ciastko" OnClick="btnDeleteCookie_Click" />
      </div>
    </form>
  </body>

  </html>