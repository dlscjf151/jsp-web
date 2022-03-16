<%
    int id = Integer.parseInt(request.getParameter("id"));
    Cookie cookie = new Cookie("product_"+id, "1");
    cookie.setMaxAge(0);
    response.addCookie(cookie);
    response.sendRedirect("basket.jsp");
%>