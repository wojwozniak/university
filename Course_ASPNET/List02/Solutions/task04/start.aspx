<%@ Page Language="C#" AutoEventWireup="true" %>

  <!DOCTYPE html>
  <html>

  <head>
    <title>Task Submission Form</title>
    <script runat="server">
            public void Page_Load(object sender, EventArgs e)
      {
        if (!IsPostBack) {
          taskRepeater.DataSource = new int[10];
          taskRepeater.DataBind();
        }
      }

            public void SubmitForm(object sender, EventArgs e)
      {
                string name = txtName.Text;
                string date = txtDate.Text;
                string subject = txtSubject.Text;
                string setNumber = txtSetNumber.Text;
        string[] taskScores = new string[10];

        for (int i = 0; i < taskRepeater.Items.Count; i++)
        {
          var txtTask = (TextBox)taskRepeater.Items[i].FindControl("txtTask");
          taskScores[i] = string.IsNullOrEmpty(txtTask.Text) ? "0" : txtTask.Text;
        }

        foreach(string score in taskScores)
        {
          if (!int.TryParse(score, out _)) {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid input in tasks. Please enter only numbers.');", true);
            return;
          }
        }

                string queryString = $"name={name}&date={date}&subject={subject}&set={setNumber}&tasks={string.Join(", ", taskScores)}";
        Response.Redirect("print.aspx?" + queryString);
      }   
    </script>
  </head>

  <body>
    <form id="form1" runat="server">
      <div>
        <h2>Task Submission Form</h2>

        <label for="name">Name:</label>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
        <br />

        <label for="date">Date:</label>
        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox><br />
        <br />

        <label for="subject">Subject Name:</label>
        <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox><br />
        <br />

        <label for="setNumber">Set Number:</label>
        <asp:TextBox ID="txtSetNumber" runat="server"></asp:TextBox><br />
        <br />

        <h3>Tasks:</h3>
        <asp:Repeater ID="taskRepeater" runat="server">
          <ItemTemplate>
            <label>Task <%# Container.ItemIndex + 1 %>:</label>
            <asp:TextBox ID="txtTask" runat="server" MaxLength="3" Width="50px"></asp:TextBox>
            Points<br />
          </ItemTemplate>
        </asp:Repeater>

        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="SubmitForm" />
      </div>
    </form>
  </body>

  </html>