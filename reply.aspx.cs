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

public partial class reply : System.Web.UI.Page
{
    Class1 con = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["username"]==null)
        Response.Redirect("adlogin.aspx");
        else
        {
            if (!IsPostBack)
            {
                bind();
            }
        }


    }
    public void bind()
    {
        DataSet ds = new DataSet();
        ds = con.getdata("Select * from Support_mst");
        GridView1.DataSource = ds;
        GridView1.DataBind();


    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string eid = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text;
        Response.Redirect("sendmail.aspx?eid=" + eid);
    }
}
