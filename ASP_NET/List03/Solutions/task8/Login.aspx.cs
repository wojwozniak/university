using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace list03task08
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            // Naiwne rozwiązanie, narażone np. na session hijacking
            // JWT dużo lepsze
            string username = TextBoxUsername.Text;
            string password = TextBoxPassword.Text;

            if (username == "admin" && password == "password")
            {
                Session["User"] = username;
                if (Session["ReturnUrl"] != null)
                {
                    Response.Redirect(Session["ReturnUrl"].ToString());
                    Session.Remove("ReturnUrl");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                LabelMessage.Text = "Invalid username or password.";
            }
        }
    }
}