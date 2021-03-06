<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div class="body">

			<script src="http://yui.yahooapis.com/3.18.1/build/yui/yui-min.js"></script>
			<script src="resources/js/jquery-1.9.1.min.js"></script>
			<script src="resources/js/calendar-and-records.js"></script>
			<link rel="stylesheet" type="text/css" href="resources/css/home.css">
			<div id="demo" class="yui3-skin-sam yui3-g">
				<div id="leftcolumn" class="yui3-u">
					<div id="mycalendar"></div>
				</div>
				<div id="rightcolumn" class="yui3-u">
					<div id="links" style="padding-left: 20px;">
						Selected date: <span id="selecteddate"></span>
					</div>
					<div class="weather">
						<b>Weather in: </b>${city_name}<br> <img
							src="http://openweathermap.org/img/w/${weather_icon}.png"
							alt="weather_icon" /><br> <b>Temperature: </b>${temp} C<br>
						<b>Humidity: </b>${humidity} %<br> <b>Wind: </b>${wind} m/s<br>
					</div>
				</div>
			</div>
     </br>
			<div id="notes" class="hidden"></div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>