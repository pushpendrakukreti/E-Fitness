using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub
{
    public partial class program : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rpProductList.DataSource = SqlDataSource1;
            rpProductList.DataBind();
            txtdate.Text = DateTime.Now.ToString("dd-MM-yyyy");
            txttime.Text = DateTime.Now.ToShortTimeString();
        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["GymCon"].ConnectionString;
        }

        protected void appointment_Click1(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAppointment", con);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    con.Open();

                    SqlParameter p1 = new SqlParameter("@Action", "Insert");
                    SqlParameter p2 = new SqlParameter("@FName", txtfname.Text);
                    SqlParameter p3 = new SqlParameter("@LName", txtlname.Text);
                    SqlParameter p4 = new SqlParameter("@Date", txtdate.Text);
                    SqlParameter p5 = new SqlParameter("@Time", txttime.Text);
                    SqlParameter p6 = new SqlParameter("@Phone", txtphone.Text);
                    SqlParameter p7 = new SqlParameter("@Message", txtmsg.Text);
                    SqlParameter p8 = new SqlParameter("@AppointmentId", lblmsg.Text);

                    cmd.Parameters.Add(p1);
                    cmd.Parameters.Add(p2);
                    cmd.Parameters.Add(p3);
                    cmd.Parameters.Add(p4);
                    cmd.Parameters.Add(p5);
                    cmd.Parameters.Add(p6);
                    cmd.Parameters.Add(p7);
                    cmd.Parameters.Add(p8);

                    int k = cmd.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblmsg.Text = "<h2 style='color:white'>Appointment Booked Succesfully!!</h2>";
                        txtfname.Text = "";
                        txtlname.Text = "";
                        txtmsg.Text = "";
                        txtphone.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    lblmsg.Text = ex.ToString();
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}