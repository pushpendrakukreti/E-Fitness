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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
            if (!IsPostBack)
            {
                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    txtUserName.Text = Request.Cookies["UserName"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["Password"].Value;
                }
            }
        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["GymCon"].ConnectionString;
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    if (chkRememberMe.Checked)
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                    }
                    Response.Cookies["UserName"].Value = txtUserName.Text.Trim();
                    Response.Cookies["Password"].Value = txtPassword.Text.Trim();

                    con.Open();

                    SqlCommand cmd = new SqlCommand("spUserLog", con);

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter p1 = new SqlParameter("@Action", "SELECTLOG");

                    SqlParameter p3 = new SqlParameter("@UserEmail", txtUserName.Text);

                    SqlParameter p4 = new SqlParameter("@UserPassword", txtPassword.Text);

                    cmd.Parameters.Add(p1);

                    cmd.Parameters.Add(p3);

                    cmd.Parameters.Add(p4);

                    SqlDataReader rd = cmd.ExecuteReader();

                    if (rd.HasRows)

                    {
                        rd.Read();

                        lblMessage.Text = "You are Authorized.";

                        Session["id"] = txtUserName.Text;

                        FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, true);

                        Response.Redirect("Dashboard.aspx");

                        Session.RemoveAll();

                    }

                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Invalid Username or Password";
                    }
                }
            }

            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
    }
}