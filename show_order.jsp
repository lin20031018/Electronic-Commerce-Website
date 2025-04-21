<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單管理</title>
    <link rel="stylesheet" href="order.css">
</head>
<body>
    <header>
        <h1>訂單管理</h1>
    </header>
    <table>
        <thead>
            <tr>
                <th>訂單編號</th>
                <th>訂購人名稱</th>
                <th>訂購商品</th>
                <th>商品數量</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    // 第一步: 加載資料庫驅動程式 
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    // 第二步: 建立連接 
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plantshop?serverTimezone=UTC", "root", "1234");
                    
                    // 第三步: 編寫 SQL 查詢
                    String sql = "SELECT * FROM `order`";  
                    pstmt = con.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    // 遍歷結果集
                    while (rs.next()) {
                        int orderID = rs.getInt("orderID");
                        String username = rs.getString("username");
                        String productName = rs.getString("productName");
                        int quantity = rs.getInt("quantity");
            %>
                        <tr>
                            <td><%= orderID %></td>
                            <td><%= username %></td>
                            <td><%= productName %></td>
                            <td><%= quantity %></td>
                        </tr>
            <%
                    }
                } catch (SQLException sExec) {
                    out.println("SQL錯誤: " + sExec.toString());
                } catch (ClassNotFoundException err) {
                    out.println("class錯誤: " + err.toString());
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
