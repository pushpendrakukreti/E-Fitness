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

namespace Fitness_Hub.admin
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetProduct();
            }
        }
        public void GetProduct()
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                string com = "Select * from Supplier";
                con.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                ddsup.DataSource = dt;
                ddsup.DataBind();
                ddsup.DataTextField = "SupplierName";
                ddsup.DataValueField = "SupplierId";
                ddsup.DataBind();
            }
        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["GymCon"].ConnectionString;
        }

        protected void btnsub_Click(object sender, EventArgs e)
        {
            GetProduct();
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spInventory", con);
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

                    SqlParameter p1 = new SqlParameter("@Action", "Insert");
                    SqlParameter p2 = new SqlParameter("@ProductName", txtprname.Text);
                    SqlParameter p3 = new SqlParameter("@ProductQuantity", txtqty.Text);
                    SqlParameter p4 = new SqlParameter("@ProductAmount", txtprice.Text);
                    SqlParameter p5 = new SqlParameter("@ProductImage", ImageFile);
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
                        Response.Write("<script>var str  = 'Order has been Placed Successfully!!'; var result = str.fontcolor(green); alert(str)</script>");
                        //lblmsg.Text = "Record Inserted Succesfully into the Database";
                        //lblmsg.ForeColor = System.Drawing.Color.Green;
                        txtprname.Text = "";
                        txtprice.Text = "";
                        txtqty.Text = "";
                        ImageFile = "";
                        lblmsg.Text = "";
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