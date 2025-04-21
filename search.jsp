<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>search</title>
    <link rel="stylesheet" href="search.css">

</head>
<body>
    <nav>
        <a href="index.jsp"><img src="img/logo.png" alt="logo" style="width: 130px;position:absolute;top: 15px;left: 10px;"></a>
        <a href="allproduct.jsp" style="margin-left:-118px;">植栽</a>
        <a href="member.jsp">會員專區</a>
        <a href="aboutus.html">關於我們</a>

		
	</nav>

<%
    request.setCharacterEncoding("UTF-8");
    String searchString = request.getParameter("search");
    if (searchString != null && !searchString.trim().equals("")) {
        // 建立資料庫連線
        String url = "jdbc:mysql://localhost:3306/plantshop";
        String user = "root";
        String password = "1234";
        Connection conn = DriverManager.getConnection(url, user, password);

        // 準備 SQL 查詢語句
        String sql = "SELECT * FROM allplantpots WHERE productName LIKE ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, "%" + searchString + "%"); // 使用 LIKE 進行模糊搜尋

        // 執行查詢並獲取結果集
        ResultSet rs = stmt.executeQuery();

        // 顯示搜尋結果
        boolean hasResults = false;
        while (rs.next()) {
            hasResults = true;
            String productID = rs.getString("productID");
            String productName = rs.getString("productName");
            String productPrice = rs.getString("productPrice");
            String productImage = rs.getString("image");
%>
			<div class="container"><h1><span class="line">搜尋結果</span></h1></div>
    <div class="gallery">
        <section class>
		<a href="product1.jsp?productID=<%= productID %>">
            <img src="<%= productImage %>" alt="<%= productName %>">
		</a>
            <hr>
            <h3><%= productName %></h3>
            <p>$<%= productPrice %></p>
        </section>
    </div>

    <div class="container"><h1 style="margin-top: -30px; font-size:20px; color:rgb(215, 215, 215); font-weight: bold; width:50%; border-bottom: 3px solid rgb(215, 215, 215);"><span class="line">已到底部</span></h1></div>
<%
        }
        if (!hasResults) {
            out.println("<p>沒有找到相關商品。</p>");
        }

        // 關閉資源
        rs.close();
        stmt.close();
        conn.close();
    }
%>

    <footer>
        <div><p style="font-size: 24px;">常見問題</p><br><a href="#">會員管理</a><br><a href="#">照顧方法</a><br><a href="#">超商/宅配</a><br><a href="#">退換貨說明</a> </div>
        <div><p style="font-size: 24px;">品牌名稱</p><br><a href="#">我們的故事</a><br><a href="#">植物大哉問</a></div>
        <!--品牌名稱改-->
        <div class="contact"><p style="font-size: 24px;">聯絡我們</p> 
        <br><a href="#"><img src="img/ig.png" alt="ig"></a><a href="#"><img src="img/fb.png" alt="fb"></a><a href="#"><img src="img/line.png" alt="line"></a><a href="#"><img src="img/gmail.png" alt="gmail"></a>
        <p style="font-size: 17px;">客服電話 : 0800-800800 <br>服務時間：週一至週五 09:00-18:00</p> 
        </div> 
        <h5>2024 版權所有</h5>
    </footer>
</body>
</html>
</body>
</html>
