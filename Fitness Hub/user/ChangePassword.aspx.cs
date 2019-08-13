using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

namespace Fitness_Hub.user
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["GymCon"].ConnectionString;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("spUserLog", con);

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter("@Action", "UPDATE");

                    SqlParameter p2 = new SqlParameter("@UserEmail", txtuser.Text);

                    SqlParameter p3 = new SqlParameter("@UserPassword", txtpassconf.Text);

                    cmd.Parameters.Add(p1);

                    cmd.Parameters.Add(p2);

                    cmd.Parameters.Add(p3);

                    int k = cmd.ExecuteNonQuery();

                    if (k != 0)
                    {
                        lblmessage.ForeColor = System.Drawing.Color.Green;
                        lblmessage.Text = "Password Updated Successfully!!";
                    }

                    else
                    {
                        lblmessage.ForeColor = System.Drawing.Color.Red;
                        lblmessage.Text = "Invalid Username or Password";
                    }
                }
            }

            catch (Exception ex)
            {
                lblmessage.Text = ex.Message;
            }
        }
    }
}