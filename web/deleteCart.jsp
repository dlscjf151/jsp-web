<%
    Cookie[] cookies = request.getCookies();
    for(Cookie cookie:cookies){
        if(cookie.getName().startsWith("product_")){
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }
    response.sendRedirect("basket.jsp");
%>