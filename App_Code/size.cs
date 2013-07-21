using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for size
/// </summary>
public class size
{
   /* public string Size(string virtualPath)
    {
        if (virtualPath == "")
            virtualPath = "/";
        else if (virtualPath.EndsWith("/"))
        virtualPath = virtualPath.Substring(0, virtualPath.Length - 1);
        string physicalPath = Server.MapPath(virtualPath);
        double folderSize = GetFolderSize(physicalPath);
        string strSize = FormatSize(folderSize);
        return strSize;
    }

    private double GetFolderSize(string physicalPath)
    {
        double dblDirSize = 0;
        DirectoryInfo objDirInfo = new DirectoryInfo(physicalPath);
        Array arrChildFiles = objDirInfo.GetFiles();
        Array arrSubFolders = objDirInfo.GetDirectories();
        foreach (FileInfo objChildFile in arrChildFiles)
        {
            dblDirSize += objChildFile.Length;
        }
        foreach (FileInfo objChildFolder in arrSubFolders)
        {
            dblDirSize += GetFolderSize(objChildFolder.FullName);
        }
        return dblDirSize;
    } */
}
