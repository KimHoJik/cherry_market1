<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="tmp" items="${list }">
	<li>
		${tmp.talker }:${tmp.pccomment } (${tmp.regdate })
	</li>
</c:forEach>