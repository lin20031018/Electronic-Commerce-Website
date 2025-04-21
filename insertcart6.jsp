<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // 初始化变量
    String productID = request.getParameter("productID");
    String username = (String) session.getAttribute("username");
    String quantityStr = request.getParameter("quantity");
    String productPrice = request.getParameter("productPrice");
	String productStock = request.getParameter("productStock");


    int quantity = 1; // 设置默认值

    try {
         if (quantityStr != null && !quantityStr.isEmpty()) {
             try {
                 quantity = Integer.parseInt(quantityStr);
             } catch (NumberFormatException e) {
                 // 處理異常，可以設置默認值或記錄錯誤
                 quantity = 1; // 或其他默認值
               
             }
         }
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
        String user = "root"; 
        String password = "1234";
        con = DriverManager.getConnection(url, user, password);

        String sql = "INSERT INTO cart (username, productCategory, productID, quantity, productPrice, productStock, cartdate) VALUES (?, 'cementplantpot', ?, ?, ?, ?, ?)";
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, username);
        pstmt.setString(2, productID);
        pstmt.setInt(3, quantity);
        pstmt.setString(4, productPrice);
		pstmt.setString(5, productStock);
        pstmt.setDate(6, new java.sql.Date(new java.util.Date().getTime()));

        pstmt.executeUpdate();
    } catch (SQLException sExec) {
        out.println("SQL錯誤: " + sExec.toString());
    } catch (ClassNotFoundException cnfExec) {
        out.println("類加載錯誤: " + cnfExec.toString());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }

    response.sendRedirect("product6.jsp?productID=" + productID);
%>
<html>
<body>
</body>
</html>
