<%@ page import="com.market.dto.Product" %>
<%@ page import="com.market.dao.ProductRepository" %>
<%@ page import="com.market.dao.UserRepository" %>
<%@ page import="com.market.dto.User" %><%--
  Created by IntelliJ IDEA.
  User: dlscj
  Date: 2021-12-01
  Time: 오전 6:37
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
    <script type="text/javascript">
        function addToCart() {
            if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
                document.addForm.submit();
            } else {
                document.addForm.reset();
            }
        }
    </script>
    <body>
        <%@include file="nav.jsp" %>
        <%
            ProductRepository instance = ProductRepository.getInstance();
            Product product = instance.getProduct(Integer.parseInt(request.getParameter("id")));
            UserRepository userInstance = UserRepository.getInstance();
            User user = userInstance.getUser(product.getSellerId());
        %>
        <fmt:bundle basename="product">

        <div class="container mt-5 mb-5">
            <div class="row">
                <div class="col-md-5">
                    <img src="/images/<%=product.getFile()%>" style="width: 100%"/>
                </div>
                <div class="col-md-6">
                    <h3><%=product.getProductName()%>
                    </h3>
                    <p><%=product.getDescription()%>
                    <p><b><fmt:message key="manufacturer"/></b> : <%=product.getManufacturer()%>
                    </p>
                    <p><b><fmt:message key="seller"/></b> : <%=user.getName()%>
                    </p>
                    <p><b><fmt:message key="stock"/></b> : <%=product.getUnitsInStock()%>
                    </p>
                    <h4><%=product.getUnitPrice()%>원</h4>
                    <form name="addForm" action="./addCart.jsp?id=<%=product.getProductId() %>" method="post">
                        <a href="#" class="btn btn-info" onclick="addToCart()"><fmt:message key="addcart"/>&raquo;</a>
                        <a href="./marketplace.jsp" class="btn btn-secondary"> <fmt:message key="list"/> &raquo;</a>
                    </form>
                </div>
            </div>
            <hr>
        </div>
        <!-- Footer-->
        <%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        </fmt:bundle>
    </body>
</html>
