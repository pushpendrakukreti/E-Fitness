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
    public partial class Schedule : System.Web.UI.Page
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
                lblmessage.Text = "";
                SqlCommand cmd = new SqlCommand("spSchedule", con);
                cmd.CommandType = CommandType.StoredProcedure;

                string ImageFile = "";
                string VideoFile = "";
                if (filephoto.HasFile && filevideo.HasFile)
                {
                    string imgPath = "~/Upload/images/";
                    string videoPath = "~/Upload/videos/";
                    string thumbPath = "~/Upload/thumbnails/";

                    ImageFile = Path.GetFileName(Server.MapPath(filephoto.PostedFile.FileName));
                    VideoFile = Path.GetFileName(Server.MapPath(filevideo.PostedFile.FileName));
                    ImageFile = ImageFile.Replace(" ", "-");
                    VideoFile = VideoFile.Replace(" ", "-");
                    ImageFile = System.DateTime.Now.ToString("yyyyMMddHHmmss") + "-" + ImageFile;
                    VideoFile = System.DateTime.Now.ToString("yyyyMMddHHmmss") + "-" + VideoFile;
                    thumbPath = thumbPath + ImageFile;
                    System.Drawing.Bitmap bmpUploadedImage = new System.Drawing.Bitmap(filephoto.PostedFile.InputStream);
                    //System.Drawing.Image objImage = ScaleImage(bmpUploadedImage, 170);

                    imgPath = imgPath + ImageFile;
                    videoPath = videoPath + VideoFile;
                    filephoto.SaveAs(MapPath(imgPath));
                    filevideo.SaveAs(MapPath(videoPath));
                }
                else
                {
                    ImageFile = "";
                    ImageFile = "";
                    VideoFile = "";
                }
                try
                {
                    con.Open();

                    SqlParameter p1 = new SqlParameter("@Action", "Insert");
                    SqlParameter p2 = new SqlParameter("@ScheduleName", txtname.Text);
                    SqlParameter p3 = new SqlParameter("@ScheduleTiming", txtTiming.Text);
                    SqlParameter p4 = new SqlParameter("@ScheduleDay", ddDay.SelectedItem.Text);
                    SqlParameter p5 = new SqlParameter("@ScheduleReps", txtReps.Text);
                    SqlParameter p6 = new SqlParameter("@ScheduleVideos", VideoFile);
                    SqlParameter p7 = new SqlParameter("@ScheduleType", ddType.SelectedItem.Text);
                    SqlParameter p8 = new SqlParameter("@ScheduleImage", ImageFile);
                    SqlParameter p10 = new SqlParameter("@ScheduleId", lblmessage.Text);

                    cmd.Parameters.Add(p1);
                    cmd.Parameters.Add(p2);
                    cmd.Parameters.Add(p3);
                    cmd.Parameters.Add(p4);
                    cmd.Parameters.Add(p5);
                    cmd.Parameters.Add(p6);
                    cmd.Parameters.Add(p7);
                    cmd.Parameters.Add(p8);
                    cmd.Parameters.Add(p10);

                    int k = cmd.ExecuteNonQuery();
                    if (k != 0)
                    {
                        string str = "Schedule has been successfully added!!";
                        Response.Write("<script language=javascript>alert('" + str + "');</script>");
                        txtname.Text = "";
                        txtReps.Text = "";
                        txtTiming.Text = "";
                        lblmessage.Text = "";
                        ddDay.SelectedIndex = -1;
                        ddType.SelectedIndex = -1;
                        VideoFile = "";
                        ImageFile = "";
                    }
                }
                catch (Exception ex)
                {
                    lblmessage.Text = ex.ToString();
                    lblmessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}