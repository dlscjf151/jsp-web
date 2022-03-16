<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getParameter("lang") != null) {
        session.setAttribute("lang", request.getParameter("lang"));
    }
    String lang = (String) session.getAttribute("lang");
%>
<fmt:setLocale value="<%=lang%>"></fmt:setLocale>
<fmt:bundle basename="nav">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="index.jsp">CO-WIN</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"><span
                    class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="index.jsp"> <fmt:message key="home"/>
                    </a></li>
                    <li class="nav-item"><a class="nav-link" href="marketplace.jsp"> <fmt:message key="market"/>
                    </a></li>

                    <%
                        if (session.getAttribute("login") == null || !session.getAttribute("login").equals("true")) {
                    %>
                    <li class="nav-item"><a class="nav-link" href="signin.jsp"> <fmt:message key="signin"/>
                    </a></li>
                    <li class="nav-item"><a class="nav-link" href="signup.jsp"> <fmt:message key="signup"/>
                    </a></li>
                    <%
                    } else {
                    %>
                    <li class="nav-item"><a class="nav-link" href="signout.jsp"> <fmt:message key="signout"/>
                    </a></li>
                    <li class="nav-item"><a class="nav-link" href="basket.jsp"> <fmt:message key="basket"/>
                    </a></li>
                    <%
                        }
                        String uri;
                        if (request.getQueryString() == null || request.getQueryString().replace("lang=ko", "").replace("lang=en", "").equals("")) {
                            uri = request.getRequestURI() + "?";

                        } else {
                            uri = request.getRequestURI() + "?" + request.getQueryString().replace("&lang=ko", "").replace("&lang=en", "").replace("lang=ko", "").replace("lang=en", "") + "&";
                        }
                    %>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false"><fmt:message key="language"/></a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                            <li><a class="dropdown-item" href="<%=uri%>lang=ko">한국어</a></li>
                            <li><a class="dropdown-item" href="<%=uri%>lang=en">English</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

    </nav>
</fmt:bundle>
