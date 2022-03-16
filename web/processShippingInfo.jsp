<%@ page import="com.market.dto.OrderProduct" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.market.dao.ProductRepository" %>
<%@ page import="com.market.dto.Order" %>
<%@ page import="com.market.dao.OrderRepository" %><%
    request.setCharacterEncoding("utf-8");

    ArrayList<OrderProduct> orderProducts = new ArrayList<>();
    Cookie[] cookies = request.getCookies();
    int sum = 0;
    for(Cookie cookie: cookies){
        if(cookie.getName().startsWith("product_")) {
            OrderProduct orderProduct = new OrderProduct();
            int id = Integer.parseInt(cookie.getName().replace("product_", ""));
            orderProduct.setProduct_id(id);
            orderProduct.setCount(Integer.parseInt(cookie.getValue()));
            orderProducts.add(orderProduct);
            sum += Integer.parseInt(cookie.getValue()) * ProductRepository.getInstance().getProduct(id).getUnitPrice();
        }
    }
    Order order = new Order();
    order.setName(request.getParameter("name"));
    order.setAddress(request.getParameter("addressName"));
    order.setCountry(request.getParameter("country"));
    order.setDelivery_date(request.getParameter("shippingDate"));
    order.setZipcode(request.getParameter("zipCode"));
    int idx = OrderRepository.getInstance().createOrder(order, orderProducts);
    response.sendRedirect("orderConfirm.jsp?id="+idx);
%>