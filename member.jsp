<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員修改介面</title>
    <link rel="stylesheet" href="member.css">
</head>
<body>
<%
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String errorMessage = null;

    try {
        // 建立資料庫連接
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
        String user = "root"; 
        String password = "1234";
        con = DriverManager.getConnection(url, user, password);

        // 從 session 中獲取 username
        String username = (String) session.getAttribute("username");
        if (username != null && !username.isEmpty()) {
            // 構建 SQL 查詢，使用參數化查詢來防止 SQL 注入
            String sql = "SELECT * FROM member WHERE username = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, username); // 將第一個問號替換為 session 中的 username
            rs = pst.executeQuery();

            if (rs.next()) {
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
%>
    <script>
        function editInfo() {
            document.querySelectorAll('.editInput').forEach(input => input.style.display = 'block');
            document.getElementById('nameDisplay').style.display = 'none';
            document.getElementById('emailDisplay').style.display = 'none';
            document.getElementById('phoneDisplay').style.display = 'none';
            document.getElementById('addressDisplay').style.display = 'none';

            document.getElementById('editButton').style.display = 'none';
            document.getElementById('saveButton').style.display = 'block';

            document.getElementById('nameInput').value = document.getElementById('nameDisplay').innerText;
            document.getElementById('emailInput').value = document.getElementById('emailDisplay').innerText;
            document.getElementById('phoneInput').value = document.getElementById('phoneDisplay').innerText;
            document.getElementById('addressInput').value = document.getElementById('addressDisplay').innerText;
			alert('個人資訊已更新');
        }
		
		function outInfo() {
            alert('登出成功');
			window.location.href = 'logout.jsp';
			
        }
    </script>
    <div class="container">
        <h2>個人資訊</h2>
        <form id="infoForm" method="POST" action="updatemember.jsp">
            <label for="name">姓名:</label>
            <span id="nameDisplay"><%=username%></span>
            <input type="text" id="nameInput" name="name" class="editInput" style="display: none;">
            <br>

            <label for="email">電子郵件:</label>
            <span id="emailDisplay"><%=email%></span>
            <input type="email" id="emailInput" name="email" class="editInput" style="display: none;">
            <br>

            <label for="phone">電話號碼:</label>
            <span id="phoneDisplay"><%=phone%></span>
            <input type="tel" id="phoneInput" name="phone" class="editInput" style="display: none;">
            <br>

            <label for="address">地址:</label>
            <span id="addressDisplay"><%=address%></span>
            <input type="text" id="addressInput" name="address" class="editInput" style="display: none;">
            <br>

            <button type="button" id="editButton" onclick="editInfo()">更改</button>
            <button type="submit" id="saveButton" style="display: none;">完成</button>
			<button type="submit" id="logout" onclick="outInfo()">登出</button>
        </form>
    </div>
<%
            } else {
                errorMessage = "用戶名不存在或未登錄";
            }
        } else {
            errorMessage = "用戶名不存在或未登錄";
        }
    } catch (Exception e) {
        e.printStackTrace();
        errorMessage = "資料庫操作出錯";
    } finally {
        try {
            if (rs != null) rs.close();
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
    }
%>
</body>
</html>
