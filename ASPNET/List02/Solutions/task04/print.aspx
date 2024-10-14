<%@ Page Language="C#" AutoEventWireup="true" %>

  <!DOCTYPE html>
  <html>

  <head>
    <title>Print Task Submission</title>
    <script runat="server">
            protected string name;
            protected string date;
            protected string subject;
            protected string setNumber;
            protected string[] taskScores;

            protected void Page_Load(object sender, EventArgs e)
      {
        if (Request.QueryString["name"] != null) {
          name = Request.QueryString["name"];
          date = Request.QueryString["date"];
          subject = Request.QueryString["subject"];
          setNumber = Request.QueryString["set"];
          taskScores = Request.QueryString["tasks"].Split(',');
        }
      }
    </script>
  </head>

  <body>
    <h2>Task Submission - Printable</h2>
    <table border="1">
      <tr>
        <th>Name</th>
        <th>Date</th>
        <th>Subject</th>
        <th>Set Number</th>
      </tr>
      <tr>
        <td>
          <%= name %>
        </td>
        <td>
          <%= date %>
        </td>
        <td>
          <%= subject %>
        </td>
        <td>
          <%= setNumber %>
        </td>
      </tr>
    </table>

    <h3>Tasks</h3>
    <table border="1">
      <tr>
        <th>Task</th>
        <th>Points</th>
      </tr>
      <% for (int i=0; i < taskScores.Length; i++) { %>
        <tr>
          <td>Task <%= i + 1 %>
          </td>
          <td>
            <%= taskScores[i] %>
          </td>
        </tr>
        <% } %>
    </table>
  </body>

  </html>