using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub
{
    public partial class order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetProduct();
            }
            txtdate.Text = DateTime.Now.ToString("dd-MM-yyyy");
        }
        public void GetProduct()
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                string com = "Select * from Inventory";
                con.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                ddsup.DataSource = dt;
                ddsup.DataBind();
                ddsup.DataTextField = "ProductName";
                ddsup.DataValueField = "ProductId";
                ddsup.DataBind();
            }
        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["GymCon"].ConnectionString;
        }

        protected void btnsub_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                
                try
                {
                    con.Open();

                    SqlParameter p1 = new SqlParameter("@Action", "Insert");
                    SqlParameter p2 = new SqlParameter("@OrderName", txtprname.Text);
                    SqlParameter p3 = new SqlParameter("@OrderId", lblmsg.Text);
                    SqlParameter p4 = new SqlParameter("@Phone", txtnum.Text);
                    SqlParameter p5 = new SqlParameter("@ProductId", ddsup.SelectedItem.Value);
                    SqlParameter p6 = new SqlParameter("@OrderDate", txtdate.Text);

                    cmd.Parameters.Add(p1);
                    cmd.Parameters.Add(p2);
                    cmd.Parameters.Add(p3);
                    cmd.Parameters.Add(p4);
                    cmd.Parameters.Add(p5);
                    cmd.Parameters.Add(p6);

                    int k = cmd.ExecuteNonQuery();
                    if (k != 0)
                    {
                        Response.Write("<script>var str  = 'Order has been Placed Successfully!!'; var result = str.fontcolor(green); alert(str)</script>");
                        txtprname.Text = "";
                        txtnum.Text = "";
                        ddsup.SelectedIndex = -1;
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