<%--
  Created by IntelliJ IDEA.
  User: dlscj
  Date: 2021-11-30
  Time: 오후 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.net.http.HttpResponse" %>
<%@ page import="com.github.siyoon210.ogparser4j.OgParser" %>
<%@ page import="com.github.siyoon210.ogparser4j.OpenGraph" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Locale" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
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
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <%@ include file="nav.jsp" %>
            <!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2">CO-WIN</h1>
                                <p class="lead fw-normal text-white-50">힘들었던 날들을</p>
                                <p class="lead fw-normal text-white-50 mb-4">좋았던 날들로</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                            <iframe width="600" height="400" src="https://www.youtube.com/embed/2aQH1zOnj4I"
                                    title="YouTube video player" frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                    allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Testimonial section-->
            <div class="container mt-5 border border-2 rounded rounded-3" style="height:500px; overflow-y: scroll">
                <table class="table">
                    <thead>
                    <tr>
                        <fmt:bundle basename="country">
                            <th scope="col"><fmt:message key="country"></fmt:message></th>
                            <th scope="col"><fmt:message key="tcase"></fmt:message></th>
                            <th scope="col"><fmt:message key="tdeath"></fmt:message></th>
                            <th scope="col"><fmt:message key="case"></fmt:message></th>
                            <th scope="col"><fmt:message key="death"></fmt:message></th>
                            <th scope="col"><fmt:message key="recover"></fmt:message></th>
                        </fmt:bundle>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        JSONParser parser = new JSONParser();
                        BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream("C:\\Users\\dlscj\\IdeaProjects\\web\\resources\\countries.json"), "utf-8"));
                        JSONArray jsonArray = null;
                        try {
                            jsonArray = (JSONArray) parser.parse(reader);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        for (Object jsonObject : jsonArray) {
                            String iso3 = (String) ((JSONObject) ((JSONObject) jsonObject).get("countryInfo")).get("iso3");
                    %>
                    <fmt:bundle basename="country">

                        <tr>
                            <th scope="row"><img
                                    src="<%=((JSONObject)((JSONObject)jsonObject).get("countryInfo")).get("flag")%>"
                                    style="width:1.5em"><fmt:message key="<%=iso3%>"></fmt:message>
                            </th>
                            <th><%=((JSONObject) jsonObject).get("todayCases")%>
                            </th>
                            <th><%=((JSONObject) jsonObject).get("todayDeaths")%>
                            </th>
                            <th><%=((JSONObject) jsonObject).get("cases")%>
                            </th>
                            <th><%=((JSONObject) jsonObject).get("deaths")%>
                            </th>
                            <th><%=((JSONObject) jsonObject).get("recovered")%>
                            </th>
                        </tr>
                    </fmt:bundle>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center mb-5">
                                <h2 class="fw-bolder">NEWS</h2>
                            </div>
                        </div>
                    </div>

                    <div class="row gx-5">
                        <%
                            reader = new BufferedReader(new InputStreamReader(new FileInputStream("C:\\Users\\dlscj\\IdeaProjects\\web\\resources\\news.json"), "utf-8"));
                            JSONObject jsonObject = null;
                            try {
                                jsonObject = (JSONObject) parser.parse(reader);
                            } catch (ParseException e) {
                                e.printStackTrace();
                            }
                            jsonArray = (JSONArray) jsonObject.get("items");
                            for (int i = 0; i < 3; i++) {
                                OgParser ogParser = new OgParser();
                                OpenGraph openGraph = ogParser.getOpenGraphOf((String) ((JSONObject) jsonArray.get(i)).get("originallink"));
                                OpenGraph.Content image = openGraph.getContentOf("image");
                                String imageValue = image.getValue();
                        %>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="<%=imageValue%>" alt="..."/>
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                    <a class="text-decoration-none link-dark stretched-link"
                                       href="<%=((JSONObject) jsonArray.get(i)).get("link")%>"><h5
                                            class="card-title mb-3"><%=((String) ((JSONObject) jsonArray.get(i)).get("title")).replaceAll("<b>", "").replaceAll("</b>", "")%>
                                    </h5></a>
                                    <p class="card-text mb-0"><%=((String) ((JSONObject) jsonArray.get(i)).get("description")).replaceAll("<b>", "").replaceAll("</b>", "")%>
                                    </p>
                                </div>

                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <%@ include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
