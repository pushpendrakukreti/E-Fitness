using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub
{
    public partial class schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rpBeginnerList.DataSource = SqlDataSource1;
            rpAdvancedList.DataSource = SqlDataSource2;
            rpProfessionalList.DataSource = SqlDataSource3;
            rpAdvancedList.DataBind();
            rpBeginnerList.DataBind();
            rpProfessionalList.DataBind();

            if (!IsPostBack)
            {
                divbeginner.Visible = false;
                divadvance.Visible = false;
                divprofessional.Visible = false;
            }
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["GymCon"].ConnectionString;
        }

        protected void btnbegin_Click(object sender, EventArgs e)
        {
            divadvance.Visible = false;
            divprofessional.Visible = false;
            divcategory.Visible = false;
            divbeginner.Visible = true;
        }

        protected void btnadvance_Click(object sender, EventArgs e)
        {
            divbeginner.Visible = false;
            divadvance.Visible = true;
            divprofessional.Visible = false;
            divcategory.Visible = false;
        }

        protected void btnprofess_Click(object sender, EventArgs e)
        {
            divbeginner.Visible = false;
            divadvance.Visible = false;
            divprofessional.Visible = true;
            divcategory.Visible = false;
        }
    }
}