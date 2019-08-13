using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration;

namespace Fitness_Hub.admin
{
    public partial class Trainer : System.Web.UI.Page
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
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spTrainer", con);
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

                    SqlParameter p1 = new SqlParameter("@Action", "Insert");
                    SqlParameter p2 = new SqlParameter("@TrainerName", txtname.Text);
                    SqlParameter p3 = new SqlParameter("@TrainerDOB", txtage.Text);
                    SqlParameter p4 = new SqlParameter("@TrainerEmail", txtemail.Text);
                    SqlParameter p5 = new SqlParameter("@TrainerGender", genderDDlist.SelectedItem.Value);
                    SqlParameter p6 = new SqlParameter("@TrainerPhone", txtphone.Text);
                    SqlParameter p7 = new SqlParameter("@TrainerImage", ImageFile);
                    SqlParameter p8 = new SqlParameter("@TrainerAddress", txtaddress.Text);
                    SqlParameter p9 = new SqlParameter("@TrainerPassword", txtpassconf.Text);
                    SqlParameter p10 = new SqlParameter("@TrainerId", lblmessage.Text);

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

                    int k = cmd.ExecuteNonQuery();
                    if (k!=0)
                    {
                        string str = "Trainer has been successfully added!!";
                        Response.Write("<script language=javascript>alert('" + str + "');</script>");
                        txtaddress.Text = "";
                        txtage.Text = "";
                        txtemail.Text = "";
                        txtname.Text = "";
                        txtpass.Text = "";
                        txtpassconf.Text = "";
                        txtphone.Text = "";
                        genderDDlist.SelectedIndex = -1;
                        ImageFile = "";
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