using System;
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

public partial class fileview : System.Web.UI.Page 
{


   
    static string folderToBrowse;
    static string fpath;
    static string usrpath;
    
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
            usrpath="E:/cloudos/UserData/" + Session["UserName"].ToString();
            //usrpath = "E:/cloudos/UserData/nikunjness";
            
           
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
                folderToBrowse = usrpath+"/Home";
                populate(folderToBrowse);
            }
        }
        else
        {
            folderToBrowse = usrpath+"/Home";
            populate(folderToBrowse);
        }
       
    }   
public void populate(string path)
{
    try
    {
        string add = path;
        int i = add.IndexOf("/Home");
        if (path == usrpath+"/" || path == usrpath)
        {
            folderToBrowse = usrpath+"/Home";
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
    catch(Exception ex)
    {
        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Unable to perform Operation'); ", true);
    }
}
protected override void Render(System.Web.UI.HtmlTextWriter writer)
{
    try
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                row.Attributes["onmouseover"] = "this.originalstyle=this.style.backgroundColor;this.style.cursor='hand';this.style.background='#0099ff'";
                row.Attributes["onmouseout"] = "this.style.background=this.originalstyle";
            }
        }
            base.Render(writer);
    }
    catch (Exception ex)
    {
        Response.Redirect("fileview.aspx");
    }
}
protected void selectindex_changed(object sender, EventArgs e)
{
    try
    {
        Label lb = GridView1.Rows[GridView1.SelectedIndex].Cells[2].FindControl("Label1") as Label;
        LinkButton lk = (LinkButton)GridView1.Rows[GridView1.SelectedIndex].Cells[0].FindControl("LinkButton1");
        string s = lk.Text;
        if (lb.Text == "Directory")
        {
            try
            {
                folderToBrowse = folderToBrowse + s;
                populate(folderToBrowse);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Unable to perform Operation'); ", true);
            }
        }
    }
    catch (Exception ex)
    {
        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Operation Failed.Reload The Filemanager'); ", true);
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
        return "~/icons/pdf.png";
    else if (extnsn == ".xls")
        return "~/icons/excel.png";
    else if (extnsn == ".doc")
        return "~/icons/word.png";
    else if (extnsn == ".zip")
        return "~/icons/zip.png";
    else if (extnsn == ".swf")
        return "~/icons/swf.png";
    else if (extnsn == ".png")
        return "~/icons/pngfile.png";
    else if (extnsn == ".gif")
        return "~/icons/gif.png";
    else if (extnsn == ".jpg" || extnsn == ".jpeg")
        return "~/icons/jpg.png";
    else
        return "~/icons/text.png";
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


[System.Web.Services.WebMethod]
public static void rename(string nme)
{
    try
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
    catch(Exception ex)
    {
         //ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Unable to Rename the File'); ", true);
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
    Label lb;
    LinkButton lk;
    string s, f, strURL,id;
int rowclicked = Int32.Parse(Hidden1.Value);
ImageButton b1 = (ImageButton)sender;
string command=b1.CommandName;
switch (command)
{
case "Download":
                    try
                    {
                        lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
                        id = lb.Text;
                        lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                        s = lk.Text;
                        f = folderToBrowse + s;                        
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
                             string fn = Path.GetFileName(strURL);
                             response.AddHeader("Content-Disposition","attachment;filename=\"" + fn + "\"");
                             byte[] data=req.DownloadData(strURL);
                             response.BinaryWrite(data);
                             if(id=="Directory")
                             {
                                 FileInfo fi = new FileInfo(strURL);
                                 fi.Delete();
                             }
                             response.End();
                            
                             
                             break;
                    }
                    catch(Exception ex)
                    {
                         ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Downloading failed'); ", true);
                         break;
                    }


case "Open":  
                            try
                            {

                                lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
                                id = lb.Text;
                                lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                                s = lk.Text;
                                f = folderToBrowse + s;
                                if (id == "Directory")
                                {
                                    populate(f);
                                }
                                break;
                            }
                            catch(Exception ex)
                            {
                                 ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Unable to Open the file'); ", true);
                                 break;
                            }
                               

case "Duplicate":
                             try
                             {
                                lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
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
                             }
                              catch(Exception ex)
                             {
                                   ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Operation Failed'); ", true);
                                   break;
                             }
case "Rename":
                             try
                             {
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
                             }
                             catch(Exception ex)
                             {
                                  ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Unable to perform Operation'); ", true);
                                 break;
                             }
case "Copy":

                             try
                             {
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
                             }
                             catch(Exception ex)
                             {
                                  ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Cant Copy the file'); ", true);
                                  break;
                             }

case "Paste":                try
                             {
                                lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                                s = lk.Text;                           
                             
                                if (ViewState["cpydir"] != null)
                                {
                                    string so = ViewState["cpydir"].ToString();
                                    string cpydest = folderToBrowse + s;
                                    string fname = Path.GetFileNameWithoutExtension(cpydest);
                                    cpydest = folderToBrowse + s + "-copy";
                                    DirectoryInfo csource = new DirectoryInfo(so);
                                    DirectoryInfo destination = new DirectoryInfo(cpydest);
                                    CopyDirectory(csource, destination);
                                    populate(folderToBrowse);
                                    break;
                                }                               
                                else if (ViewState["cpyfile"] != null)
                                {
                                    string so=ViewState["cpyfile"].ToString();
                                    string ex = Path.GetExtension(so);
                                    string fname = Path.GetFileNameWithoutExtension(so);  
                                    File.Copy(so, folderToBrowse + fname + "-copy" + ex);
                                    populate(folderToBrowse);
                                    break;
                                }
                                else
                                {
                                    ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Nothing To Copy'); ", true);
                                    populate(folderToBrowse);
                                    break;
                                }
                                
                             }
                            catch(Exception ex)
                            {
                                ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Unable to Paste'); ", true);
                                populate(folderToBrowse);
                                break;
                            }
case "Trash":               
                             try
                             {
                                lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
                                id = lb.Text;
                                lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                                s = lk.Text;
                                f = folderToBrowse + s;
                                DirectoryInfo di = new DirectoryInfo(f);
                               
                                 if(f=="E:/cloudos/UserData/"+Session["UserName"].ToString()+"/Home/Trash/"+s)
                                 {
                                     if (id == "Directory")
                                     {
                                          di.Delete();
                                         populate(folderToBrowse);
                                     }
                                     else
                                     {
                                         FileInfo fi = new FileInfo(f);
                                         fi.Delete();
                                         populate(folderToBrowse);
                                     }
                                 }
                                 else
                                 {
                                    di.MoveTo(usrpath + "/Home/Trash/" + s);
                                    //di.MoveTo(@"E:\cloudos\UserData\Nikunjness\Home\Trash\"+s);
                                    populate(folderToBrowse);
                                 }
                                    break;
                             }
                             catch(Exception ex)
                             {
                                 ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Operation Failed'); ", true);
                                 populate(folderToBrowse);
                                 break;
                             }
case "Compress":
                              try
                              {
                                lb = GridView1.Rows[rowclicked].Cells[2].FindControl("Label1") as Label;
                                id = lb.Text;
                                lk = (LinkButton)GridView1.Rows[rowclicked].Cells[0].FindControl("LinkButton1");
                                s = lk.Text;
                                f = folderToBrowse + s;
                                strURL = compress(f, s, id);
                                populate(folderToBrowse);
                                 break;
                              }
                                catch(Exception ex)
                              {
                                    ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Operation Failed'); ", true);
                                    break;


                              }
}          
}

public void CopyDirectory(DirectoryInfo source, DirectoryInfo destination)
{
    try
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
    catch(Exception ex)
    {
       ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Operation Failed'); ", true);
    }
}

public string compress(string path,string filename,string type)
{
    try
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
    catch(Exception ex)
    {
        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Unable to compress the file'); ", true);
        return null;
    }    

}
protected void ImageButton14_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse=usrpath+"/Home";
    populate(folderToBrowse);
}
protected void ImageButton15_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse = usrpath+"/Home/Documents";
    populate(folderToBrowse);
}
protected void ImageButton16_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse = usrpath+"/Home/Music";
    populate(folderToBrowse);
}
protected void ImageButton17_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse = usrpath+"/Home/Pictures";
    populate(folderToBrowse);

}
protected void ImageButton18_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse = usrpath+"/Home/Movies";
    populate(folderToBrowse);

}
protected void ImageButton19_Click(object sender, ImageClickEventArgs e)
{
    folderToBrowse = usrpath+"/Home/Trash";
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
        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Access Denied'); ", true);
        folderToBrowse = add;
    }
    else
    {        
        populate(folderToBrowse);
    }

}
protected void folder_Click(object sender, ImageClickEventArgs e)
{
    try
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
    catch(Exception ex)
    {
        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Unable to create new directory'); ", true);
        populate(folderToBrowse);
    }
}
protected void file_Click(object sender, ImageClickEventArgs e)
{
    try
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
    catch(Exception ex)
    {
        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript: error('Unable to create new file'); ", true);
        populate(folderToBrowse);
    }

   
}
}

