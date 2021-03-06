<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div class="body">
<script type="text/javascript" src="https://www.google.com/jsapi"></script> 
<script src="resources/js/countryISO.js" /></script>
<script src="resources/js/graphicMap.js" /></script>
<script src="resources/js/graphicUsersActivity.js" /></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="resources/css/userActivity.css">  

<div class="graphicNaviMain">
<!-- google chart map -->
<div class="graphicNavi">
<div class="GraphicHeader">Users activity on map</div>
<div class="selectedPart">
<div>
Country:
<input type="text" id="country" name="country" />
</div>
</div>
<div class="SubmitGraphic">
<input type="button" onclick="getAllAddresses()" value="show Map"/ >
</div>
</div>
<!--count active users  -->
<div class="graphicNavi">
<div class="GraphicHeader"> Count sessions </div>
<div class="selectedPart">
Date: <input id="selectedDate" type="text">

<select id="dateRange" required size = "1" name = "name[]">
        <option disabled>choose</option>
        <option value = "hourly">hourly</option>
        <option value = "weekly">weekly</option>
        <option value = "monthly">monthly</option>
    </select>
</div>
<div class="SubmitGraphic">
<input type="button" onclick="getActiveUsers()" value="show graphic">
</div>
</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<div id="chart_div"></div>
<div id="chart_div2" style="width: 900px; height: 500px;"></div>
		</div>
</tiles:putAttribute>
</tiles:insertDefinition>