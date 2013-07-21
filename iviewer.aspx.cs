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
using System.Diagnostics;
using System.IO;

public partial class iviewer : System.Web.UI.Page
{
    string path = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        path = "E:/cloudos/UserData/" + Session["UserName"].ToString() + "/Home/";

    }   
    public void bind()
    {
        DirectoryInfo dirInfo = new DirectoryInfo(path);
        FileInfo[] gif = dirInfo.GetFiles("*.gif", SearchOption.AllDirectories);
        FileInfo[] jpg = dirInfo.GetFiles("*.jpg", SearchOption.AllDirectories);
        FileInfo[] png = dirInfo.GetFiles("*.png", SearchOption.AllDirectories);

        FileInfo[] AllResults = new FileInfo[gif.Length + jpg.Length + png.Length];

        gif.CopyTo(AllResults, 0);
        jpg.CopyTo(AllResults, gif.Length);
        png.CopyTo(AllResults, gif.Length + jpg.Length);
        GridView1.DataSource = AllResults;
        GridView1.DataBind();
    }





    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Literal lt = (Literal)GridView1.Rows[GridView1.SelectedIndex].FindControl("Literal1");
        string imgurl = lt.Text;
        imgurl = imgurl.Replace("\\", "/");
        imgurl = imgurl.Replace("E:/cloudos", "~");
        Image2.ImageUrl = imgurl;


    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ad = (e.Row.Cells[0].FindControl("ImageButton1") as ImageButton).ImageUrl;
            ad = ad.Replace("\\", "/");
            ad = ad.Replace("E:/cloudos", "~");
            (e.Row.Cells[0].FindControl("ImageButton1") as ImageButton).ImageUrl = ad;

        }

    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bind();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        bind();

    }
}