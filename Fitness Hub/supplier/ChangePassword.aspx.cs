using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub.supplier
{
    public partial class ChangePassword1 : System.Web.UI.Page
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
            
        }
        protected void btn1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("spSupplierLog", con);

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter("@Action", "UPDATE");

                    SqlParameter p2 = new SqlParameter("@SupplierEmail", txtsupplier.Text);

                    SqlParameter p3 = new SqlParameter("@SupplierPassword", txtpasswordconf.Text);

                    cmd.Parameters.Add(p1);

                    cmd.Parameters.Add(p2);

                    cmd.Parameters.Add(p3);

                    int k = cmd.ExecuteNonQuery();

                    if (k != 0)
                    {
                        lblmsg.ForeColor = System.Drawing.Color.Green;
                        lblmsg.Text = "Password Updated Successfully!!";
                    }

                    else
                    {
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                        lblmsg.Text = "Invalid Username or Password";
                    }
                }
            }

            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }
    }
}