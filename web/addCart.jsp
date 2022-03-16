<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.market.dao.ProductRepository" %>
<%@ page import="com.market.dto.Product" %>
<%@ page import="java.util.ArrayList" %>
<%
    String id = request.getParameter("id");

    if (session.getAttribute("login") == null || session.getAttribute("login") == "false") {
        out.println("<script>alert('로그인 먼저 해주세요');location.href='product.jsp?id="+id+"'</script>");
        return;
    }
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("products.jsp");
        return;
    }

    ProductRepository instance = ProductRepository.getInstance();

    Product product = instance.getProduct(Integer.parseInt(id));
    if (product == null) {
        response.sendRedirect("exceptionNoProductId.jsp");
    }

    ArrayList<Product> goodsList = instance.getAllProducts();
    Product goods = new Product();
    for (Product value : goodsList) {
        goods = value;
        if (goods.getProductId() == Integer.parseInt(id)) {
            break;
        }
    }
    int k = 0;
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("product_" + id)) {
            response.addCookie(new Cookie("product_" + id, Integer.toString(Integer.parseInt(cookie.getValue()) + 1)));
            System.out.println(Integer.parseInt(cookie.getValue()) + 1);
            System.out.println(Integer.parseInt(cookie.getValue()));
            k = 1;
            break;
        }
    }

    if (k == 0) {
        response.addCookie(new Cookie("product_" + id, "1"));
    }

    response.sendRedirect("product.jsp?id=" + id);
%>