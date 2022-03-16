<%@ page import="com.market.dao.UserRepository" %>
<%@ page import="com.market.dto.User" %><%
    UserRepository instance = UserRepository.getInstance();
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    User user = instance.login(id, password);
    if(user != null){
        session.setAttribute("login", "true");
        session.setAttribute("id", id);
        session.setAttribute("role", user.getRole());
        session.setAttribute("userid", user.getUserId());
    }
    response.sendRedirect("/");
%>