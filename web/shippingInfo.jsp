<%--
  Created by IntelliJ IDEA.
  User: dlscj
  Date: 2021-12-01
  Time: 오전 7:48
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
        <%
            Cookie[] cookies = request.getCookies();
            int count = 0;
            for (Cookie cookie : cookies) {
                if (cookie.getName().startsWith("product_")) {
                    count += 1;
                    break;
                }
            }
            if (count == 0) {
                out.println("<script>alert('장바구니가 비어있습니다.');location.href='basket.jsp'</script>");
                return;
            }
        %>
        <%@include file="nav.jsp" %>

        <div class="container">
            <form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
                <input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>"/>
                <div class="form-group row mt-3">
                    <label class="col-sm-2">성명</label>
                    <div class="col-sm-3">
                        <input name="name" type="text" class="form-control"/>
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label class="col-sm-2">배송일</label>
                    <div class="col-sm-3">
                        <input name="shippingDate" type="text" class="form-control"/>(yyyy/mm/dd)
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label class="col-sm-2">국가</label>
                    <div class="col-sm-3">
                        <input name="country" type="text" class="form-control"/>
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label class="col-sm-2">우편번호</label>
                    <div class="col-sm-3">
                        <input name="zipCode" type="text" class="form-control"/>
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label class="col-sm-2">주소</label>
                    <div class="col-sm-5">
                        <input name="addressName" type="text" class="form-control"/>
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <div class="col-sm-offset-2 col-sm-10">
                        <a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-secondary"
                           role="button">이전</a>
                        <input type="submit" class="btn btn-primary" value="등록"/>
                        <a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
                    </div>
                </div>
            </form>
        </div>
        <!-- Footer-->
        <%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
