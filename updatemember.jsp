<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>更新會員資訊</title>
    <link rel="stylesheet" href="member.css">
</head>
<body>
<%
    Connection con = null;
    PreparedStatement pst = null;
    String errorMessage = null;
    String successMessage = null;

    try {
        // 建立資料庫連接
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/plantshop?serverTimezone=UTC";
        String user = "root"; 
        String password = "1234";
        con = DriverManager.getConnection(url, user, password);

        // 從 session 中獲取 username
        String username = (String) session.getAttribute("username");
        if (username != null && !username.isEmpty()) {
            // 從請求中獲取更新後的資料
            String updatedEmail = request.getParameter("email");
            String updatedPhone = request.getParameter("phone");
            String updatedAddress = request.getParameter("address");

            // 構建 SQL 更新語句，使用參數化查詢來防止 SQL 注入
            String sql = "UPDATE member SET email = ?, phone = ?, address = ? WHERE username = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, updatedEmail);
            pst.setString(2, updatedPhone);
            pst.setString(3, updatedAddress);
            pst.setString(4, username);

            int rowsUpdated = pst.executeUpdate();
            if (rowsUpdated > 0) {
                successMessage = "個人資訊已成功更新";
            } else {
                errorMessage = "更新失敗，請重試";
            }
        } else {
            errorMessage = "用戶名不存在或未登錄";
        }
    } catch (Exception e) {
        e.printStackTrace();
        errorMessage = "資料庫操作出錯";
    } finally {
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            errorMessage = "資料庫連接關閉出錯";
        }
    }

    if (errorMessage != null) {
%>
    <p><%=errorMessage%></p>
<%
    } else if (successMessage != null) {
%>
    <p><%=successMessage%></p>
<%
    }
%>
<a href="index.jsp">回到主頁</a>
</body>
</html>
