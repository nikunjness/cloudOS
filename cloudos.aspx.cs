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
using System.IO;
using System.Text;
using Ionic.Zip;
using System.Net;

public partial class cloudos : System.Web.UI.Page
{
    static string fileLoc = "";
    static string currentfile;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("signin.aspx");
        }
        else
        {
            fileLoc = "E:/cloudos/UserData/" + Session["UserName"].ToString() + "/Home/Documents/";
            Literal1.Text = Session["UserName"].ToString();
        }
        


    }
    [System.Web.Services.WebMethod]
    public static void create(string fname)
    {

        string newfile;
        if(!fname.EndsWith(".txt"))
             newfile = fileLoc + fname + ".txt";
        else
             newfile = fileLoc + fname;
        if (!File.Exists(newfile))
        {
            FileStream fs = File.Open(newfile, FileMode.CreateNew, FileAccess.ReadWrite);
            currentfile = newfile;

        }



    }
    [System.Web.Services.WebMethod(EnableSession=true)]
    public static string open(string fname)
    {
        string name = fname;
        if (!fname.EndsWith(".txt"))
         name = fname + ".txt";
        string path = "E:/cloudos/UserData/" + System.Web.HttpContext.Current.Session["UserName"].ToString() + "/";
        string[] fpath = Directory.GetFiles(path, name, SearchOption.AllDirectories);
        if (fpath.Length == 1)
        {
            if (File.Exists(fpath[0]))
            {
                string cntnt = File.ReadAllText(fpath[0]);
                currentfile = fpath[0];
                return cntnt;
            }
            else
            {
                return "fail";
            }
        }
        else if (fpath.Length >= 1)
            return "more";
        else
            return "fail";
    
    }
    [System.Web.Services.WebMethod]
    public static string save(string cntn)
    {
        try
        {
            if (File.Exists(currentfile))
            {
                File.WriteAllText(currentfile, cntn);
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Page.ClientScript.RegisterStartupScript(this.GetType(),"Javascript", "block();", true);
        
       
    }
}
