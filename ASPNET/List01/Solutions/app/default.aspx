<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="list01task05.WebForm1" %>

  <!DOCTYPE html>

  <html xmlns="http://www.w3.org/1999/xhtml">

  <head runat="server">
    <title></title>
  </head>

  <body>
    <p>test</p>
    <form id="form1" runat="server">
      <div>
        <!-- tłumaczą się na inputy o różnych typach, podejrzenie -> breakpointy -->
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
      </div>
    </form>
  </body>

  </html>