using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;

public partial class recovery : System.Web.UI.Page
{
    Class1 con = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        Literal1.Text = "";

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox1.Text != null)
        {
            DataSet ds = new DataSet();
            ds = con.getdata("Select User_Pass,Email from Login_mst where User_Name='"+TextBox1.Text+"'");
            if (ds.Tables[0].Rows.Count == 1)
            {
                string pass = ds.Tables[0].Rows[0][0].ToString();
                string eid = ds.Tables[0].Rows[0][1].ToString();
                string msg;
                MailMessage message = new MailMessage();
                message.From = new MailAddress("cloudos.webdesktop@gmail.com");

                message.To.Add(new MailAddress(eid));

                message.Subject = "CloudOS-Forget Password Request";
                msg="Dear User Kindly collect your password and get connected with cloudOS-The WebDesktop";
                msg += "\n\n\n\n UserName : " + TextBox1.Text;
                msg += "\n\n\n\n Password : " + pass;
                msg += "\n\n\n\n If this request not sent from you Kindly check if your id is stolen?";
                message.Body = msg;
                SmtpClient sm = new SmtpClient("smtp.gmail.com", 25);
                sm.Credentials = new System.Net.NetworkCredential("cloudos.webdesktop@gmail.com", "CLOUDOSADMIN");
                sm.EnableSsl = true;
                sm.Send(message);
                Literal1.Text = "Your Details sent to your Email Id kindly Check it.";




            }
            else
            {
                Literal1.Text = "Password Not Found.Invalid ID";

            }



        }
    }
}
