<%--
  Created by IntelliJ IDEA.
  User: dlscj
  Date: 2021-12-01
  Time: 오전 5:49
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
        <%@ include file="nav.jsp" %>
        <div class="container">
            <form name="newBook" enctype="multipart/form-data" action="./addProduct_process.jsp" class="form-horizontal"
                  method="POST">

                <div class="form-group row mt-5">
                    <label class="col-sm-2">제품명</label>
                    <div class="col-sm-3">
                        <input type="text" name="name" id="name" class="form-control">
                    </div>
                </div>
                <div class="form-group row mt-5">
                    <label class="col-sm-2">가격</label>
                    <div class="col-sm-3">
                        <input type="text" name="unitPrice" id="unitPrice" class="form-control">
                    </div>
                </div>
                <div class="form-group row mt-5">
                    <label class="col-sm-2">제조사</label>
                    <div class="col-sm-3">
                        <input type="text" name="manufacturer" class="form-control">
                    </div>
                </div>
                <div class="form-group row mt-5">
                    <label class="col-sm-2">상세 정보</label>
                    <div class="col-sm-3">
                        <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group row mt-5">
                    <label class="col-sm-2">재고 수</label>
                    <div class="col-sm-5">
                        <input type="text" name="unitsInStock" id="unitsInStock" class="form-control">
                    </div>
                </div>
                <div class="form-group row mt-5">
                    <label class="col-sm-2">이미지</label>
                    <div class="col-sm-5">
                        <input type="file" name="bookImage" class="form-control">
                    </div>
                </div>
                <div class="form-group row mt-5">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-primary" value="등록">
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
