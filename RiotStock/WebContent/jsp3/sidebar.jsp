<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="org.dimigo.vo.UserVO"%>
<%@ page import="org.dimigo.vo.ChampionVO"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- jsp-api.jar �߰� --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	UserVO user = (UserVO) session.getAttribute("user");
%>
<ul id="slide-out1" class="side-nav">
	<%
		if (user == null) {
	%>
	<li class="login-view">
		<form class="login_form center-align" action="${contextPath}/login.do"
			method="post">
			<h5>Riot stock</h5>
			<div>�����Ϸ��� Riotstock�� �α����ϼ���.</div>
			<div class="input-field col s6">
				<input name="id" id="email" type="email" class="validate"
					value="${param.id}"> <label for="email">email</label>
			</div>
			<div class="input-field col s6">
				<input name="pwd" id="password" type="password" class="validate">
				<label for="password">password</label>
			</div>
			<button class="btn waves-effect waves-light" type="submit"
				name="action" style="width: 100%">�α���</button>
		</form>
	</li>
	<%
		} else {
	%>
	<li class="user-view"><img src="${contextPath}/champion/${user.champion}.png"
		class="user-img halfway-fab z-depth-2" /></li>
	<li class="user-info">
		<h3>${user.nickname}</h3> <a
		class="waves-effect waves-light btn transparent grey-text"><i
			class="material-icons">vpn_key</i>��й�ȣ ����</a> <a
		class="waves-effect waves-light btn transparent grey-text"><i
			class="material-icons">money</i>���� ����</a>
	</li>
	<%
		}
	%>
</ul>
<ul id="slide-out2" class="side-nav">
	<%
		if (user == null) {
	%>
	<li class="login-view">
		<form class="login_form center-align" action="${contextPath}/login.do"
			method="post">
			<h5>Riot stock</h5>
			<div>�����Ϸ��� Riotstock�� �α����ϼ���.</div>
			<div class="input-field col s6">
				<input name="id" id="email" type="email" class="validate"
					value="${param.id}"> <label for="email">email</label>
			</div>
			<div class="input-field col s6">
				<input name="pwd" id="password" type="password" class="validate">
				<label for="password">password</label>
			</div>
			<button class="btn waves-effect waves-light" type="submit"
				name="action" style="width: 100%">�α���</button>
		</form>
	</li>
	<%
		} else {
	%>
	<li class="user-view"><img src="${contextPath}/champion/${user.champion}.png"
		class="user-img halfway-fab z-depth-2" /></li>
	<li class="money_had">
		<h5>
			<span><i class="grey-text text-darken-1 material-icons">money</i></span>����
			�򰡾�
		</h5> <%
 	double[] krw = (double[]) session.getAttribute("krw");
 %>
		<div class="money_wrapper money_all">
			<h5>��ü �ڻ� �򰡱ݾ�</h5>
			<div class="money"><%= String.format("%.3f",krw[0]) %>
				KRW
			</div>
		</div>
		<div class="money_wrapper money_part">
			<h5>�ڻ꺰 �����ݾ�</h5>
			<ul class="money_list">
				<%
					for (int i = 1; i <= 139; i++) {
							ChampionVO champion = new ChampionVO(i);
				%>
				<li>
					<div class="money money_IZREAL"><%=user.getStockInfoByIdx(i)%>
						<%=champion.getNameEN().toUpperCase()%></div>
					<div class="money KRW_IZREAL">
						=
						<%=krw[i]%>
						KRW
					</div>
				</li>
				<%
					}
				%>
			</ul>
		</div>
	</li>
	<%
		}
	%>
</ul>