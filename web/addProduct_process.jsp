<%@ page import="com.market.dto.Product" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.market.dao.ProductRepository" %>
<%

    request.setCharacterEncoding("utf-8");

    ProductRepository instance = ProductRepository.getInstance();
    MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\dlscj\\IdeaProjects\\web\\resources\\static\\images",
            5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

    Product product = new Product();
    product.setSellerId((int) session.getAttribute("userid"));
    product.setProductName(multi.getParameter("name"));
    product.setUnitPrice(Integer.parseInt(multi.getParameter("unitPrice")));
    product.setDescription(multi.getParameter("description"));
    product.setUnitsInStock(Integer.parseInt(multi.getParameter("unitsInStock")));
    product.setManufacturer(multi.getParameter("manufacturer"));
    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);
    product.setFile(fileName);

    instance.addProduct(product);

    response.sendRedirect("marketplace.jsp");
%>