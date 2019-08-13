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


namespace Fitness_Hub.supplier
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            string com = "Select * from Supplier where SupplierEmail='"+ Session["id"] + "'";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddsup.DataSource = dt;
            ddsup.DataBind();
            ddsup.DataTextField = "SupplierName";
            ddsup.DataValueField = "SupplierId";
            ddsup.DataBind();
        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["GymCon"].ConnectionString;
        }

        protected void btnsub_Click(object sender, EventArgs e)
        {
            lblmsg.Text = "";
            using (SqlConnection con=new SqlConnection(GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spInventory",con);
                cmd.CommandType = CommandType.StoredProcedure;

                string ImageFile = "";
                if (filephoto.HasFile)
                {
                    string imgPath = "~/Upload/images/";
                    string thumbPath = "~/Upload/thumbnails/";

                    ImageFile = Path.GetFileName(Server.MapPath(filephoto.PostedFile.FileName));
                    ImageFile = ImageFile.Replace(" ", "-");
                    ImageFile = System.DateTime.Now.ToString("yyyyMMddHHmmss") + "-" + ImageFile;
                    thumbPath = thumbPath + ImageFile;
                    System.Drawing.Bitmap bmpUploadedImage = new System.Drawing.Bitmap(filephoto.PostedFile.InputStream);

                    imgPath = imgPath + ImageFile;
                    filephoto.SaveAs(MapPath(imgPath));
                }
                else
                {
                    ImageFile = "";
                    ImageFile = "";
                }

                try
                {
                    con.Open();

                    SqlParameter p1 = new SqlParameter("@Action","Insert");
                    SqlParameter p2 = new SqlParameter("@ProductName", txtprname.Text);
                    SqlParameter p3 = new SqlParameter("@ProductQuantity",txtqty.Text);
                    SqlParameter p4 = new SqlParameter("@ProductAmount",txtprice.Text);
                    SqlParameter p5 = new SqlParameter("@ProductImage",ImageFile);
                    SqlParameter p6 = new SqlParameter("@ProductId", lblmsg.Text);
                    SqlParameter p7 = new SqlParameter("@ProductStatus", lblmsg.Text);
                    SqlParameter p8 = new SqlParameter("@SupplierId",ddsup.SelectedItem.Value);

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
                        string str = "Product has been successfully added!!";
                        Response.Write("<script language=javascript>alert('" + str + "');</script>");
                        txtprice.Text = "";
                        txtprname.Text = "";
                        txtqty.Text = "";
                        ImageFile = "";
                        ddsup.SelectedIndex = -1;
                        lblmsg.Text = "";
                    }
                }
                catch(Exception)
                {
                    lblmsg.Text = "Product is not added/ Wrong Inputs!!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}