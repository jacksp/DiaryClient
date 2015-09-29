<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div class="body">
		<h1>Record Discription</h1>
			<ul type="square">
				<li>Title: ${record.title}</li>
				<li>Test: ${record.text}</li>
				<li>${record.supplement} </li>
				<li> ${record.created_time} </li>
			</ul>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>

