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
using System.Data.SqlClient;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter adp;
	public Class1()
	{
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        	
	}
    public DataSet getdata(String query)
    {
        cmd = new SqlCommand();
        cmd.CommandText = query;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        adp = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();
        adp.Fill(ds);
        return ds;
    }
    public void InsertData(string query)
    {
        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void updateData(string query)
    {
        SqlCommand cmd = new SqlCommand(query,con);
        con.Open();
        cmd.ExecuteReader();
        con.Close();
    }
    public void deleteData(string query)
    {
        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    
        
    

}
