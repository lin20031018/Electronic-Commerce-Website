<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@ page import="java.math.BigDecimal" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cart</title>
    <link rel="stylesheet" href="cart.css">
</head>
<body>
<%
String username = (String) session.getAttribute("username");
if (username != null && !username.equals("")){
%>
<nav>
    <a href="index.jsp"><img src="img/logo.png" alt="logo" style="width: 130px;position:absolute;top: 15px;left: 10px;"></a>
    <a href="allproduct.jsp" style="margin-left:-118px;">植栽</a>
    <a href="member.jsp">會員專區</a>
    <a href="aboutus.html">關於我們</a>

   
</nav>
<%
    try {
        // 第一步: 加載資料庫驅動程式 
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // 第二步: 建立連接 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plantshop?serverTimezone=UTC", "root", "1234");
        
        // 第三步: 編寫 SQL 查詢
        String sqlTable1 = "SELECT * FROM cart WHERE username = ?";
        PreparedStatement pstmt = con.prepareStatement(sqlTable1);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();

        // 遍歷結果集
        while (rs.next()) {
            int cartID = rs.getInt("cartID");
            String productCategory = rs.getString("productCategory");
            int productID = rs.getInt("productID");
            int quantity = rs.getInt("quantity");
            BigDecimal itemTotalPrice = rs.getBigDecimal("totalPrice"); // 更改變量名以避免重複
            Date cartdate = rs.getDate("cartdate");

            // 拼接SQL語句以查詢 productCategory 對應的表
            String sqlTable2 = "SELECT * FROM " + productCategory + " WHERE productID = ?";
            PreparedStatement show_pstmt = con.prepareStatement(sqlTable2);
            show_pstmt.setInt(1, productID);
            ResultSet show_rs = show_pstmt.executeQuery();

            // 遍歷結果集
            while (show_rs.next()) {
                String image = show_rs.getString("image");
                String productName = show_rs.getString("productName");
                BigDecimal productPrice = show_rs.getBigDecimal("productPrice");
                int productStock = show_rs.getInt("productStock"); // 獲取產品庫存
%>
<article>
	<form action="updateCart.jsp" method="post">
		<section class="product" data-price="<%= productPrice %>" data-id="<%= productID %>" data-category="<%= productCategory %>">
			<input type="checkbox" class="checkbox" value="<%= productPrice %>">
			<img src="<%= image %>" alt="<%= productName %>">
			<div class="text-container">
				<h2><%= productName %></h2>
				<h6>庫存: <%= productStock %></h6>
			</div>
			<div class="quantity">
				<button type="button" class="decrease">-</button>
				<span class="count"><%= quantity %></span>
				<button type="button" class="increase">+</button>
			</div>
			<input type="hidden" name="productName" value="<%= productName %>">
			<input type="hidden" name="cartID" value="<%= cartID %>">
			<button type="submit" class="trash"><img src="img/trash.png" alt="trash" class="trash"></button>
			<h3><%= productPrice %> 元</h3>
		</section>
	</form>
</article>
<%
            }
        }
        // 關閉資源
        rs.close();
        pstmt.close();
        con.close();
    } catch (SQLException sExec) {
        out.println("SQL錯誤: " + sExec.toString());
    } catch (ClassNotFoundException err) {
        out.println("class錯誤: " + err.toString());
    }
} else {
    response.sendRedirect("index.jsp");
}
%>
	<footer>
		<h4>小計金額 <span id="total-amount">0 元</span></h4>
		<button id="checkout-button"> <a href="cart2.jsp" style="color:white;text-decoration:none">下一頁</a></button>
	</footer>

<script>
        const products = document.querySelectorAll('.product');
        const totalAmount = document.getElementById('total-amount');

        products.forEach(product => {
            const decreaseButton = product.querySelector('.decrease');
            const increaseButton = product.querySelector('.increase');
            const countSpan = product.querySelector('.count');
            const checkbox = product.querySelector('.checkbox');
            const price = parseFloat(product.getAttribute('data-price'));

            decreaseButton.addEventListener('click', () => {
                let count = parseInt(countSpan.innerText);
                if (count > 1) {
                    count--;
                    countSpan.innerText = count;
                    updateSum();
                }
            });

            increaseButton.addEventListener('click', () => {
                let count = parseInt(countSpan.innerText);
                count++;
                countSpan.innerText = count;
                updateSum();
            });

            checkbox.addEventListener('change', updateSum);
        });

        function updateSum() {
            let sum = 0;
            products.forEach(product => {
                const count = parseInt(product.querySelector('.count').innerText);
                const price = parseFloat(product.getAttribute('data-price'));
                const checkbox = product.querySelector('.checkbox');
                if (checkbox.checked) {
                    sum += count * price;
                }
            });
            totalAmount.innerText = sum + ' 元';
        }
    </script>
    <script>/*trash*/
    var hideButtons = document.querySelectorAll('.trash');
    hideButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            this.parentElement.style.display = 'none';
    });
});

    </script>
</body>
</html>