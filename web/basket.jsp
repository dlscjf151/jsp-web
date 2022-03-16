<%@ page import="com.market.dto.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.market.dao.ProductRepository" %><%--
  Created by IntelliJ IDEA.
  User: dlscj
  Date: 2021-12-01
  Time: 오전 7:30
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
              crossorigin="anonymous">    </head>
    <body>
        <%@include file="nav.jsp"%>

        <div class="container">
            <div class="row">
                <table width="100%">
                    <tr>
                        <td align="left"><a href="./deleteCart.jsp" class="btn btn-danger">삭제하기</a>
                        </td>
                        <td align="right"><a href="./shippingInfo.jsp"
                                             class="btn btn-success">주문하기</a></td>
                    </tr>
                </table>
            </div>
            <div style="padding-top: 50px">
                <table class="table table-hover">
                    <tr>
                        <th>상품</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>소계</th>
                        <th>비고</th>
                    </tr>
                    <%
                        Cookie[] cookies = request.getCookies();
                        int sum = 0;
                        ProductRepository instance= ProductRepository.getInstance();
                        for (Cookie cookie : cookies) { //상품 리스트 하나씩 출력하기
                            if(!cookie.getName().startsWith("product_")){
                                continue;
                            }
                            int id = Integer.parseInt(cookie.getName().replaceAll("product_", ""));
                            Product product = instance.getProduct(id);

                            int total = product.getUnitPrice() * Integer.parseInt(cookie.getValue());
                            sum = sum + total;
                    %>
                    <tr>
                        <td><%=product.getProductId() %> - <%=product.getProductName() %>
                        </td>
                        <td><%=product.getUnitPrice() %>
                        </td>
                        <td><%=cookie.getValue() %>
                        </td>
                        <td><%=total %>
                        </td>
                        <td><a href="./removeCart.jsp?id=<%=product.getProductId() %>" class="badge badge-danger">삭제</a></td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>총액</th>
                        <th><%=sum %>
                        </th>
                        <th></th>
                    </tr>
                </table>
                <a href="marketplace.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
            </div>
            <hr>
        </div>
        <!-- Footer-->
        <%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
