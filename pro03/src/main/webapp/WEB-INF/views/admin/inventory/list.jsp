<%@ page language="java" contentType="text/html charset=UTF8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>상품 재고 목록</title>
	<jsp:include page="../../include/head.jsp"></jsp:include>
</head>
<body>
<div class="full-wrap">
    <!-- 헤더 부분 인클루드 -->
    <header id="hd">
    	<div class="container">
    		<jsp:include page="../../include/hd.jsp"></jsp:include>
    	</div>
    </header>
    <main id="contents" class="contents">
    	<div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
	    	<nav class="breadcrumb" aria-label="breadcrumbs">
			  <ul>
			    <li><a href="${path2 }">Home</a></li>
			    <li><a href="${path2 }/admin/listInventory.do">재고</a></li>
			    <li class="is-active"><a href="#" aria-current="page">목록</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">상품 재고 목록</h2>
    		<div class="page-wrap">
	    		<div class="clr-fix">
	    			<br>
					<table class="table" id="tb1">
						<thead>
							<tr>
								<th class="item1">상품번호</th>
								<th class="item2">상품명</th>
								<th class="item3">재고수량</th>
								<th class="item4">평균 입고가격</th>
								<th class="item5">최고 판매가격</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty list }">
								<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto.pno }</td>
									<td>
										<a href="${path2 }/admin/detailInventory.do?pno=${dto.pno }">${dto.pname }</a>
									</td>
									<td>${dto.amount }</td>
									<td>${dto.iprice }</td>
									<td>${dto.oprice }</td>
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty list }">
								<tr>
									<td colspan="4"><strong>재고 목록이 존재하지 않습니다.</strong></td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<script>
					$(document).ready(function(){
						$("#tb1").DataTable({
							order:[[0,"desc"]]
						});
					});
					</script>
					<hr>
					<c:if test="${cus.id.equals('admin') }">
					<div class="buttons">
					  <a href="${path2 }/admin/insertInventory.do" class="button is-danger">상품 입고</a>
					</div>
					</c:if>
				</div>
    		</div>
    	</section>
    </main>
    <!-- 푸터 부분 인클루드 -->
    <footer id="ft">
    	<jsp:include page="../../include/ft.jsp"></jsp:include>
    </footer>
    <script>
    $(document).ready(function(){
    	$("#tb1_length, #tb1_filter").css("margin-bottom", "20px");
    });
    </script>
</div>    
</body>
</html>