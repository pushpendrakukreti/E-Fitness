using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub.supplier
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("index.aspx");
            }
            else
            {
                lblsession.Text = "<h4>" + Session["id"].ToString() + "</h4>";
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("index.aspx");
        }
    }
}