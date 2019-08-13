using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["GymCon"].ConnectionString;
        }

        protected void btnPage_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    con.Open();

                    SqlCommand cmd2 = new SqlCommand("select UserStatus from [User]", con);
                
                    Session["myval"] = cmd2.ExecuteScalar();
                    
                    lblmsg.Text = Convert.ToString(Session["myval"]);


                    SqlCommand cmd = new SqlCommand("spUserLog", con);

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter("@Action", "SELECTLOG");

                    SqlParameter p3 = new SqlParameter("@UserEmail", txtemail.Text);

                    SqlParameter p4 = new SqlParameter("@UserPassword", txtpass.Text);

                    cmd.Parameters.Add(p1);

                    cmd.Parameters.Add(p3);

                    cmd.Parameters.Add(p4);

                    SqlDataReader rd = cmd.ExecuteReader();

                    if (rd.HasRows && lblmsg.Text=="True")

                    {
                        rd.Read();

                        Session["id"] = txtemail.Text;

                        FormsAuthentication.RedirectFromLoginPage(txtemail.Text, true);

                        Response.Redirect("index.aspx");

                        Session.RemoveAll();
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

        protected void btnpanel_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("spUserLog", con);

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter("@Action", "SELECTLOG");

                    SqlParameter p3 = new SqlParameter("@UserEmail", txtemail.Text);

                    SqlParameter p4 = new SqlParameter("@UserPassword", txtpass.Text);

                    cmd.Parameters.Add(p1);

                    cmd.Parameters.Add(p3);

                    cmd.Parameters.Add(p4);

                    SqlDataReader rd = cmd.ExecuteReader();

                    if (rd.HasRows)

                    {
                        rd.Read();

                        Session["id"] = txtemail.Text;

                        FormsAuthentication.RedirectFromLoginPage(txtemail.Text, true);

                        Response.Redirect("user/Dashboard.aspx");

                        Session.RemoveAll();

                    }

                    else
                    {
                        lblmsg.ForeColor = System.Drawing.Color.Yellow;
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