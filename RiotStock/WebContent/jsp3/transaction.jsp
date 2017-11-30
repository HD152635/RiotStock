<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="org.dimigo.vo.ChampionVO"%>
<%-- jsp-api.jar �߰� --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link type="text/css" rel="stylesheet"
	href="${contextPath}/css/main.css">
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="${contextPath}/js/main.js"></script>
</head>
<body>
<% ChampionVO champ = (ChampionVO) request.getAttribute("champion"); %>
<c:set var="rank" value="${requestScope.rank}"/>
<c:set var="price" value="${requestScope.price}"/>
	<%@ include file="navbar.jsp"%>
	<div class="champion_intro_header row">
    <div class="champion_stat">
      <a class="waves-effect waves-light btn"  onclick="location.reload(true)">
        <i class="material-icons">cached</i>
        <p class="variation">
        </p>
      </a>
    </div>
    <div class="champion_intro">
      <div class="intro_champion_img">
        <img src="champion/<%= champ.getNameEN() %>.png" width="140px" />
      </div>
      <h1 class="champion_name"><%= champ.getNameKR() %></h1>
      <div class="champion_intro_ranking">
        è�Ǿ� �ְ� ��ŷ ${rank}��
      </div>
      <ul class="champion_intro_ratio">
        <li>
          <div class="champion_intro_winr">
            �·� : <span class="win_ratio"><fmt:formatNumber value="${win}" pattern="0.00"/> %</span>
          </div>
        </li>
        <li>
          <div class="champion_intro_winr">
            �ȷ� : <span class="pick_ratio"><fmt:formatNumber value="${pick}" pattern="0.00"/>%</span>
          </div>
        </li>
        <li>
          <div class="champion_intro_price">
            ���� ��ġ : <span class="price"><fmt:formatNumber value="${price}" pattern="0.000000"/></span>
          </div>
        </li>
      </ul>
    </div>
  </div>
  <div class="row" style="min-height: 900px">
    <div class="main-content-container">
      <div class="main-content">
        <h1><strong class="champion_name"><%= champ.getNameKR() %></strong> �ŷ��ϱ�</h1>
        <div class="col s7 table_trading_status">
          <table class="table_trading centered">
            <thead>
              <tr>
                <th class="tb_sell">�ŵ��ֹ�</th>
                <th class="tb_sell">�ŵ��ܷ�</th>
                <th>����</th>
                <th class="tb_buy">�ż��ܷ�</th>
                <th class="tb_buy">�ż��ֹ�</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="i" begin="1" end="4">
	              <tr class="tb_sell">
	                <td></td>
	                <td class="t_amount"></td>
	                <td class="t_1bit"></td>
	                <td class="empty_cell"></td>
	                <td class="empty_cell"></td>
	              </tr>
              </c:forEach>
              <c:forEach var="i" begin="1" end="4">
	              <tr class="tb_buy">
	                <td class="empty_cell"></td>
	                <td class="empty_cell"></td>
	                <td class="t_1bit"></td>
	                <td class="t_amount"></td>
	                <td></td>
	              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="order_tab col s5">
          <ul class="tabs">
            <li class="tab col s6 tb_sell"><a class="" href="#order_sell">�ŵ�</a></li>
            <li class="tab col s6 tb_buy"><a href="#order_buy">�ż�</a></li>
          </ul>
          <form id="order_sell" class="col s12">
            <div class="input-field">
              <input name="share" placeholder="�Ҽ��� ���ڸ����� �νĵ˴ϴ�." id="sell_quantity" type="text" class="validate">
              <label for="sell_quantity">�ֹ� ����</label>
            </div>
            <p class="range-field">
              <label for="sell_price">�ֹ� ����</label>
              <input name="price" type="range" id="sell_price" min="${price*0.7}" max="${price*1.3}" />
            </p>
            <button style="background: #FF6B72;" class="btn waves-effect waves-light" type="submit">�ŵ�</button>
          </form>
          <form id="order_buy" class="col s12">
            <div class="input-field">
              <input name="share" placeholder="�Ҽ��� ���ڸ����� �νĵ˴ϴ�." id="buy_quantity" type="text" class="validate">
              <label for="buy_quantity">�ֹ� ����</label>
            </div>
            <p class="range-field">
              <label for="buy_price">�ֹ� ����</label>
              <input name="price" type="range" id="buy_price" min="${price*0.7}" max="${price*1.3}" />
            </p>
            <button style="background: #3A88C0;" class="btn waves-effect waves-light" type="submit">�ż�</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="modal.jsp" %>
  	<script>
  	$(".modal-close").click(function(event){
  		location.reload(true);
  	})
  	$('form#order_sell').submit(function(event){
  		event.preventDefault();

		var share = document.getElementById('sell_quantity').value;
		var price = document.getElementById('sell_price').value;
        var champion = "<%= champ.getNameEN() %>";
		$.post("${contextPath}/stock/sale",{
			"share": share,
			"price": price,
			"champion": champion
        }, function(data){
           	if(data.msg == 'success') {
           		var myModal = $('#modal1');
				myModal.find('.modal-title').text('�ŵ��Ϸ�');
				myModal.modal();
				myModal.modal('open');
		    } else if(data.msg == 'error') {
			  	var myModal = $('#modal1');
				myModal.find('.modal-title').text('Upload Stock Error');
				myModal.find('.modal-body').text(data.error);
				myModal.modal();
				myModal.modal('open');
			}
       	});
  	});
  	$('form#order_buy').submit(function(event){
  		event.preventDefault();

		var share = document.getElementById('buy_quantity').value;
		var price = document.getElementById('buy_price').value;
        var champion = "<%= champ.getNameEN() %>";
        
		$.post("${contextPath}/stock/purchase",{
			"share": share,
			"price": price,
			"champion": champion
        }, function(data){
           	if(data.msg == 'success') {
           		var myModal = $('#modal1');
				myModal.find('.modal-title').text('�ż��Ϸ�');
				myModal.modal();
				myModal.modal('open');
		    } else if(data.msg == 'error') {
			  	var myModal = $('#modal1');
				myModal.find('.modal-title').text('Upload Stock Error');
				myModal.find('.modal-body').text(data.error);
				myModal.modal();
				myModal.modal('open');
			}
       	});
  	});
	$(document).ready(function() {
		var champion = "<%=champ.getNameEN()%>";
		$.getJSON("${contextPath}/stocklist?champion=" + champion
				+ "&kind=purchase&limit=4", function(data) {
			$.each(data, function(index, item) {
				$(".tb_buy .t_1bit")[index].innerHTML = ((item.price).toFixed(3));
				$(".tb_buy .t_amount")[index].innerHTML = ((item.share).toString());
			});
		});
		$.getJSON("${contextPath}/stocklist?champion=" + champion
				+ "&kind=sale&limit=4", function(data) {
			$.each(data, function(index, item) {
				$(".tb_sell .t_1bit")[index].innerHTML = ((item.price).toFixed(3));
				$(".tb_sell .t_amount")[index].innerHTML = ((item.share).toString());
			});
		});
	});
	</script>
</body>
</html>