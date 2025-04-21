<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>刪除按鈕</title>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    String cartID = request.getParameter("cartID");

    if (cartID != null) {
        try {
            // Step 1: 載入資料庫驅動程式
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plantshop?serverTimezone=UTC", "root", "1234");
                 PreparedStatement pstmt = con.prepareStatement("DELETE FROM cart WHERE cartID = ?")) {
                
                // Set cartID parameter
                pstmt.setString(1, cartID);

                // Execute the delete statement
                pstmt.executeUpdate();

                // Notify user about successful deletion
%>
                <script>
                    alert("成功刪除商品");
                    window.location.href = "cart.jsp";
                </script>
<%
            } catch (SQLException sExec) {
                out.println("SQL錯誤: " + sExec.toString());
            }
        } catch (ClassNotFoundException err) {
            out.println("class錯誤: " + err.toString());
        }
    } else {
        out.println("沒有cartID");
    }
%>
</body>
</html>
