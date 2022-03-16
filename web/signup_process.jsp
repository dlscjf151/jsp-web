<%@ page import="com.market.dto.User" %>
<%@ page import="com.market.dao.UserRepository" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>


<%
    UserRepository instance = UserRepository.getInstance();
    request.setCharacterEncoding("UTF-8");
    String login_id = request.getParameter("id");
    String login_password = request.getParameter("password");
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String address = request.getParameter("address");
    String role = request.getParameter("role");

    User user = new User();
    user.setAddress(address);
    user.setAge(age);
    user.setLoginId(login_id);
    user.setLoginPassword(login_password);
    user.setName(name);
    user.setRole(role);
    instance.addUser(user);
    out.println("<script>alert('회원가입을 완료하였습니다')</script>");
    response.sendRedirect("/");
%>