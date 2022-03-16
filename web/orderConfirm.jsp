<%@ page import="com.market.dao.OrderRepository" %>
<%@ page import="com.market.dto.Order" %><%--
  Created by IntelliJ IDEA.
  User: dlscj
  Date: 2021-12-01
  Time: 오전 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <title>CO-WIN</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <%
            if (session.getAttribute("login") == null || session.getAttribute("login") == "false") {
        %>
        <jsp:forward page="marketplace.jsp"></jsp:forward>
        <%
            }
            Order order = OrderRepository.getInstance().getOrder(Integer.parseInt(request.getParameter("id")));
        %>
        <div class="container col-8 alert alert-info">
            <div class="text-center">
                <h1>영수증</h1>
            </div>
            <div class="row justify-content-between">
                <div class="col-4" align="left">
                    <strong>배송 주소</strong> <br> 성명 : <%=order.getName() %>    <br>
                    우편번호 : <%=order.getZipcode()%><br>
                    주소 : <%=order.getAddress()%>) <br>
                </div>
                <div class="col-4" align="right">
                    <p><em>배송일: <%=order.getDelivery_date()%>
                    </em>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
