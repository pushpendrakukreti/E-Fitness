using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub.admin
{
    public partial class Expenses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl.Text = "";
                GridView1.Visible = true;
            }
        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["GymCon"].ConnectionString;
        }

        public void Insert()
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spDailyExpense", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter p1 = new SqlParameter("@Action", "Insert");
                SqlParameter p2 = new SqlParameter("@ExpenseId", lblid.Text);
                SqlParameter p3 = new SqlParameter("@ExpenseName", txtname.Text);
                SqlParameter p4 = new SqlParameter("@ExpensePrice", txtamt.Text);
                SqlParameter p5 = new SqlParameter("@ExpenseDetail", txtdesc.Text);

                cmd.Parameters.Add(p1);
                cmd.Parameters.Add(p2);
                cmd.Parameters.Add(p3);
                cmd.Parameters.Add(p4);
                cmd.Parameters.Add(p5);

                try
                {
                    cmd.ExecuteNonQuery();
                    lbl.Text = "Record Inserted Succesfully into the Database";
                    lbl.ForeColor = System.Drawing.Color.CornflowerBlue;
                    txtname.Text = "";
                    txtamt.Text = "";
                    txtdesc.Text = "";

                }
                catch (Exception ex)
                {
                    lbl.Text = ex.ToString();
                    lbl.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Insert();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Expenses.aspx");
        }
    }
}