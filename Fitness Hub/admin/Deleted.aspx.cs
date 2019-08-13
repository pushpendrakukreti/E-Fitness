using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub.admin
{
    public partial class Deleted : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnsubmission_Click(object sender, EventArgs e)
        {
            if (ddselect.SelectedIndex == 1)
            {
                GridView1.DataSource = SqlDataSource2;
                GridView1.DataBind();
            }
            else if (ddselect.SelectedIndex == 2)
            {
                GridView1.DataSource = SqlDataSource3;
                GridView1.DataBind();
            }
            else if (ddselect.SelectedIndex == 3)
            {
                GridView1.DataSource = SqlDataSource4;
                GridView1.DataBind();
            }
            else if (ddselect.SelectedIndex == 4)
            {
                GridView1.DataSource = SqlDataSource5;
                GridView1.DataBind();
            }
            else
            {
                Response.Redirect("Deleted.aspx");
            }
        }
    }
}