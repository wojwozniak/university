<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="list03task07.Upload" %>


  <!DOCTYPE html>

  <html xmlns="http://www.w3.org/1999/xhtml">

  <head runat="server">
    <title>Upload File</title>
  </head>

  <body>
    <form id="form1" runat="server" enctype="multipart/form-data">
      <div>
        <h2>Upload File</h2>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="ButtonUpload" runat="server" Text="Upload" OnClick="ButtonUpload_Click" />
      </div>
    </form>
  </body>

  </html>