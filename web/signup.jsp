<%--
  Created by IntelliJ IDEA.
  User: dlscj
  Date: 2021-12-01
  Time: 오전 4:34
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
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <%@ include file="nav.jsp" %>
            <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 mt-5 mb-5" style="margin: 0 auto;float: none">
                <div class="panel panel-success">
                    </br>
                    <div class="panel-body">
                        <form id="application-form" action="signup_process.jsp" method="POST">
                            <div>
                                <span class="font-weight-bold" style="font-size: 1.5em">아이디</span>
                                <input type="text" class="form-control" name="id" placeholder="아이디"
                                       autofocus>
                            </div>
                            </br>
                            <div>
                                <span class="font-weight-bold" style="font-size: 1.5em">비밀번호</span>
                                <input type="password" class="form-control" name="password" placeholder="비밀번호">

                            </div>
                            </br>
                            <div>
                                <span class="font-weight-bold" style="font-size: 1.5em">이름 </span>
                                <input type="text" class="form-control" name="name" placeholder="이름">
                            </div>
                            </br>
                            <div>
                                <span class="font-weight-bold" style="font-size: 1.5em">나이</span>
                                <input type="text" class="form-control" name="age" placeholder="나이">

                            </div>
                            </br>
                            <div>
                                <span class="font-weight-bold" style="font-size: 1.5em">주소</span>
                                <input type="text" class="form-control" name="address" placeholder="주소">
                            </div>
                            </br>
                            <div>
                                <span class="font-weight-bold" style="font-size: 1.5em">구분</span>
                                </br>
                                <select name="role" style="width:100%;">
                                    <option value="">구분</option>
                                    <option value="seller">판매자</option>
                                    <option value="client">구매자</option>
                                </select>
                            </div>
                            </br>
                            <div>
                                <button type="submit" class="form-control btn btn-primary">확인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <!-- Footer-->
        <%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
