<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>所有盆栽</title>
    <link rel="stylesheet" href="product.css?time=<%=System.currentTimeMillis()%>">

</head>
<body>
    <nav>
        <a href="index.jsp"><img src="img/logo.png" alt="logo" style="width: 130px;position:absolute;top: 15px;left: 10px;"></a>
        <a href="allproduct.jsp" style="margin-left:-118px;">植栽</a>
        <a href="member.jsp">會員專區</a>
        <a href="aboutus.html">關於我們</a>

		<div class="corner">
			<div class="cart">   
				<a href="cart.jsp" style="padding: 0;"><button class="cart"><img src="img/cart.png" alt="user"></button></a>
			</div>
			
		
		</div>
	</nav>
	<%	
	String productID = request.getParameter("productID");
	String quantity = request.getParameter("quantity");
	String username1 = (String) session.getAttribute("username");
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
	String productName = "";
	String productPrice = "";
	String productImage = "";
	String productStock = "";
	String glassplantpotContent = "";

	
    try {

        // 建立資料庫連接
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
        String user = "root"; 
        String password = "1234";
        con = DriverManager.getConnection(url, user, password);

		// SQL 查詢以按 productID 排序從資料庫表中獲取產品名稱和價格
        String sql = "SELECT * FROM glassplantpot WHERE `productID`=?";
        pstmt = con.prepareStatement(sql);
		pstmt.setString(1,productID);

        // 執行 SQL 查詢
        rs = pstmt.executeQuery();
		if (rs.next()) {
        productName = rs.getString("productName");
        productPrice = rs.getString("productPrice");
        productImage = rs.getString("image");
        productStock = rs.getString("productStock");
        glassplantpotContent = rs.getString("glassplantpotContent");
	%>


<div class="all">
        <section class="slider">
            <div class="slide">
                <img src=<%=productImage%> style="width:100%">
            </div>
            <div class="slide">
                <img src="plantimage/居家/1-2.jpg" style="width:100%">
            </div>
            <div class="slide">
                <img src="plantimage/居家/1-3.jpg" style="width:100%">
            </div>
            <div class="slide">
                <img src="plantimage/居家/1-4.jpg" style="width:100%">
            </div>
                
            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>
        
            <script>
                let slideIndex = 1;
                showSlides(slideIndex);

                function plusSlides(n) {
                showSlides(slideIndex += n);
                }

                function showSlides(n) {
                let i;
                let slides = document.getElementsByClassName("slide");
                if (n > slides.length) {slideIndex = 1}
                if (n < 1) {slideIndex = slides.length}
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slides[slideIndex-1].style.display = "block";
                }
            </script>
        </section>
		

        <section class="content">
            <h1><%=productName%></h1>
            <hr>
            <h1>＄<%=productPrice%></h1>
            <hr>
            <h1 style="margin-bottom: 5px;">介紹：</h1>
            <p><%=glassplantpotContent%></p>
            <hr>
            <h1 style="margin-bottom: 5px;">庫存：</h1>
            <p style="font-weight: bold; font-size: 30px; "><%=productStock%></p>
            <hr>
        </section>
			
		
        <section class="BuySection">
		<form action="insertcart4.jsp" method="post" class="whole">
                <div class="NumSection">
                    <button class="minus" type="button" >一</button>
                    <input type="text" class="num" value="1">
                    <button class="plus" type="button" >十</button>
                </div>
                <div class="AddCartSection">
                    <input type="hidden" name="productID" value="<%= productID %>">
                    <input type="hidden" name="productPrice" value="<%= productPrice %>">
                    <input type="hidden" name="productStock" value="<%= productStock %>">
                    <input type="hidden" name="quantity" value="<%=quantity%>">
                    <input type="hidden" name="username" value="<%= username1 %>">
                    <input type="hidden" name="cartdate" value="<%= new java.sql.Date(System.currentTimeMillis()) %>>">
                    <button type="submit" class="AddCart">加入購物車</button>
                </div>
            </form>
            <script>
                const numInput = document.querySelector('.num');
				const minusButton = document.querySelector('.minus');
				const plusButton = document.querySelector('.plus');
				const hiddenQuantityInput = document.querySelector('input[name="quantity"]');

				minusButton.addEventListener('click', () => {
					changeQuantity(-1);
				});

				plusButton.addEventListener('click', () => {
					changeQuantity(1);
				});

				function changeQuantity(change) {
					let currentQuantity = parseInt(numInput.value);
					currentQuantity += change;
					if (currentQuantity < 0) currentQuantity = 0; // 確保數量不會小於 0
					numInput.value = currentQuantity;
					hiddenQuantityInput.value = currentQuantity; // 更新隱藏的 input 標籤的值
				}


            </script>
			<%}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 關閉資源
				if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
				if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
				if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
			}
			%>
		
			   
			
        </section>
			<%
				String username = (String) session.getAttribute("username");
				String productID1 = request.getParameter("productID");
			%>
        <section class="below">
            <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
            <div class="CommentSection">
                <h1>商品評論：</h1>
				<div class="cm">
				<%
				Connection con1 = null;
				PreparedStatement pstmt1 = null;
				ResultSet rs1 = null;

				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
					String user = "root"; 
					String password = "1234";
					con1 = DriverManager.getConnection(url, user, password);

					String query = "SELECT username, content, rating, commentdate FROM comment WHERE productID = ? AND productCategory = 'glassplantpot' ORDER BY commentdate DESC";
					pstmt1 = con1.prepareStatement(query);
					pstmt1.setString(1, productID1);
					rs1 = pstmt1.executeQuery();

					while (rs1.next()) {
						int rating = rs1.getInt("rating"); 
						String content = rs1.getString("content");
						java.sql.Date commentdate = rs1.getDate("commentdate");
				%>
                
                    <div class="block">
                        <h2><%= username %></h2>
                        <% for (int i = 1; i <= 5; i++) { %>
                            <iconify-icon icon="material-symbols:star" width="30" class="<%= i <= rating ? "star" : "star-grey" %>"></iconify-icon>
                        <% } %>
                        <p><%= content %></p>
                        <p id="date"><%= commentdate %></p>
                    </div>
                    <hr>
			<%
                }
            } catch (SQLException sExec) {
                out.println("SQL錯誤: " + sExec.toString());
            } catch (ClassNotFoundException cnfExec) {
                out.println("類加載錯誤: " + cnfExec.toString());
            } finally {
                if (rs1 != null) try { rs1.close(); } catch (SQLException ignore) {}
                if (pstmt1 != null) try { pstmt1.close(); } catch (SQLException ignore) {}
                if (con1 != null) try { con1.close(); } catch (SQLException ignore) {}
            }
			%> 
                </div>        
            </div>
			

            <div class="QA">
                <h1>常見問題：</h1>
                <hr>
                <p><a href="#">照顧方法</a></p>
                <p><a href="#">超商/宅配</a></p>
                <p><a href="#">退換貨說明</a></p>
				<p><a href="#bottom">更多...</a></p>
            </div>
        </section>
         <div class="press">
            <button class="class" name="commentButton">我要留言：</button>
            <form action="insertcomment4.jsp" method="post" class="commentForm">
                <div class="MyCm">
                    <input type="hidden" name="productID" value="<%= productID1 %>">
                    <input type="hidden" name="commentdate" value="<%= new java.sql.Date(System.currentTimeMillis()) %>>">
                    <h2><%= username %></h2>
                    <input type="hidden" name="rating" id="rating" value="0">
                    
                    <div class="AllStar">
                        <% for (int i = 1; i <= 5; i++) { %>
                            <iconify-icon icon="material-symbols:star" width="30" data-index="<%= i %>" class="star-grey" onclick="setRating(<%= i %>)"></iconify-icon>
                        <% } %>
                    </div>
                    <!--------------星星評分-------------->
                    <script>
                        function setRating(rating) {
                            document.getElementById('rating').value = rating;
                            var stars = document.querySelectorAll('.AllStar iconify-icon');
                            stars.forEach(function(star, index) {
                                if (index < rating) {
                                    star.classList.remove('star-grey');
                                    star.classList.add('star');
                                } else {
                                    star.classList.remove('star');
                                    star.classList.add('star-grey');
                                }
                            });
                        }

                        </script>
                    <!--------------星星評分-------------->

                    <div><textarea name="content" placeholder="在這裡寫下您的留言..."></textarea></div>

                    <div><button type="submit" class="send">送出</button></div>
                    <!--------------按'留言'彈出-------------->
                    <script>
                        const press = document.querySelector('.press');
                        const MyCm = document.querySelector('.MyCm');
                        const toggleButton = document.querySelector('.class');

                        toggleButton.addEventListener('click', toggleContent);

                        function toggleContent() {
                            MyCm.classList.toggle('show');

                            if (MyCm.classList.contains('show')) {
                                press.style.height = 'auto'; 
                            } else {
                                press.style.height = '';
                            }
                        }
                    </script>
                    <!--------------按'留言'彈出-------------->
                </div>
            </form>
        </div>

        <section class="others">
            <div class="rec"><h1>其他您可能有興趣的商品：</h1></div>
            <hr>
            <div class="gallery">  
		<%
		String url = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
        String user = "root"; 
        String password = "1234";
		Connection conn = null;
                Statement stmt = null;

                  List<Integer> photoIDs = new ArrayList<Integer>();

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    stmt = conn.createStatement();
                    String query = "SELECT ID FROM randomimage ORDER BY RAND() LIMIT 5";
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        photoIDs.add(rs.getInt("ID"));
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }

                 for (Integer photoID : photoIDs) {
					String photoUrl = "plantimage/隨機/" + photoID + ".jpg";
        %>
                    <img src="<%= photoUrl %>">
            <%
                }
            %>

            </div>
		</section>

        </section>

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