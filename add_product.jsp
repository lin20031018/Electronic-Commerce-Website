<%@ page import="java.sql.*" %>
<%@	page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.math.BigDecimal" %> <!-- Import BigDecimal class -->
<%
    // Get form data
    String category = request.getParameter("category");
    String productName = request.getParameter("productName");
    String productDescription = request.getParameter("productDescription");
    String productImage = request.getParameter("productImage");
    String productPrice = request.getParameter("productPrice");
    String productStock = request.getParameter("productStock");

    // Database connection
    String url = "jdbc:mysql://localhost:3306/plantshop";
    String user = "root";
    String password = "1234";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "INSERT INTO " + category + " (image, productName, productPrice, "+category+"Content, productStock) VALUES (?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, productImage);
        stmt.setString(2, productName);
        stmt.setBigDecimal(3, new BigDecimal(productPrice));
        stmt.setString(4, productDescription);
        stmt.setInt(5, Integer.parseInt(productStock));

        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
			out.println("商品新增成功!! <a href='backend.html'>按此</a>回到後台介面");
        }
    } catch (Exception e) {
        e.printStackTrace();
		out.println(e.toString());
        out.println("商品新增失敗!<a href='backend.html'>按此</a>回到後台介面");
    } finally {
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>

