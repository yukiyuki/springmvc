<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="person" class="com.ggf.model.Person"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:out value="&lt escapeXml为false &gt" escapeXml="false"/> <br/>
	<c:out value="&lt escapeXml为true &gt" escapeXml="true"/> <br/>
	<c:out value="${null}">默认值</c:out><br/><br/>
	
	<c:set value="sessionValue" var="value1" scope="session"/><br/>
	从Session中获取值<c:out value="${sessionScope.value1}"/><br/>
	<c:set value="applicationValue" var="value2" scope="application"/>
	从application中获取值<c:out value="${applicationScope.value2}"/><br/>
	不指定Scope获取值<c:out value="${value1 }"/> ,<c:out value="${value2 }"/><br/><br/>
	
	<c:set target="${person}" property="name">张三</c:set>
	<c:set target="${person}" property="age">20</c:set>
	<c:set target="${person}" property="address">翰林缘公寓</c:set>
	使用的目标对象为:<br/>
	从Bean中获得的name值为：<c:out value="${person.name}"/><br/>
	从Bean中获得的age值为：<c:out value="${person.age}"/><br/>
	从Bean中获得的address值为：<c:out value="${person.address}"/><br/><br/>
	
	<c:set value="张三" var="name" scope="session"/>
	<c:set value="20" var="age" scope="session"/>
	<c:set value="翰林缘公寓" var="address" scope="session"/>
	<c:out value="${sessionScope.name}"/><br/>
	<c:out value="${sessionScope.age}"/><br/>
	<c:out value="${sessionScope.address}"/><br/>
	<c:remove var="age"/>
	<c:out value="${sessionScope.name}"/><br/>
	<c:out value="${sessionScope.age}"/><br/>
	<c:out value="${sessionScope.address}"/><br/><br/>
	
	<c:catch var="error">
		<c:set target="pp" property="p"/>
	</c:catch>
	<c:out value="${error }"></c:out><br/><br/>
	
	<form action="jstl.jsp" method="post">
		<input type="text" name="username" value="${param.username}"><br/>
		<input type="submit" value="提交">
	</form>
	
	<c:if test="${param.username == 'admin'}" var="adminCheck">
		验证结果：<c:out value="${pageScope.adminCheck }"/><br/>
		<c:out value="欢迎admin"/>
	</c:if><br/><br/>
	
	<form action="jstl.jsp" method="post">
		成绩：<input type="text" name="score" value="${param.score}"><br/>
		<input type="submit" value="提交">
	</form>
	<c:choose>
		<c:when test="${param.score >= 90 }">
			<c:out value="你的成绩优秀"/>
		</c:when>
		<c:when test="${param.score < 90 && param.score >=80 }">
			<c:out value="你的成绩良好"/>
		</c:when>
		<c:when test="${param.score < 80 && param.score >=70 }">
			<c:out value="你的成绩一般"/>
		</c:when>
		<c:when test="${param.score < 70 && param.score >=60 }">
			<c:out value="你的成绩及格"/>
		</c:when>
		<c:otherwise>
			<c:out value="不及格"/>
		</c:otherwise>
	</c:choose>
	<br/><br/>
	<%
		List list = new ArrayList();
		list.add("贝贝");
		list.add("晶晶");
		list.add("欢欢");
		list.add("莹莹");
		list.add("妮妮");
		
		request.setAttribute("list", list);
	%>
	
	<b>不指定begin和end的迭代</b><br/>
	<c:forEach var="fuwa" items="${list }">
		<c:out value="${fuwa }"/>
	</c:forEach>
	<br/>
	<b>指定begin和end的迭代</b><br/>
	<c:forEach var="fuwa" items="${list }" begin="1" end="3" step="2">
		<c:out value="${fuwa }"/>
	</c:forEach>
	<br/>
	<b>输出整个迭代信息</b><br/>
	<c:forEach var="fuwa" items="${list }" begin="2" end="4" step="2" varStatus="s">
		<c:out value="${fuwa }"/>的四种属性<br/>
		 &nbsp;&nbsp;所在位置，即索引<c:out value="${s.index }"/><br/>
		 &nbsp;&nbsp;总共已迭代的次数<c:out value="${s.count }"/><br/>
		 &nbsp;&nbsp;是否为第一个位置<c:out value="${s.first }"/><br/>
		 &nbsp;&nbsp;是否为最后一个位置<c:out value="${s.last }"/><br/>
	</c:forEach>
	<br/><br/>
	
	<
</body>
</html>