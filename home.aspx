<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_Default" Title="CloudOS-The Web Desktop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="slider/themes/default/default.css" type="text/css" media="screen" />    
    <link rel="stylesheet" href="slider/themes/pascal/pascal.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/themes/orman/orman.css" type="text/css" media="screen" />  
    <link rel="stylesheet" href="slider/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/style.css" type="text/css" media="screen" />   

    </asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
     <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <div id="wrapper">    
                &nbsp;<div class="slider-wrapper theme-default">
                        <div class="ribbon"></div>
                        <div id="slider" class="nivoSlider">
                            <img src="slider/images/slide1.jpg" alt="" />
                            <img src="slider/images/slide2.jpg" alt="" />
                            <img src="slider/images/slide3.jpg" alt="" data-transition="slideInLeft" />
                            <img src="slider/images/slide4.jpg" alt="" title="#htmlcaption" />
                        </div>
                    </div>
            </div>
<script type="text/javascript" src="slider/scripts/jquery-1.6.4.min.js"></script>
<script type="text/javascript" src="slider/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
</script></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table> 
    <br /><br /><br /><br /><br /><br />


</asp:Content>


