<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:forEach var="tmp" items="${list }">
		<li class="left">
			<div class="message">
				<span>${tmp.id} : ${tmp.occomment }</span>
			</div>
		</li>
	</c:forEach>
