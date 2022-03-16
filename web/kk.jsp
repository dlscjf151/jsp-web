<%--
  Created by IntelliJ IDEA.
  User: dlscj
  Date: 2021-12-08
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
        <p>Current Time: <fmt:formatDate value="${now}" type="time"></fmt:formatDate></p>
    </body>
</html>
