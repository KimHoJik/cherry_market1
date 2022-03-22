<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="tmp" items="${list }">
	<c:choose>
		<c:when test="${sessionScope.id eq tmp.saller }">
			<form id="frm${tmp.num }" class="frm" method="post">
				<div style="border-bottom:1px solid #fc9091">
					<p style="margin-bottom:1px"><strong>판매중</strong></p>
					<h4>${tmp.priceWon } | ${tmp.title }</h4>
					<h5>${tmp.buyer } | ${tmp.lastcomment}</h5>
				</div>
				<input type="hidden" name="num" value="${tmp.num }"/>
				<input type="hidden" name="buyer" value="${tmp.buyer }"/>
				<input type="hidden" name="saller" value="${tmp.saller }"/>
			</form>
		</c:when>
		<c:otherwise>
			<form id="frm${tmp.num }" class="frm" method="post">
				<div style="border-bottom:1px solid #fc9091;">
					<p style="margin-bottom:1px"><strong>구매중</strong></p>
					<h4>${tmp.priceWon } | ${tmp.title }</h4>
					<h5>${tmp.saller } | ${tmp.lastcomment}</h5>
				</div>
				<input type="hidden" name="num" value="${tmp.num }"/>
				<input type="hidden" name="buyer" value="${tmp.buyer }"/>
				<input type="hidden" name="saller" value="${tmp.saller }"/>
			</form>
		</c:otherwise>
	</c:choose>
	
</c:forEach>
