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



public partial class sendmail : System.Web.UI.Page
{
    static string sndr = "cloudos.webdesktop@gmail.com";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["eid"] != null)
            {
                string rcvr = Request.QueryString["eid"].ToString();
                txtTo.Text = rcvr;
                txtTo.ReadOnly = true;
            }
            else
            {
                txtTo.Text = "";
                txtSubject.Text = "";
                txtContent.Value = "";
            }
        }
        txtFrom.Text = sndr.ToString();

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(txtFrom.Text);

            message.To.Add(new MailAddress(txtTo.Text));

            message.Subject = txtSubject.Text;
            message.Body = txtContent.Value;

            SmtpClient sm = new SmtpClient("smtp.gmail.com", 25);
            sm.Credentials = new System.Net.NetworkCredential("cloudos.webdesktop@gmail.com", "CLOUDOSADMIN");
            sm.EnableSsl = true;
            sm.Send(message);
            lblStatus.Text = "Messege sent";
            txtTo.Text = "";
            txtSubject.Text = "";
            txtContent.Value = "";
        }
        catch (Exception ex)
        {
            lblStatus.Text = "Your messege can not be sent." + ex;
        }
        
        
    }
   


  
    }

