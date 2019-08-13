using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                LoggedIn.Visible = false;
                NotLoggedIn.Visible = true;
            }
            else
            {
                lblsession.Text = "<h5>Hi, " + Session["id"].ToString() + "</h5>";
                LoggedIn.Visible = true;
                NotLoggedIn.Visible = false;
            }
        }

        protected void schedule_Click(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("schedule.aspx");
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}