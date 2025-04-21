<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品總覽</title>
    <link rel="stylesheet" href="all_product.css">

</head>

<body>
	<nav>
        <a href="index.jsp"><img src="img/logo.png" alt="logo" style="width: 130px;position:absolute;top: 15px;left: 10px;"></a>
        <a href="allproduct.jsp" style="margin-left:-118px;">植栽</a>
        <a href="member.jsp">會員專區</a>
        <a href="aboutus.html">關於我們</a>

		<div class="corner">
		<form action="search.jsp" method="post">
			<div class="search">
					<input class="search-button" type="image" src="img/search.png"  alt="send" name="searchbutton" id="searchbutton" value="">
					<input class="search-bar" type="text" name="search" id="search" placeholder="在此輸入">
				
			</div>
		</form>
			
			
			
		</div>
	</nav>

	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			// 建立資料庫連接
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
			String user = "root"; 
			String password = "1234";
			con = DriverManager.getConnection(url, user, password);

			// SQL 查詢以按 productID 排序從資料庫表中獲取產品名稱和價格
			String sql = "SELECT  productID, productName, productPrice, image FROM allplantpots ORDER BY productID";
			pstmt = con.prepareStatement(sql);

			// 執行 SQL 查詢
			rs = pstmt.executeQuery();
	%>
			<h1 id="type1"><hr id="line">盆栽<hr id="line"></h1>
			<div class="gallery">
	<%
			// 遍歷結果集，顯示搜索結果
			while (rs.next()) { 
				String productID = rs.getString("productID");
				String productName = rs.getString("productName");
				String productPrice = rs.getString("productPrice");
				String productImage = rs.getString("image");
	%>
				<section>
					<a href="product1.jsp?productID=<%= productID %>">
					<img src="<%= productImage %>" alt="<%= productName %>">
					</a>
					<hr>
					<h3><%= productName %></h3>
					<p>$<%= productPrice %></p>
				</section>
	<%
			} // 結束 while 循環
	%>

				<hr id="separate">
			</div>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>


	<%
		Connection con1 = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;
		try {
			// 建立資料庫連接
			Class.forName("com.mysql.jdbc.Driver");
			String url1 = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
			String user1 = "root"; 
			String password1 = "1234";
			con1 = DriverManager.getConnection(url1, user1, password1);

			// SQL 查詢以按 productID 排序從資料庫表中獲取產品名稱和價格
			String sql1 = "SELECT productID, productName, productPrice, image FROM squareplantpot ORDER BY productID";
			pstmt1 = con1.prepareStatement(sql1);

			// 執行 SQL 查詢
			rs1 = pstmt1.executeQuery();
	%>
		<h1 id="type2.1"><hr id="line">方盆系列<hr id="line"></h1>
		<div class="gallery">
	<%
			while (rs1.next()) { 
				String productID = rs1.getString("productID");
				String productName = rs1.getString("productName");
				String productPrice = rs1.getString("productPrice");
				String productImage = rs1.getString("image");
	%>
			<section>
				<a href="product2.jsp?productID=<%= productID %>">
				<img src="<%= productImage %>" alt="<%= productName %>">
				</a>
				
				<hr>
				<h3><%= productName %></h3>
				<p>$<%= productPrice %></p>
			</section>
	<%
			} // 結束 while 循環
	%>
			<hr id="separate">
		</div>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs1 != null) rs1.close();
				if (pstmt1 != null) pstmt1.close();
				if (con1 != null) con1.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>

	<%
		Connection con2 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		try {
			// 建立資料庫連接
			Class.forName("com.mysql.jdbc.Driver");
			String url2 = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
			String user2 = "root"; 
			String password2 = "1234";
			con2 = DriverManager.getConnection(url2, user2, password2);

			// SQL 查詢以按 productID 排序從資料庫表中獲取產品名稱和價格
			String sql2 = "SELECT productID, productName, productPrice, image FROM rhinoplantpot ORDER BY productID";
			pstmt2 = con2.prepareStatement(sql2);

			// 執行 SQL 查詢
			rs2 = pstmt2.executeQuery();
	%>
		<h1 id="type2.2"><hr id="line">犀利系列<hr id="line"></h1>
		<div class="gallery">
	<%
			while (rs2.next()) { 
				String productID = rs2.getString("productID");
				String productName = rs2.getString("productName");
				String productPrice = rs2.getString("productPrice");
				String productImage = rs2.getString("image");
	%>
			<section>
				<a href="product3.jsp?productID=<%= productID %>">
				<img src="<%= productImage %>" alt="<%= productName %>">
				</a>
				
				<hr>
				<h3><%= productName %></h3>
				<p>$<%= productPrice %></p>
			</section>
	<%
			} // 結束 while 循環
	%>
			<hr id="separate">
		</div>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs2 != null) rs2.close();
				if (pstmt2 != null) pstmt2.close();
				if (con2 != null) con2.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>

	<%
		Connection con3 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		try {
			// 建立資料庫連接
			Class.forName("com.mysql.jdbc.Driver");
			String url3 = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
			String user3 = "root"; 
			String password3 = "1234";
			con3 = DriverManager.getConnection(url3, user3, password3);

			// SQL 查詢以按 productID 排序從資料庫表中獲取產品名稱和價格
			String sql3 = "SELECT productID, productName, productPrice, image FROM glassplantpot ORDER BY productID";
			pstmt3 = con3.prepareStatement(sql3);

			// 執行 SQL 查詢
			rs3 = pstmt3.executeQuery();
	%>
		<h1 id="type2.5"><hr id="line">玻璃系列<hr id="line"></h1>
		<div class="gallery">
	<%
			while (rs3.next()) { 
				String productID = rs3.getString("productID");
				String productName = rs3.getString("productName");
				String productPrice = rs3.getString("productPrice");
				String productImage = rs3.getString("image");
	%>
			<section>
				<a href="product4.jsp?productID=<%= productID %>">
				<img src="<%= productImage %>" alt="<%= productName %>">
				</a>
				
				<hr>
				<h3><%= productName %></h3>
				<p>$<%= productPrice %></p>
			</section>
	<%
			} // 結束 while 循環
	%>
			<hr id="separate">
		</div>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs3 != null) rs3.close();
				if (pstmt3 != null) pstmt3.close();
				if (con3 != null) con3.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>

    <%
		Connection con4 = null;
		PreparedStatement pstmt4 = null;
		ResultSet rs4 = null;
		try {
			// 建立資料庫連接
			Class.forName("com.mysql.jdbc.Driver");
			String url4 = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
			String user4 = "root"; 
			String password4 = "1234";
			con4 = DriverManager.getConnection(url4, user4, password4);

			// SQL 查詢以按 productID 排序從資料庫表中獲取產品名稱和價格
			String sql4 = "SELECT productID, productName, productPrice, image FROM kilnplantpot ORDER BY productID";
			pstmt4 = con4.prepareStatement(sql4);

			// 執行 SQL 查詢
			rs4 = pstmt4.executeQuery();
	%>
		<h1 id="type2.3"><hr id="line">窯瓷系列<hr id="line"></h1>
		<div class="gallery">
	<%
			while (rs4.next()) { 
				String productID = rs4.getString("productID");
				String productName = rs4.getString("productName");
				String productPrice = rs4.getString("productPrice");
				String productImage = rs4.getString("image");
	%>
			<section>
				<a href="product5.jsp?productID=<%= productID %>">
				<img src="<%= productImage %>" alt="<%= productName %>">
				</a>
				
				<hr>
				<h3><%= productName %></h3>
				<p>$<%= productPrice %></p>
			</section>
	<%
			} // 結束 while 循環
	%>
			<hr id="separate">
		</div>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs4 != null) rs4.close();
				if (pstmt4 != null) pstmt4.close();
				if (con4 != null) con4.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>

    <%
		Connection con5 = null;
		PreparedStatement pstmt5 = null;
		ResultSet rs5 = null;
		try {
			// 建立資料庫連接
			Class.forName("com.mysql.jdbc.Driver");
			String url5 = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
			String user5 = "root"; 
			String password5 = "1234";
			con5 = DriverManager.getConnection(url5, user5, password5);

			// SQL 查詢以按 productID 排序從資料庫表中獲取產品名稱和價格
			String sql5 = "SELECT productID, productName, productPrice, image FROM cementplantpot ORDER BY productID";
			pstmt5 = con5.prepareStatement(sql5);

			// 執行 SQL 查詢
			rs5 = pstmt5.executeQuery();
	%>
		<h1 id="type2.4"><hr id="line">水泥系列<hr id="line"></h1>
		<div class="gallery">
	<%
			while (rs5.next()) { 
				String productID = rs5.getString("productID");
				String productName = rs5.getString("productName");
				String productPrice = rs5.getString("productPrice");
				String productImage = rs5.getString("image");
	%>
			<section>
				<a href="product6.jsp?productID=<%= productID %>">
				<img src="<%= productImage %>" alt="<%= productName %>">
				</a>
				
				<hr>
				<h3><%= productName %></h3>
				<p>$<%= productPrice %></p>
			</section>
	<%
			} // 結束 while 循環
	%>
			<hr id="separate">
		</div>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs5 != null) rs5.close();
				if (pstmt5 != null) pstmt5.close();
				if (con5 != null) con5.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>

        <%
		Connection con6 = null;
		PreparedStatement pstmt6 = null;
		ResultSet rs6 = null;
		try {
			// 建立資料庫連接
			Class.forName("com.mysql.jdbc.Driver");
			String url6 = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
			String user6 = "root"; 
			String password6 = "1234";
			con6 = DriverManager.getConnection(url6, user6, password6);

			// SQL 查詢以按 productID 排序從資料庫表中獲取產品名稱和價格
			String sql6 = "SELECT productID, productName, productPrice, image FROM homegoods ORDER BY productID";
			pstmt6 = con6.prepareStatement(sql6);

			// 執行 SQL 查詢
			rs6 = pstmt6.executeQuery();
	%>
		<h1 id="type3"><hr id="line">居家系列<hr id="line"></h1>
		<div class="gallery">
	<%
			while (rs6.next()) { 
				String productID = rs6.getString("productID");
				String productName = rs6.getString("productName");
				String productPrice = rs6.getString("productPrice");
				String productImage = rs6.getString("image");
	%>
			<section>
				<a href="product7.jsp?productID=<%= productID %>">
				<img src="<%= productImage %>" alt="<%= productName %>">
				</a>
				
				<hr>
				<h3><%= productName %></h3>
				<p>$<%= productPrice %></p>
			</section>
	<%
			} // 結束 while 循環
	%>

        <button id="topBtn" class="top"> 返回頂部 </button>
        <script>
            const topBtn = document.getElementById('topBtn');

            topBtn.addEventListener('click', scrollToTop);

            function scrollToTop() {
                window.scrollTo({
                top: 0,
                behavior: 'smooth'
                });
            }
        </script>
	</div>
	
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs6 != null) rs6.close();
				if (pstmt6 != null) pstmt6.close();
				if (con6 != null) con6.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>

<!----------------------------浮空選單------------------------------>
    <div class="icon-bar">
        <a id="fir" href="#type1">盆栽</a>
        <div class="all">
            <div class="dropdown">
                <a href="#type2.1">方盆系列</a>
                <a href="#type2.2">犀力系列</a>
                <a href="#type2.3">窯瓷系列</a>
                <a href="#type2.4">水泥系列</a>
                <a href="#type2.5">玻璃系列</a>
            </div>
            <button><a>植物</a></button>
        </div>
        <a id="thi" href="#type3">居家</a>
    </div>
<!----------------------------浮空選單------------------------------>

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