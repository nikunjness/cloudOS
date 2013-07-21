<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editor.aspx.cs" Inherits="editor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    
<script type="text/javascript">
         
var adds=new Array();
var i=1;
var ifr;
var ad;
function f()
{
    ifr=document.getElementById("myframe");    
    //ifr.height=window.innerHeight-85+"px";
    //ifr.width=window.innerWidth-50+"px";
    adds[i]=ifr.src;    
    var ad=document.getElementById("ad");
    ad.value=ifr.src;
    
}
function go()
{
        ad=document.getElementById("ad").value;        
        i=i+1;
        var fst=ad.indexOf(".");      
        var lst=ad.lastIndexOf(".");        
        if(lst>=fst)
        {
                if(ifr!=null || ifr!=undefined)
                {
                  
                    var x=ad.search("http://"); 
                                 
                    if(x>-1)
                    {
                        ifr.src=ad;
                        adds[i]=ifr.src;               
                    }
                    else
                    {
                        ifr.src="http://"+ad;
                        adds[i]=ifr.src;            
                    }
                }
                else
                {
                    alert("Browser Not initialized");
                }
        }
        else
        {
            ifr.src="http://www.bing.com/search?q="+ad; 
            document.getElementById("ad").value=ifr.src;
        }
}
function back()
{
            if(i>0)
            {
                i=i-1;
                if(ifr!=null || ifr!=undefined)
                {
                    ifr.src=adds[i];
                    ad.value=adds[i];            
                }
             }
             
}

function fwd()
{

    if(i+1<adds.length)
    {
        i=i+1;
        
        if(ifr!=null || ifr!=undefined)
        {
            ifr.src=adds[i];
            ad.value=adds[i];                  
        }
    }
    
}
function rfrsh()
{
           if(ifr!=null || ifr!=undefined)
        {
            ifr.src=ifr.src;
        }
}
function home()
{
     if(ifr!=null || ifr!=undefined)
        {
            
            ifr.src=adds[1];
            ad.value=adds[1];
            i=i+1;
            adds[i]=ad.value;
        }
}


</script>
</head>
<body onload="f();">
    <form id="form1" runat="server">
    <table style='width:100%;' border='0' cellpadding='0' cellspacing='0'><tr bgcolor='#D1D1D1'><td width='130px'>
    <img id='back' alt='' src='photos/browser/back.png' onclick='back()' />
    <img id='fwd' alt='' src='photos/browser/for.png' onclick='fwd()' />
    <img alt='' src='photos/browser/ref.png' onclick='rfrsh()' /></td>
    <td><input id='ad' type='text' style='width:98%' /></td>
    <td width='110px'><img alt='' src='photos/browser/go.png' onclick='go()' />
    <img alt='' src='photos/browser/home.png' onclick='home()' /></td></tr>
    </table>
    <iframe class='ifrm' id='myframe' scrolling='no' src='http://www.bing.com' width='99.5%' height='99%'></iframe>
    </form>
</body>
</html>
