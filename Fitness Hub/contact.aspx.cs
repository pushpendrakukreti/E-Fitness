using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            using (MailMessage mm = new MailMessage("sender@gmail.com", "receiver@gmail.com"))
            {
                mm.Subject = txtsubject.Text;
                mm.Body = "Name = "+txtname.Text+ "<br> Email Id = "+txtemail.Text+ "<br>Message = " +txtmsg.Text;
                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("sender@gmail.com", "senderpassword");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
            }
        }
    }
}