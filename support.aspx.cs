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

public partial class support : System.Web.UI.Page
{
    Class1 con = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        Literal1.Text = "";

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string type, sub, email, msg;
            type = DropDownList1.SelectedValue.ToString();
            sub = TextBox1.Text;
            email = TextBox2.Text;
            msg = TextBox3.Text;
            if (Page.IsValid)
            {
                con.InsertData("insert into Support_mst(Type,Subject,Email,Message) values('" + type + "','" + sub + "','" + email + "','" + msg + "')");
                Literal1.Text = "Your Query was successfully registered";

            }
        }
        catch (Exception ex)
        {
            Literal1.Text="Your Query was not successfully registered.Please try again";
        }
    }
}
