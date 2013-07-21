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

public partial class signup : System.Web.UI.Page
{
    Class1 con = new Class1();  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            TextBox2.Focus();
        }
        

    }
   
   
    protected void Username_Changed(object sender, EventArgs e)
    {
        try
        {
            String s = TextBox1.Text;
            if (s.Length >= 6)
            {
                DataSet ds = con.getdata("select * from Login_mst where User_Name='" + s + "'");
                int result = ds.Tables[0].Rows.Count;

                if (result > 0)
                {
                    UserAvailability.InnerText = "Username taken, sorry.";
                    UserAvailability.Attributes.Add("class", "taken");
                }
                else
                {
                    UserAvailability.InnerText = "Username available!";
                    UserAvailability.Attributes.Add("class", "available");

                }
            }
            else
                UserAvailability.InnerText = "Username Must be atleast 6 characters long";
        }
        catch (Exception ex)
        {
            Response.Write("There may be some problem.Please try again!!");
        }
            
            
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {

                con.InsertData("insert into Login_mst(User_Name,User_Pass,Email) values('" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')");
                string uname = TextBox1.Text;
                String thisDir = Server.MapPath("./UserData/");
                System.IO.Directory.CreateDirectory(thisDir + "\\" + uname);
                thisDir = Server.MapPath("./UserData/" + uname);
                System.IO.Directory.CreateDirectory(thisDir + "\\Home");
                thisDir = Server.MapPath("./UserData/" + uname + "/Home");
                System.IO.Directory.CreateDirectory(thisDir + "\\Documents");
                System.IO.Directory.CreateDirectory(thisDir + "\\Movies");
                System.IO.Directory.CreateDirectory(thisDir + "\\Music");
                System.IO.Directory.CreateDirectory(thisDir + "\\Pictures");
                System.IO.Directory.CreateDirectory(thisDir + "\\Trash");

                Response.Redirect("cloudos.aspx");

            }
            else
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
            }
        }
        catch (Exception ex)
        {
            Response.Write("Your account was not successfully created.Please try again");
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
    }
}
