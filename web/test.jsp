<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: dlscj
  Date: 2021-12-01
  Time: 오전 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
<%
    Connection conn = null;
    try{
        String url = "jdbc:mysql://localhost:3306?serverTimezone=UTC";
        String user = "root";
        String password = "spring";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        out.println("데이터베이스 연결이 성공했습니다.");
    }
    catch(SQLException ex){
        out.println("데이터베이스 연결이 실패했습니다.<br>");
        out.println("SQLException: " + ex.getMessage());
    }
    finally {
        if(conn != null){
            conn.close();
        }
    }
%>
    </body>
</html>
