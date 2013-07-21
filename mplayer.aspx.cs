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
public partial class mplayer : System.Web.UI.Page
{
    static string path = "";

    protected void Page_Load(object sender, EventArgs e)
    {
         path="E:/cloudos/UserData/" + Session["UserName"].ToString()+"/";
        if (!IsPostBack)
        {
            FlashVideo1.AutoPlay = false;
            Audio1.AutoPlay = false;
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DirectoryInfo dirInfo = new DirectoryInfo(path);
        FileInfo[] mp3 = dirInfo.GetFiles("*.mp3",SearchOption.AllDirectories);
        FileInfo[] wav = dirInfo.GetFiles("*.wav",SearchOption.AllDirectories);
        FileInfo[] amr = dirInfo.GetFiles("*.amr",SearchOption.AllDirectories);

        FileInfo[] AllResults = new FileInfo[mp3.Length+wav.Length+amr.Length];

        mp3.CopyTo(AllResults, 0);
        wav.CopyTo(AllResults, mp3.Length);
        amr.CopyTo(AllResults, mp3.Length + wav.Length);
        GridView1.DataSource = AllResults;
        GridView1.DataBind();

        FileInfo[] vdo = dirInfo.GetFiles("*.flv", SearchOption.AllDirectories);
        GridView2.DataSource = vdo;
        GridView2.DataBind();
        
       
       
    }
  

    protected void songchng(object sender, EventArgs e)
    {
        Literal lt = (Literal)GridView1.Rows[GridView1.SelectedIndex].FindControl("Literal1");
        string sngurl= lt.Text;
        sngurl=sngurl.Replace("\\", "/");
        sngurl=sngurl.Replace("E:/cloudos","~");
        Audio1.AudioURL = sngurl;
        Audio1.AutoPlay = true;
        FlashVideo1.AutoPlay = false;
        FlashVideo1.Visible = false;
        Image2.Visible = true;
        bground.BgColor = "white";
        PlayButton1.AssociatedControl = "Audio1";
        PauseButton1.AssociatedControl = "Audio1";
        StopButton1.AssociatedControl = "Audio1";
        MuteButton1.AssociatedControl = "Audio1";
        VolumeDownButton1.AssociatedControl = "Audio1";
        VolumeUpButton1.AssociatedControl = "Audio1";



    }

    protected void vdochng(object sender, EventArgs e)
    {
        Literal lt = (Literal)GridView2.Rows[GridView2.SelectedIndex].FindControl("Literal2");
        string vdourl = lt.Text;
        vdourl = vdourl.Replace("\\", "/");
        vdourl = vdourl.Replace("E:/cloudos", "~");
        FlashVideo1.VideoURL = vdourl;
        FlashVideo1.AutoPlay = true;
        Audio1.AutoPlay = false;
        Image2.Visible = false;
        bground.BgColor = "black";
        PlayButton1.AssociatedControl = "FlashVideo1";
        PauseButton1.AssociatedControl = "FlashVideo1";
        StopButton1.AssociatedControl = "FlashVideo1";
        MuteButton1.AssociatedControl = "FlashVideo1";
        VolumeDownButton1.AssociatedControl = "FlashVideo1";
        VolumeUpButton1.AssociatedControl = "FlashVideo1";

    }
}
