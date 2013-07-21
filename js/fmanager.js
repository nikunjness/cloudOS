     
     
        document.documentElement.onclick = hideMenu;
        /**Department Menu**/
        var MenuObj;
        var temp;        
        var MSIE = navigator.userAgent.indexOf('MSIE') ? true : false;
        var navigatorVersion = navigator.appVersion.replace(/.*?MSIE (\d\.\d).*/g, '$1') / 1;
        var activeMenuItem = false;       
        function showMenu(e,row)
        {
            
            var myMouseX = (e || event).clientX;
            var myMouseY = (e || event).clientY;
            MenuObj.style.left = myMouseX + 'px';
            MenuObj.style.top = myMouseY + 'px';
            MenuObj.style.display = 'block';
            document.getElementById("Hidden1").value=row;
            
            return false;
        }

        //Function to hide menu on click of menu item
        function hideMenu(e)
        {
                if (document.all) e = event;
                if (e.button == 0)
                {
                 MenuObj.style.display = 'none';
                    if(temp==0)
                    {
                        document.getElementById("popup").style.display='none';
                    }
                    else
                    {
                        temp=0;
                    }                        
                }
        }

        function initMenu()
        {
            MenuObj = document.getElementById('Menu');     
            MenuObj.style.display = 'none';
        }        
        function rename()
        {
             var str="<Div style='height:100%;background-color:#dfdfdf'>Enter File Name:<br />";
             str+="<input type='text' id='val' /><input type='button' value='Rename' onclick='dorename()' /></div>";             
             $.newWindow
             ({id:"rnm",
             posx:400,posy:50,
             width:200,height:100,
             title:"Rename",
             content:str,
             resizeable: false,
             modal:true,
             minimizeButton: false,
             maximizeButton: false});
        }
        function dorename()
        {
            var name=document.getElementById("val").value;
            if(name !=null || name !="")               
            PageMethods.rename(name);
            __doPostBack('rename','name');
            $("#" + "rnm" + " .window-closeButton").click();
       }
       function show()
       {
            var obj=document.getElementById("popup");  
            obj.style.display = 'block';
            temp=1;
            
       }
       function upload()
       {
             var str="<iframe class='ifrm' id='myframe' scrolling='no' src='upload.aspx' width='99%' height='98%'></iframe>";             
             $.newWindow
             ({id:"upload",
             posx:400,posy:100,
             width:350,height:200,
             title:"File Drop",
             content:str,
             resizeable: false,
             modal:true});                            
          
       }       
       function error(msg)
       {
         var str="<div id='error'><br /><br /><img src='photos/error.png'>            "+msg+"</div>";
         $.newWindow
             ({id:"error",
             posx:300,posy:300,
             width:350,height:100,
             title:"Error",
             content:str,
             resizeable: false,
              minimizeButton: false,
             maximizeButton: false,             
             modal:true});  
       }
       
       
       
       
       ///////// CloudOS Page Scripts  /////////////
       
       $(document).ready(function() 
{   
     $("#filemanager").click(function(){
    $.newWindow({id:"fmanager",posx:150,posy:50,width:1050,height:500,title:"File Manager", type:"iframe"});
    $.updateWindowContent("fmanager",'<iframe src="fileview.aspx" width="100%" height="100%" />');
    
    });
    $("#texteditor").click(
    function()
    {
        var str="<table style='width:100%;height:30px' bgcolor='#DFDFDF'>";
        str+="<tr><td class='style1'><span id='new' onclick='newfile()'><img alt='' src='photos/player/new.png' height='25' width='25' /><br />New</span></td>";
        str+="<td class='style1'><span id='save' onclick='savefile()'><img alt='' height='25' src='photos/player/save.png' width='25' /><br />Save</span></td>";
        str+="<td class='style1'><span id='open' onclick='openfile()'><img alt='' height='25' src='photos/player/open.png' width='25' /><br />Open</span></td>";
        str+="<td></td></tr></table>";
        str+="<div id='content' style='width: 100%; height: 92%;background-color:#ffffff' contentEditable='true'></div>";
        $.newWindow({id:"txteditor",posx:300,posy:50,width:800,height:600,title:"cloudOS-Editor",content:str,resizeable: false});
       
    });
    $("#imageviewer").click(function(){
       $.newWindow({id:"iviewer",posx:100,posy:50,width:1000,height:700,title:"Image Viewer", type:"iframe"});
        $.updateWindowContent("iviewer",'<iframe class="ifrm" src="iviewer.aspx" width="100%" height="100%"  />');
    });   
    $("#music").click(function(){
        $.newWindow({id:"mplayer",posx:300,posy:50,width:800,height:700,title:"cloudOS-Music", type:"iframe"});
        $.updateWindowContent("mplayer",'<iframe class="ifrm" src="mplayer.aspx" width="100%" height="100%"  />');
    }); 
      
    $("#browser").click(function(){
    var  str="<table style='width:100%;' border='0' cellpadding='0' cellspacing='0'><tr bgcolor='#D1D1D1'><td width='130px'>";
    str+="<img id='back' alt='' src='photos/browser/back.png' onclick='back()' />";
    str+="<img id='fwd' alt='' src='photos/browser/for.png' onclick='fwd()' />";
    str+="<img alt='' src='photos/browser/ref.png' onclick='rfrsh()' /></td>";
    str+="<td><input id='ad' type='text' style='width:98%' /></td>";
    str+="<td width='110px'><img alt='' src='photos/browser/go.png' onclick='go()' />";
    str+="<img alt='' src='photos/browser/home.png' onclick='home()' /></td></tr></table>";
    str+="<iframe class='ifrm' id='myframe' scrolling='no' src='http://www.bing.com' width='99.5%' height='99%'></iframe>";
    $.newWindow({id:"Browser",posx:300,posy:50,width:1000,height:600,title:"cloudOS Browser",content:str,resizeable:false});
    f();    
    });
    
    $("#ieditor").click(function(){
        $.newWindow({id:"ieditor",posx:300,posy:50,width:1000,height:1000,title:"Image Editor", type:"iframe"});
    $.updateWindowContent("ieditor",'<iframe class="ifrm" src="http://pixlr.com/editor/" width="100%" height="100%" />');
    });
    
    
   
	
});
function newfile()
{
  var str="<Div style='height:100%;background-color:#dfdfdf;text-align:center'>Enter New File Name:-<input type='text' id='val1' /><input type='button' value='Create' onclick='create()' /></div>";             
             $.newWindow
             ({id:"rnm",
             posx:600,posy:200,
             width:200,height:100,
             title:"Create",
             content:str,
             resizeable: false,
             modal:true,
             minimizeButton: false,
             maximizeButton: false,});
}
function create()
{            
            var fname=document.getElementById('val1').value;
            if(fname !=null || fname !="")            
            PageMethods.create(fname);
            document.getElementById("content").innerHTML="";
            $("#" + "rnm" + " .window-closeButton").click();
}
function savefile()
{
     var cntn=document.getElementById("content").innerHTML;
     PageMethods.save(cntn,result);
            function result(rslt)
            {
                if(rslt=="success")
                {
                    alert("File Saved Successfull");
                }
                else
                {
                    error("File Not Saved!Try Again");
                }
                
            }

}

function openfile()
{
   var str="<Div style='height:100%;background-color:#dfdfdf;text-align:center'>Enter File Name:<br />";
   str+="<input type='text' id='val2' />";
   str+="<input type='button' value='Open' onclick='opn()' /></div>"; 
   $.newWindow({id:"filepath",posx:300,posy:200,width:200,height:100,title:"Open",content:str,
   resizeable: false,
   modal:true,
   minimizeButton: false,
   maximizeButton: false});
    
}
function opn()
{
            var fp=document.getElementById('val2').value;
            if(fp !=null || fp !="")            
            PageMethods.open(fp,init); 
            function init(txt)
            {
                if(txt=="more")
                {
                    error("There are many files with this name");
                }
                else if(txt=="fail")
                {
                    error("Unable to open file");
                }
                else
                {               
                    document.getElementById('content').innerHTML=txt;             
                }
            }        
            $("#" + "filepath" + " .window-closeButton").click();
}
         
 
            
            /////// Browser Scripts ///////
            
            
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
            
            
       
       
       