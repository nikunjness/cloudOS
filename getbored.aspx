<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getbored.aspx.cs" Inherits="getbored" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="chrome=1">
		<meta http-equiv="Content-Type" content="text/html; charset = UTF-8" />
		<title>Ball Pool</title>
		<style>
			body {
				overflow: hidden;
				background-color: #000000;
			}
		</style>
	</head> 
	<body>

	<div id="canvas"></div>

	<script src="bored/protoclass.js"></script>
	<script src='bored/box2d.js'></script>

	<script src='bored/Main.js'></script>

	<script type="text/javascript">
	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
	try {
	var pageTracker = _gat._getTracker("UA-86951-7");
	pageTracker._trackPageview();
	} catch(err) {}</script>

	</body>
</html>
