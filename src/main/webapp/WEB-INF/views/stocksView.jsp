<%@page import="com.leemanni.vo.UserStocksVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="images/coin.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/styles.css">
<title>나의 자산이야기-My Asset</title>
</head>
<body>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand nav-icon" href="#">
				<span class="nav-icon__title">My Asset</span>
			</a>
		</div>
		<ul class="nav nav-tabs">
		  <li role="presentation" class="active"><a href="#">My Asset</a></li>
		  <li role="presentation"><a href="https://m.stock.naver.com/index.html#/">Today Market</a></li>
		  <li role="presentation"><a href="https://dart.fss.or.kr/">DART_전자공시</a></li>
		</ul>
	</div>
</nav>


<div class="container">
	<div class="pull-right add-button">
		<button type="button" class="btn btn-default addAsset-submit"
		 data-toggle="modal" data-target="#addAsset__modal">자산추가</button>
	</div>
	<div class="row total-asset">
		<div class="col-sm-2">
			<h5>당신의 총 자산</h5>
			<h5>₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${userStockList.totalAsset }"/></h5>
		</div>
		<div class="col-sm-2">
			<h5>당신의 수익률</h5>
			<h5><fmt:formatNumber type="percent" minIntegerDigits="1" pattern="###.00%" value="${userStockList.totalRatio}"/></h5>
		</div>
	</div>
	<span class="notice">종목 이름을 클릭하면 메모기능이 활성화 됩니다.</span>
	<c:set var="list" value="${userStockList.stockList}"/>
	<c:if test="${list.size() > 0}">
		<c:forEach var="vo" items="${list}">
			${stock}
			<c:if test="${stock.name!=vo.name}">
			<table class="table table-hover assetTable">
				<thead>
					<tr>
						<th>
							종목명
						</th>
						<th>
							<a class="writeMemo" data-toggle="modal" data-target="#writeMemo__modal">
								${vo.name}
							</a>
							
						</th>
						<th >
							수량
						</th>
						<th>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.ownStocks}"/>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							자산가치
						</td>
						<td>
							₩ 
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.totalPrice}"/>
						</td>
						<td>
							구매가 (평단가)
						</td>
						<td>
							₩ 
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.pPrice}"/>
						</td>
					</tr>
					<tr>
						<td>
							수익
						</td>
						<td class="ratio">
							₩
							<span>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.totalPrice - vo.p_totalPrice}"/>
							(<fmt:formatNumber type="percent" minIntegerDigits="1" pattern="###.00%" value="${vo.ratio}"/>)
							</span>
						</td>
						<td>
							현재가
						</td>
						<td>
							₩ 
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.cPrice}"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="pull-right edit-buttons">
				<button type="button" data-toggle="modal" data-target="#updateAsset__modal"
				 class="btn btn-default update-btn" onclick="updateFunction('${vo.name}')">수정</button>
				<button type="button"class="btn btn-default delete-btn" onclick="deleteFuntion('${vo.name}')">
					삭제
				 </button>
			</div>
			</c:if>
			<!-- 자산 수정 -->
			<c:if test="${stock.name==vo.name}">
				<form action="update" class="updateAsset-form" method="post">
					<table class="table table-hover updateTable">
						<thead>
							<tr>
								<th>
									종목명
								</th>
								<th>
									<a class="writeMemo" data-toggle="modal" data-target="#writeMemo__modal">
										${vo.name}
									</a>
									
								</th>
								<th >
									수량
								</th>
								<th>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.ownStocks}"/>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">
									보유 주식 수
								</td>
								<td colspan="2">
									<input type="text" class="form-control" required="required"
									 name="ownStocks" value="${stock.ownStocks }">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									구매 가격 (평단가)
								</td>
								<td colspan="2">
									<input type="text" class="form-control" required="required"
									 name="pPrice" value="${stock.pPrice}">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									현재 가격
								</td>
								<td colspan="2">
									<input type="text" class="form-control" required="required"
									 name="cPrice" value="${stock.cPrice}">
								</td>
							</tr>
						</tbody>
					</table>
					<div class="pull-right">
						<button id="addAsset" type="submit" class="btn btn-deafault add-asset">
							수정완료
						</button>
						 <button type="button" class="btn btn-default"  onclick="history.back()">
						 	취소
					 	</button>
						<input type="hidden" name="job" value="update">
						<input type="hidden" name="name" value="${stock.name}">
					</div>
				</form>
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${list.size() <= 0}">
	<div>
		<h1>
			현재 저장된 자산이 없습니다. <br/>
			자산을 새롭게 추가해보시는 게 어떠세요?
		</h1>
	</div>
	</c:if>
</div>


<!-- 자산 추가 모달창 -->
<div class="modal fade" id="addAsset__modal" role="dialog" aria-labelledby="modalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				 	<span aria-hidden="true">&times;</span>
			 	</button>
				<h4 class="modal-title" id="modalLabel">
					나의 자산 추가하기
				</h4>
			</div>
			<form action="insert" class="addAsset-form" method="post">
			<!-- <form id="addAsset-form" class="addAsset-form"> -->
				<div class="modal-body ">
						<input type="text" class="form-control" required="required" name="name" placeholder="종목명"><br/>
						<input type="text" class="form-control" required="required" name="ownStocks" placeholder="보유주식 수"><br/>
						<input type="text" class="form-control" required="required" name="pPrice" placeholder="구매가"><br/>
						<input type="text" class="form-control" required="required" name="cPrice" placeholder="현재가"><br/>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-deafault addAsset-submit" onclick="insert()">
						자산추가
					</button>
					 <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clickClose()">
					 	Close
				 	</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 메모 추가 모달창 -->
<div class="modal fade" id="writeMemo__modal" role="dialog" aria-labelledby="modalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				 	<span aria-hidden="true">&times;</span>
			 	</button>
				<h4 class="modal-title" id="modalLabel">
					memo!
				</h4>
			</div>
			<form action="memo.jsp" class="writeMemo-form" method="post">
				<div class="modal-body">
					<!-- 메모 작성하면 enter, <> 방지 하기 -->
					<textarea rows="10" cols="30" class="form-control memo-textArea" name="memo"></textarea>
				</div>
				<div class="modal-footer">
					<button id="addAsset" type="submit" class="btn btn-deafault add-asset updateAsset-submit" onclick="clickClose()">
						수정
					</button>
					 <button type="button" class="btn btn-default" data-dismiss="modal"  onclick="clickClose()">
					 	Close
				 	</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 수정 모달창 -->
<%-- <div class="modal fade" id="updateAsset__modal" role="dialog" aria-labelledby="modalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				 	<span aria-hidden="true">&times;</span>
			 	</button>
				<h4 class="modal-title" id="modalLabel">
					자산 수정하기
				</h4>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<td>
							name
						</td>
					</tr>
				</thead>
			</table>
			<form action="stock.jsp" class="updateAsset-form" method="post">
				<div class="modal-body">
					<input type="text" class="form-control" required="required" name="ownStocks" value="${stock.ownStocks }"><br/>
					<input type="text" class="form-control" required="required" name="pPrice" placeholder="구매가"><br/>
					<input type="text" class="form-control" required="required" name="cPrice" placeholder="현재가"><br/>
					<input type="hidden" name="job" value="insert">
				</div>
				<div class="modal-footer">
					<button id="addAsset" type="submit" class="btn btn-deafault add-asset writeMemo-submit" onclick="clickClose()">
						메모작성
					</button>
					 <button type="button" class="btn btn-default" data-dismiss="modal"  onclick="clickClose()">
					 	Close
				 	</button>
				</div>
			</form>
		</div>
	</div>
</div> --%>
<footer class="footermain">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h5>copyright</h5>
				<h5>&copy;leemanni(이원희)</h5>
			</div>
			<div class="col-sm-6">
				<h5>github</h5>
				<h5><a class="foot-a" href="https://github.com/leemanni"><i class="fab fa-github"></i>&nbsp;leemanni's github</a></h5>
			</div>
		</div>
	</div>
</footer>

<script src="https://kit.fontawesome.com/27afa53023.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
<script type="text/javascript" src="./js/formCheck.js"></script>
<script type="text/javascript" src="./js/stocksView.js"></script>
<!-- <script type="text/javascript" src="../js/buttonEvent.js"></script> -->
</body>
</html>