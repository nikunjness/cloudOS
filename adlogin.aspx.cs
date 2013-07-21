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

public partial class adlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Services.WebMethod(EnableSession = true)]
    public static string Validate(string uname, string pwd)
    {
        try
        {
            if (uname == null && pwd == null)
                return "fail";
            Class1 cn = new Class1();
            DataSet ds = new DataSet();
            ds = cn.getdata("select * from Admin_mst where Admin_Name='" + uname + "' and Admin_Pass='" + pwd + "'");
            if (ds.Tables[0].Rows.Count == 1)
            {
                HttpContext.Current.Session["username"] = uname;
                return "success";
            }
            else
            {
                return "fail";
            }
        }
        catch (Exception ex)
        {
            return "fail";

        }

    }
}
