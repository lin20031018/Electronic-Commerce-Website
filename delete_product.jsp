<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Get form data
    String category = request.getParameter("category");
    String productName = request.getParameter("productName");

    // Database connection
    String url = "jdbc:mysql://localhost:3306/plantshop";
    String user = "root";
    String password = "1234";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "DELETE FROM " + category + " WHERE productName = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, productName);

        int rowsDeleted = stmt.executeUpdate();
        if (rowsDeleted > 0) {
			out.println("商品刪除成功! <a href='backend.html'>按此</a>回到後台介面");
        } else {
            out.println("找不到該商品，刪除失敗! <a href='backend.html'>按此</a>回到後台介面");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println(e.toString());
        out.println("商品刪除失敗! <a href='backend.html'>按此</a>回到後台介面");
    } finally {
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
