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

public partial class upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        fileview d = new fileview();
        string current = d.currentfolder();
        if (FileUpload1.HasFile)
        {
            try
            {
                string fname = FileUpload1.PostedFile.FileName;
                string fpath;
                if (!current.EndsWith("/"))
                {
                    fpath = current + "/" + fname;
                }
                else
                {
                    fpath = current + fname;
                }
                FileUpload1.PostedFile.SaveAs(fpath);
                string[] vdo = { ".mp4", ".wmv", ".rm", ".3gp"};
                foreach (string type in vdo)
                {
                    if (type == Path.GetExtension(fpath))
                    {
                        string strinp;
                        strinp = fpath.ToString();
                        fname = Path.GetFileNameWithoutExtension(fpath);
                        string prnt = Directory.GetParent(fpath).ToString();
                        if (!prnt.EndsWith("/") || !prnt.EndsWith("\\"))
                            prnt = prnt + "\\";
                        if (prnt.StartsWith("E:/cloudos"))
                            prnt = prnt.Replace("E:/cloudos", "~");
                        if (prnt.StartsWith("E:\\cloudos"))
                            prnt = prnt.Replace("E:\\cloudos", "~");
                        string strop;
                        strop = Server.MapPath(prnt + fname + ".flv");
                        Process proc;
                        proc = new Process();
                        string filargs = "-i " + strinp + " -ar 22050 " + strop;
                        proc.StartInfo.FileName = Server.MapPath("~/Bin/ffmpeg.exe").ToString();
                        proc.StartInfo.Arguments = filargs;
                        proc.StartInfo.UseShellExecute = false;
                        proc.StartInfo.CreateNoWindow = false;
                        proc.StartInfo.RedirectStandardOutput = false;
                        try
                        {
                            proc.Start();
                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                        }
                        proc.WaitForExit();
                        proc.Close();
                        if (File.Exists(strinp))
                            File.Delete(strinp);

                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Unable to upload file.Try Again.");

            }
        }

    }
}