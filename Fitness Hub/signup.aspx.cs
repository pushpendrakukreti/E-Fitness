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
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["GymCon"].ConnectionString;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUser", con);
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
                    //System.Drawing.Image objImage = ScaleImage(bmpUploadedImage, 170);

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

                    SqlParameter p1 = new SqlParameter("@Action", "INSERT");
                    SqlParameter p2 = new SqlParameter("@UserName", txtname.Text);
                    SqlParameter p3 = new SqlParameter("@UserDOB", Convert.ToDateTime(txtDOB.Text.ToString()));
                    SqlParameter p4 = new SqlParameter("@UserEmail", txtmail.Text);
                    SqlParameter p5 = new SqlParameter("@UserGender", genderDDlist.SelectedItem.Value);
                    SqlParameter p6 = new SqlParameter("@UserPhone", txtPhone.Text);
                    SqlParameter p7 = new SqlParameter("@UserImage", ImageFile);
                    SqlParameter p8 = new SqlParameter("@UserHeight", Convert.ToDecimal(txtHeight.Text));
                    SqlParameter p9 = new SqlParameter("@UserWeight",txtWeight.Text);
                    SqlParameter p10 = new SqlParameter("@UserId", lblmsg.Text);
                    SqlParameter p11 = new SqlParameter("@UserPassword", txtconpass.Text);
                    SqlParameter p12 = new SqlParameter("@UserStatus", lblresult.Text);

                    cmd.Parameters.Add(p1);
                    cmd.Parameters.Add(p2);
                    cmd.Parameters.Add(p3);
                    cmd.Parameters.Add(p4);
                    cmd.Parameters.Add(p5);
                    cmd.Parameters.Add(p6);
                    cmd.Parameters.Add(p7);
                    cmd.Parameters.Add(p8);
                    cmd.Parameters.Add(p9);
                    cmd.Parameters.Add(p10);
                    cmd.Parameters.Add(p11);
                    cmd.Parameters.Add(p12);

                    int k = cmd.ExecuteNonQuery();

                    if (k != 0)
                    {
                        lblmsg.Text = "You are Successfully Registered";
                        lblmsg.ForeColor = System.Drawing.Color.LightGreen;
                    }
                }
                catch (Exception)
                {
                    lblmsg.Text = "Wrong Input/ All Columns Must Be Filled!!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}