using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Fitness_Hub.admin
{
    public partial class AddSupplier : System.Web.UI.Page
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
            lblmessage.Text = "";
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spSupplier", con);
                cmd.CommandType = CommandType.StoredProcedure;
                
                try
                {
                    con.Open();

                    SqlParameter p1 = new SqlParameter("@Action", "Insert");
                    SqlParameter p2 = new SqlParameter("@SupplierName", txtname.Text);
                    SqlParameter p3 = new SqlParameter("@SupplierDOB", txtage.Text);
                    SqlParameter p4 = new SqlParameter("@SupplierEmail", txtemail.Text);
                    SqlParameter p6 = new SqlParameter("@SupplierPhone", txtphone.Text);
                    SqlParameter p8 = new SqlParameter("@SupplierAddress", txtaddress.Text);
                    SqlParameter p9 = new SqlParameter("@SupplierPassword", txtpassconf.Text);
                    SqlParameter p10 = new SqlParameter("@SupplierId", lblmessage.Text);

                    cmd.Parameters.Add(p1);
                    cmd.Parameters.Add(p2);
                    cmd.Parameters.Add(p3);
                    cmd.Parameters.Add(p4);
                    cmd.Parameters.Add(p6);
                    cmd.Parameters.Add(p8);
                    cmd.Parameters.Add(p9);
                    cmd.Parameters.Add(p10);

                    int k = cmd.ExecuteNonQuery();
                    if (k != 0)
                    {
                        string str = "Supplier has been successfully added!!";
                        Response.Write("<script language=javascript>alert('" + str + "');</script>");
                        txtaddress.Text = "";
                        txtage.Text = "";
                        txtemail.Text = "";
                        txtname.Text = "";
                        txtpass.Text = "";
                        txtpassconf.Text = "";
                        txtphone.Text = "";
                        lblmessage.Text = "";
                    }
                }
                catch (Exception)
                {
                    lblmessage.Text = "Trainer is not added/ Wrong Inputs!!";
                    lblmessage.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
            }
        }
    }
}