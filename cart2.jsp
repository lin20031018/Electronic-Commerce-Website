<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cart2</title>
    <link rel="stylesheet" href="cart2.css">
</head>

<body>
    <%
    String username = (String) session.getAttribute("username");
    BigDecimal totalPrice = BigDecimal.valueOf(0);
    if (username != null && !username.equals("")){
    %>
    <nav>
        <a href="index.jsp"><img src="img/logo.png" alt="logo" style="width: 130px;position:absolute;top: 15px;left: 10px;"></a>
        <a href="allproduct.jsp" style="margin-left:-118px;">植栽</a>
        <a href="member.jsp">會員專區</a>
        <a href="aboutus.html">關於我們</a>

        
    </nav>

	<div class="all">
        <h1><span>產品購買</span></h1>
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
				
				BigDecimal itemsPrice = productPrice.multiply(new BigDecimal(quantity));
				totalPrice = totalPrice.add(itemsPrice);
%>
    
        <section class="products">
            <div class="selected">
                <div class="img">
                    <img src="<%= image%>">
                </div>
                <div class="content">
                    <h3><%= productName %></h3><!--需寫入order資料表-->
                    <hr>
                    <h3>數量 : <%= quantity %></h3><!--需寫入order資料表-->
                    <hr>
                    <div class="words">
                        <h3>金額（</h3>
                        <h3 id="quantity"><%= quantity %></h3>
                        <h3>項商品）：$<%= itemsPrice %></h3><!--需寫入order資料表-->
                    </div>
                    <hr>
                </div>
            </div>
        </section>
<%
            itemsPrice = BigDecimal.valueOf(0);
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

        <section class="below">
            <hr class="line">
            <div class="block1">
                小計
            </div>
            <div class="block2">
                $<%= totalPrice %>
            </div>

            <hr class="line">
            <div class="block1">
                活動優惠減免(9折)
            </div>
            <div class="block2">
<%
	BigDecimal discount = BigDecimal.valueOf(0);
	if(totalPrice.compareTo(BigDecimal.valueOf(1000)) > 0){
	discount = totalPrice.multiply(BigDecimal.valueOf(0.1));
	}
%>

			$<%= discount %>
            </div>

            <hr class="line">
            <div class="block1">
                運費
            </div>
            <div class="block2">
<%
	BigDecimal freight = BigDecimal.valueOf(200);
	if(totalPrice.compareTo(BigDecimal.valueOf(666)) > 0){
	freight = BigDecimal.valueOf(0);
	}
%>
			$<%= freight %>
            </div>

            <hr class="line">
            <div class="block1">
                總計
            </div>
            <div class="block2">
<%
    BigDecimal checkoutAmount = BigDecimal.valueOf(0);
    checkoutAmount = totalPrice.subtract(discount).add(freight);
%>				
			$<%= checkoutAmount %>
            </div>
<%
	String url = "jdbc:mysql://localhost:3306/plantshop?serverTimezone=UTC";
	String dbUser = "root";
	String dbPassword = "1234";

	String sql = "SELECT * FROM member WHERE username=?";

	//String fullname = "";
	String phone = "";
	String address = "";

	try (
		Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
		PreparedStatement order_pstmt = con.prepareStatement(sql);
	) {
		Class.forName("com.mysql.cj.jdbc.Driver");
		order_pstmt.setString(1, username);

		try (ResultSet order_rs = order_pstmt.executeQuery()) {
			if (order_rs.next()) {
				//fullname = order_rs.getString("fullname");
				phone = order_rs.getString("phone");
				address = order_rs.getString("address");  
			} else {
				out.println("在資料庫尋找時出錯");
			}
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		out.println("資料庫驅動加載錯誤：" + e.getMessage());
	} catch (SQLException e) {
		e.printStackTrace();
		out.println("資料庫錯誤：" + e.getMessage());
	}
%>

            <hr class="line">
            <div class="block1">
                <p>定購人</p>
                <p>電話</p>
                <p>取貨方式</p>
                <p>地址</p>
                <p>付款方式</p>
            </div>
            <div class="block2">
                <p><%= username %></p>
                <p><%= phone %></p>
				<p>
					<select id="method">
						<option name="method" value="lazy">宅配送達</option>
						<option name="method" value="self">自取</option>
					</select>
				</p>
				<p>
					<select id="address">
						<option name="address" value="home"><%= address %></option>
						<option name="address" value="none">無</option>
					</select>
				</p>
				<p>
					<select id="payment">
						<option name="payment" value="online">線上付款</option>
						<option name="payment" value="pay">貨到付款</option>
					</select>
            </div>

			
            <hr class="line">
        </section>

        <div class="buttons">
            <button id="prev"><a href="index.jsp">上一頁</a></button>
            <button id="send">確認結帳</button>
        </div>
        
        <div id="pop" class="pop">
            <div class="pop-content">
                <h2>請輸入信用卡卡號：</h2>
                <input type="tel" id="bank" required minlength="16" maxlength="16">
                <section>
                    <button class="backOnce">返回</button>
                    <button class="paid" onclick="validateInput()">付款</button>
                </section>
            </div>
        </div>
    
        <div id="pop2" class="pop2">
            <div class="pop2-content">
                <h2>：已成功送出訂單</h2>
                <a href="index.jsp" class="back">回到首頁</a>
            </div>
        </div>

        <script src="cart2.js"></script>
    </div>

</body>
</html>

