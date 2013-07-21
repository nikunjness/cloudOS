<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="Admin_home.aspx.cs" Inherits="Admin_home" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
    <style type="text/css">
.welcome
{
	font-family:Bauhaus 93;
	color:White;
	font-size:large;
	font-weight:bolder;
	text-align:center;
}
#slider-wrapper {
	float: left;
    width: 305px;
    height: 235px;
    margin: 0 0 0;
	padding: 15px 18px;
	background: url(images/wrapper.png) no-repeat 
}

#slider {
	position:relative;
    width: 300px;
    height: 175px;
	background:url(photos/loading.gif) no-repeat 50% 50%;
}

#slider img {
	position:absolute;
	top:0px;
	left:0px;
	display:none;
}
.lk
{
	font-family:Cursive;
	color:White;
	font-size:large;
	font-weight:bolder;
	text-align:center;
	text-decoration:none;
}





        .style3
        {
            width: 586px;
        }





    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table style="width:100%;">
    <tr>
        <td class="welcome" colspan="2">
            Welcome Nikunj Thakkar</td>
    </tr>
    <tr>
        <td class="style3">
          <div id="slider-wrapper">

        

            <div id="slider" class="nivoSlider">

                <img src="slider/admin/01.jpg" alt="Slider 01" />

              <img src="slider/admin/02.jpg" alt="Slider 02"  />

               <img src="slider/admin/03.jpg" alt="Slider 03" />

             <img src="slider/admin/04.jpg" alt="Slider 04" />

            </div>

        

        </div>

            <script type="text/javascript" src="slider/scripts/jquery-1.4.3.min.js"></script>

            <script type="text/javascript" src="slider/jquery.nivo.slider.js"></script>

            <script type="text/javascript">

            $(window).load(function() {

                $('#slider').nivoSlider();

            });

            </script>
   
            
            
            
            
            
            
            
            </td>
        <td align="center">
            <a class="lk" href="reply.aspx">Click here to response user Queries </a>
            <br /><br />
             <a class="lk" href="sendmail.aspx">Click here to send mails </a>
            
            
            </td>
    </tr>
    </table>


</asp:Content>

