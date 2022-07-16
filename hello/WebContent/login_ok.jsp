<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>  
  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>Login_ok</title> 
</head>  
<body>  
  
<%@page import="com.java.dao.UserDao,com.java.bean.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  
<h1>Checking User info</h1>  
  
<%  
List<User> list=UserDao.getAllRecords();  
request.setCharacterEncoding("UTF-8");
request.setAttribute("list",list);

String id = request.getParameter("name");
String pw = request.getParameter("password");  
int check = UserDao.getLoginInfo(id, pw);
User u = null;
if(check > 0) u = UserDao.getRecordById(check);

%>  
  
<c:set var="loop_flage" value="false" />
<c:forEach items="${list}" var="u">  
	<c:if test="${not loop_flag}">
		<c:if test="${id eq u.getName()}">
			<c:if test="${pw eq u.getPassword()}">
				check = true;
				<c:set var="loop_flag" value="true" />
			</c:if>
		</c:if>
	</c:if>
</c:forEach>
	<td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>  
	<td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td></tr>  

 
<br/><a href="adduserform.jsp">Add New User</a>  
  
</body>  
</html>  