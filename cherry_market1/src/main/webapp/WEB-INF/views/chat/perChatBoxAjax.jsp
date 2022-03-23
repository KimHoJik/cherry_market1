<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="tmp" items="${list }">
	<c:choose>
		<c:when test="${tmp.talker eq sessionScope.id }">
		<li class="right">
			<div class="right">
				<div class="sender" style="margin:5px 10px 0px 10px;">
					<span> ${tmp.talker }</span>
				</div>
			</div>
			<div class="mpt">
				<small>${tmp.stregdate }</small>
				<div class="message">
					<span>${tmp.pccomment }</span>
				</div>

			</div>
			
		</li>
		</c:when>
		<c:otherwise>
		<li class="left">
			<div class="right">
				<div class="sender" style="margin:5px 10px 0px 10px;">
					<span>${tmp.talker }   </span>
				</div>
			</div>
			<div>
				<div class="message">
					<span>${tmp.pccomment }</span>
				</div>
				<small>${tmp.stregdate }</small>
			</div>
		</li>	
		</c:otherwise>
	</c:choose>
	
</c:forEach>