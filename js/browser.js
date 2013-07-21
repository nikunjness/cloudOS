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
                    alert(x);                   
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
alert(adds.length);
    if(i+1<adds.length)
    {
        i=i+1;
        alert(adds[i]);
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
            ifr.src=adds[0];
            ad.value=adds[0];
            i=i+1;
            adds[i]=ad.value;
        }
}