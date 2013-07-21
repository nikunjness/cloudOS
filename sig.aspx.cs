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
using System.Text;
using Ionic.Zip;
using System.Net;




public partial class signup : System.Web.UI.Page
{
    

  static string fileLoc = @"E:\cloudos\UserData\new.txt";
    static string folderToBrowse;
    static string fpath;
    
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        if (IsPostBack)
        {
            if (folderToBrowse != null)
            {
                if (!folderToBrowse.EndsWith("/"))
                    folderToBrowse = folderToBrowse + "/";
                populate(folderToBrowse);
            }
            else
            {
                folderToBrowse = "E:/cloudos/UserData/Nikunjness/Home";
                populate(folderToBrowse);
            }
        }
        else
        {
            folderToBrowse = "E:/cloudos/UserData/Nikunjness/Home";
            populate(folderToBrowse);
        }
       
    }   
    public void populate(string path)
    {
        string add = path;
        int i = add.IndexOf("/Home");
              
        if(path=="E:/cloudos/UserData/Nikunjness/" || path=="E:/cloudos/UserData/Nikunjness")
        {
            folderToBrowse="E:/cloudos/UserData/Nikunjness/Home";
            populate(folderToBrowse);
        }
        else
        {
            add = add.Remove(0, i);
            addressbar.Value = add; 
           
        //read the folder		
        DirectoryInfo DirInfo = new DirectoryInfo(path);

        //create our datatable that would hold the list
        //of folders in the specified directory
        DataTable fileSystemFolderTable = new DataTable();
        //create our datatable that would hold the list
        //of files in the specified directory
        DataTable fileSystemFileTable = new DataTable();

        //create our datatable that would hold the list
        //of files and folders when we combine the two previously declared datatable
        DataTable fileSystemCombinedTable = new DataTable();

        //create the columns for our file datatable
        DataColumn dcFileIcon = new DataColumn("Icon");
        DataColumn dcFileType = new DataColumn("Type");        
        DataColumn dcFileName = new DataColumn("Name");
        DataColumn dcFileSize = new DataColumn("Size");
       

        //create the columns for our folder datatable
        DataColumn dcFolderIcon = new DataColumn("Icon");
        DataColumn dcFolderType = new DataColumn("Type");        
        DataColumn dcFolderName = new DataColumn("Name");
        DataColumn dcFolderSize = new DataColumn("Size");
        

        //add the columns to our datatable
        fileSystemFolderTable.Columns.Add(dcFileIcon);
        fileSystemFolderTable.Columns.Add(dcFileType);
        fileSystemFolderTable.Columns.Add(dcFileName);
        fileSystemFolderTable.Columns.Add(dcFileSize);
        fileSystemFileTable.Columns.Add(dcFolderIcon);
        fileSystemFileTable.Columns.Add(dcFolderType);
        fileSystemFileTable.Columns.Add(dcFolderName);
        fileSystemFileTable.Columns.Add(dcFolderSize);
        

        //loop thru each directoryinfo object in the specified directory
        foreach (DirectoryInfo di in DirInfo.GetDirectories())
        {
            //create a new row in ould folder table
            DataRow fileSystemRow = fileSystemFolderTable.NewRow();

            //assign the values to our table members
            fileSystemRow["Icon"] = foldericon();
            fileSystemRow["Type"] = "Directory";
            fileSystemRow["Name"] = di.Name;
            fileSystemRow["Size"] = "--";           
            fileSystemFolderTable.Rows.Add(fileSystemRow);
            
        }

        //loop thru each fileinfo object in the specified directory
        foreach (FileInfo fi in DirInfo.GetFiles())
        {
            //create a new row in ould folder table
            DataRow fileSystemRow = fileSystemFileTable.NewRow();

            //assign the values to our table members
            fileSystemRow["Icon"] = fileicon(fi.Extension);
            fileSystemRow["Type"] = fi.Extension;
            fileSystemRow["Name"] = fi.Name;
            fileSystemRow["Size"] = DisplaySize(fi.Length);          
            fileSystemFileTable.Rows.Add(fileSystemRow);
            
           
            
        }

        //copy the folder table to our main datatable,
        //this is necessary so that the parent table would have the
        //schema of our child tables.
        fileSystemCombinedTable = fileSystemFolderTable.Copy();

        //loop thru each row of our file table
        foreach (DataRow drw in fileSystemFileTable.Rows)
        {
            //import the rows from our child table to the parent table
            fileSystemCombinedTable.ImportRow(drw);
        }

        //assign our file system parent table to our grid and bind it.
        GridView1.DataSource = fileSystemCombinedTable;
        GridView1.DataBind();
        }
        
    }
    protected override void Render(System.Web.UI.HtmlTextWriter writer)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                row.Attributes["onmouseover"] =
                   "this.originalstyle=this.style.backgroundColor;this.style.cursor='hand';this.style.background='#0099ff'";
                row.Attributes["onmouseout"] =
                   "this.style.background=this.originalstyle";     
                
              
            }
            
        }
        
       
        base.Render(writer);
    }

    protected void selectindex_changed(object sender, EventArgs e)
    {
        Label lb = GridView1.Rows[GridView1.SelectedIndex].Cells[2].FindControl("Label1") as Label;
        LinkButton lk = (LinkButton)GridView1.Rows[GridView1.SelectedIndex].Cells[0].FindControl("LinkButton1");
        string s = lk.Text;
        switch(lb.Text)
        {
            case "Directory":    
                               
                                folderToBrowse = folderToBrowse + s;
                                populate(folderToBrowse);
                                break;
            case ".txt":                                      
                                fileLoc = folderToBrowse + s;
                                /*string cntnt=null;
                                if (File.Exists(fileLoc))
                                {
                                    using (TextReader tr = new StreamReader(fileLoc))
                                    {
                                       cntnt = tr.ReadToEnd();
                                    }
                                }                              
                               Hidden2.Value = cntnt;
                               //ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: win(); ", true);
                               //cloudos cl = new cloudos();
                               //cl.createwin();  */                            
                               break;
            case ".jpg":
                                
                                string imgloc = folderToBrowse + s;
                               // Image2.ImageUrl = Page.ResolveClientUrl(imgloc);
                                break;
            default:
                                
                                string dldfile=fpath+"\\"+s;
                                dldfile = dldfile.Replace("\\", "/");                                
                                Response.Write("<script> window.open('+dldfile+'); </script>");
                                Response.End(); 
                                break;   
                               
     }
    
}
    #region
    public string foldericon()
    {
        return "~/icons/folder.png";
    }
    public string fileicon(string extnsn)
    {
        if (extnsn == ".pdf")
        {
            return "~/icons/pdf.png";
        }
        else if (extnsn == ".xls")
        {
            return "~/icons/excel.png";
        }
        else if (extnsn == ".doc")
        {
            return "~/icons/word.png";
        }
        else if (extnsn == ".zip")
        {
            return "~/icons/zip.png";
        }
        else if (extnsn == ".swf")
        {
            return "~/icons/swf.png";
        }
        else if (extnsn == ".png")
        {
            return "~/icons/pngfile.png";
        }
        else
        {
            return "~/icons/text.png";
        }
    }
    protected string DisplaySize(long? size)
    {
        if (size == null)
            return string.Empty;
        else
        {
            if (size < 1024)
                return string.Format("{0:N0} bytes", size.Value);
            else
                return String.Format("{0:N0} KB", size.Value / 1024);
        }
    }    
    #endregion 
protected void Button1_Click(object sender, EventArgs e)
{       
        FileStream fs = null;
            if (!File.Exists(fileLoc))
            {
                using (fs = File.Create(fileLoc))
                {
 
                }
            }
        
}
[System.Web.Services.WebMethod]
public static void save(string cntn)
{
    if (File.Exists(fileLoc))
    {
        using (StreamWriter sw = new StreamWriter(fileLoc))
        {
            
            sw.Write(cntn);
        }
    }
}
[System.Web.Services.WebMethod]
public static void rename(string nme)
{
    string filepath = Path.GetFullPath(fpath);        
    string fileext = Path.GetExtension(fpath);
    if(fileext==null || fileext=="")
    {
        string prnt = Directory.GetParent(fpath).ToString();       
        Directory.Move(filepath,prnt+"\\"+nme);
    }
    else
    {
        string d=Path.GetDirectoryName(fpath);
        File.Move(filepath, d + "\\" + nme + fileext);
    }
    
    
}
[System.Web.Services.WebMethod]
public static void upload(string fil)
{
    if (fil != null || fil != "")
    {
        string fn = Path.GetFileName(fil);
        if (!folderToBrowse.EndsWith("/"))
        folderToBrowse = folderToBrowse + "/";
        string fp = folderToBrowse + fn;
        WebClient wc = new WebClient();
        try
        {
            byte[] responseArray = wc.UploadFile(fp, fil);
            System.Text.Encoding.ASCII.GetString(responseArray);
        
        }
        catch (Exception e)
        {
        }
        
        
      

    }


}
protected void Button3_Click(object sender, EventArgs e)
{
    if (File.Exists(fileLoc))
    {
        using (TextReader tr = new StreamReader(fileLoc))
       {
          //Hidden2.Value= tr.ReadToEnd();
       }
    }
}
public string currentfolder()
{
    return folderToBrowse;
}
protected void Grd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("oncontextmenu", "javascript:return showMenu(event," + e.Row.RowIndex + ");");       
         
            
        }
    }
protected void mnu_click(object sender, ImageClickEventArgs e)
{
int rowclicked = Int32.Parse(Hidden1.Value);
ImageButton b1 = (ImageButton)sender;
string command=b1.CommandName;
switch (command)
{
case "Download":
                    Label lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
                    string id = lb.Text;
                    LinkButton lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                    string s = lk.Text;
                    string f = folderToBrowse + s;
                    string strURL;
                    if (id == "Directory")
                    {
                        strURL = compress(f, s,id);

                    }
                    else
                    {
                        strURL = folderToBrowse + s;
                    }                           
                                       
                             WebClient req=new WebClient();
                             HttpResponse response = HttpContext.Current.Response;
                             response.Clear();
                             response.ClearContent();
                             response.ClearHeaders();
                             response.Buffer= true;
                             response.AddHeader("Content-Disposition","attachment;filename=\"" + strURL + "\"");
                             byte[] data=req.DownloadData(strURL);
                             response.BinaryWrite(data);
                             response.End();
                             break;


case "Open":                 lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
                             id = lb.Text;
                             lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                             s = lk.Text;
                             f = folderToBrowse + s;
                             if (id == "Directory")
                             {
                                 populate(f);
                             }
                             break;

case "Duplicate":            lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
                             id = lb.Text;
                             lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                             s = lk.Text;
                             string source = folderToBrowse + s;
                             string ex = Path.GetExtension(source);
                             string fname = Path.GetFileNameWithoutExtension(source);
                             
                             if (id == "Directory")
                             {
                                 DirectoryInfo sourceDir = new DirectoryInfo(source);
                                 DirectoryInfo destinationDir = new DirectoryInfo(folderToBrowse+s+"(1)");

                                 CopyDirectory(sourceDir, destinationDir);

                                 
                             }                             
                             else
                             {
                                 File.Copy(source, folderToBrowse+fname+"(1)"+ex);
                             }
                             populate(folderToBrowse);
                             break;
case "Rename":
                             lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
                             id = lb.Text;              
                             lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                             s = lk.Text;
                             if (id == "Directory")
                             {
                                 fpath = folderToBrowse + s; ;
                             }
                             else
                             {
                                 fpath = folderToBrowse + s;
                             }                             
                             ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: rename(); ", true);
                            
                             break;
case "Copy":
                             lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
                             id = lb.Text;
                             lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                             s = lk.Text;
                             if (id == "Directory")
                             {
                                 ViewState["cpydir"] = folderToBrowse + s;
                             }
                             else
                             {
                                 ViewState["cpyfile"] = folderToBrowse + s;
                             }
                             populate(folderToBrowse);
                            
                             break;

case "Paste":                lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                             s = lk.Text;                           
                             
                             if (ViewState["cpydir"] != null)
                             {
                                 string so = ViewState["cpydir"].ToString();
                                 string cpydest = folderToBrowse + s;
                                 fname = Path.GetFileNameWithoutExtension(cpydest);
                                 cpydest = folderToBrowse + s + "-copy";
                                 DirectoryInfo csource = new DirectoryInfo(so);
                                 DirectoryInfo destination = new DirectoryInfo(cpydest);

                                 CopyDirectory(csource, destination);
                             }
                             if (ViewState["cpyfile"] != null)
                             {
                                 string so=ViewState["cpyfile"].ToString();
                                 ex = Path.GetExtension(so);
                                 fname = Path.GetFileNameWithoutExtension(so);  
                                 File.Copy(so, folderToBrowse + fname + "-copy" + ex);
                             }
                             populate(folderToBrowse);

                             break;
case "Trash":                lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                             s = lk.Text;
                             f = folderToBrowse + s;
                             DirectoryInfo di = new DirectoryInfo(f);
                             di.MoveTo(@"E:\cloudos\UserData\Nikunjness\Home\Trash\"+s);
                             populate(folderToBrowse);
                             break;
case "Compress":             lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
                             id = lb.Text;
                             lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                             s = lk.Text;
                             f = folderToBrowse + s;
                             strURL = compress(f, s, id);
                             populate(folderToBrowse);
                             break;
          }          
}

static void CopyDirectory(DirectoryInfo source, DirectoryInfo destination)
{
    if (!destination.Exists)
    {
        destination.Create();
    }
    // Copy all files.
    FileInfo[] files = source.GetFiles();
    foreach (FileInfo file in files)
    {
        file.CopyTo(Path.Combine(destination.FullName,
            file.Name));
    }
    // Process subdirectories.
    DirectoryInfo[] dirs = source.GetDirectories();
    foreach (DirectoryInfo dir in dirs)
    {
        // Get destination directory.
        string destinationDir = Path.Combine(destination.FullName, dir.Name);

        // Call CopyDirectory() recursively.
        CopyDirectory(dir, new DirectoryInfo(destinationDir));
    }
}

public string compress(string path,string filename,string type)
{
        using (ZipFile zip = new ZipFile())
        {
            if (type == "Directory")
                zip.AddDirectory(path);
            else
                zip.AddFile(path);
            zip.Comment = "This zip was created at " + System.DateTime.Now.ToString("G");
            path = path.Replace(filename, "");
            string add = path + filename + ".zip";
            add.Replace("/", "\\");
            zip.Save(add);
            return add;
        }
        

        

}
protected void ImageButton14_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse="E:/cloudos/UserData/Nikunjness/Home";
    populate(folderToBrowse);
}
protected void ImageButton15_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse = "E:/cloudos/UserData/Nikunjness/Home/Documents";
    populate(folderToBrowse);
}
protected void ImageButton16_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse = "E:/cloudos/UserData/Nikunjness/Home/Music";
    populate(folderToBrowse);
}
protected void ImageButton17_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse = "E:/cloudos/UserData/Nikunjness/Home/Pictures";
    populate(folderToBrowse);

}
protected void ImageButton18_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse = "E:/cloudos/UserData/Nikunjness/Home/Movies";
    populate(folderToBrowse);

}
protected void ImageButton19_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse = "E:/cloudos/UserData/Nikunjness/Home/Trash";
    populate(folderToBrowse);

}
protected void up_Click(object sender, ImageClickEventArgs e)
{
    string add = folderToBrowse;
    int i = add.IndexOf("/Home");
    string k = Directory.GetParent(folderToBrowse).FullName.ToString();
    folderToBrowse = Directory.GetParent(k).FullName.ToString();
    folderToBrowse = folderToBrowse.Replace("\\", "/");
    if (folderToBrowse.Length<=i)
    {
        Response.Write("<script type='text/javascript'>alert('dont have permission')</script>");
        folderToBrowse = add;

    }
    else
    {
        
        populate(folderToBrowse);
    }

}


protected void folder_Click(object sender, ImageClickEventArgs e)
{
    int i = 0;
    string currentfolder = folderToBrowse;
    string createfolder;
    if (currentfolder.EndsWith("/"))
        createfolder = currentfolder + "NewFolder";
    else
        createfolder = currentfolder + "/NewFolder";
    
    while(Directory.Exists(createfolder))
    {
        if (createfolder.EndsWith(i.ToString()))
        createfolder = currentfolder + "NewFolder";
        i++;
        createfolder = createfolder + i;            
        
    }
    System.IO.Directory.CreateDirectory(createfolder);
    populate(folderToBrowse);

}
protected void file_Click(object sender, ImageClickEventArgs e)
{
    int i = 0;
    string currentfolder = folderToBrowse;
    string createfile;
    if (currentfolder.EndsWith("/"))
        createfile = currentfolder + "Untitled.txt";
    else
        createfile = currentfolder + "/";

    while (File.Exists(createfile))
    {
        string filep = Path.GetFileNameWithoutExtension(createfile);
        if (filep.EndsWith(i.ToString()))
        {
            createfile = currentfolder + "Untitled.txt";
            filep = Path.GetFileNameWithoutExtension(createfile);
        }
        i++;
        createfile =currentfolder+ filep + i+".txt";

    }
    System.IO.File.Create(createfile);
    populate(folderToBrowse);

   
}
}




  

  /* protected void Button1_Click(object sender, EventArgs e)
   {
       String thisDir = Server.MapPath("./UserData/");
       System.IO.Directory.CreateDirectory(thisDir + "\\Nikunjness");
       thisDir = Server.MapPath("./UserData/Nikunjness");
       System.IO.Directory.CreateDirectory(thisDir + "\\Home");
       thisDir = Server.MapPath("./UserData/Nikunjness/Home");
       System.IO.Directory.CreateDirectory(thisDir + "\\My Documents");
       System.IO.Directory.CreateDirectory(thisDir + "\\My pictures");
       System.IO.Directory.CreateDirectory(thisDir + "\\My Videos");
       System.IO.Directory.CreateDirectory(thisDir + "\\Trash");

   }*/

  
  /* protected void Button1_Click(object sender, EventArgs e)
   {
        string strinp;
        strinp = Server.MapPath("~/UserData/Nikunjness/Home/My Videos/chup.mp4").ToString();

        string strop;
        strop = Server.MapPath("~/UserData/Nikunjness/Home/My Videos/chup.flv");

        Process prs=null;
        try
        {
        ProcessStartInfo info = new ProcessStartInfo(Server.MapPath("~/Bin/ffmpeg.exe"));

        info.Arguments = "-i \"" + strinp + "\" \"" + strop + "\"";

        prs = Process.Start(info);
        prs.Start();
        prs.Kill();
        }
        catch (Exception ex)
        {
        //catch error here
            Response.Write(ex);
        prs.Kill();
        }
   }*/
    /*CAVConverter converter = null;
//Create the converter
converter = new CAVConverter();
//Set the license key
converter.SetLicenseKey("Demo", "Demo");
//Set the log path. If the log path is null, no log output
converter.LogPath = @"C:\Log\Log.txt";

//Set output video frame size
converter.OutputOptions.FrameSize = "640x480";
//Set output video bitrate
converter.OutputOptions.VideoBitrate = 2000000; 
//Add convert task
converter.AddTask(@"C:\SampleVideos\Wildlife.wmv", @"C:\SampleVideos\Wildlife-new.mp4");
//Start convert and wait for complete
converter.StartAndWait();*/

   


