<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.Random"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="login.css">
	<link rel="stylesheet" href="register.css">
</head>
<body>
<%
    // 登入處理
    if (request.getParameter("login_username") != null && !request.getParameter("login_username").equals("")
        && request.getParameter("login_password") != null && !request.getParameter("login_password").equals("")) {

        String url = "jdbc:mysql://localhost:3306/plantshop?serverTimezone=UTC";
        String dbUser = "root";
        String dbPassword = "1234";

        String sql = "SELECT * FROM member WHERE username=? AND password=?";
        
        try (
            Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
            PreparedStatement pstmt = con.prepareStatement(sql);
        ) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String loginUsername = request.getParameter("login_username");
            String loginPassword = request.getParameter("login_password");
            pstmt.setString(1, loginUsername);
            pstmt.setString(2, loginPassword);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    session.setAttribute("username", loginUsername);
                    if (loginUsername.equals("11144122") && loginPassword.equals("1234")) {
                        response.sendRedirect("backend.html");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                    return;
                } else {
                    out.println("密碼帳號不符 !! <a href='index.jsp'>按此</a>重新登入");
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("資料庫驅動加載錯誤：" + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("資料庫錯誤：" + e.getMessage());
        }
    }
%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String fullname = request.getParameter("fullname");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender"); // 使用getParameter来接收单个值
    String birthdate = request.getParameter("birthdate");

    if (username != null && password != null && fullname != null && phone != null && address != null && email != null && gender != null && birthdate != null) {
        try {
            // Step 1: 載入資料庫驅動程式 
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (
                // Step 2: 建立連線 
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plantshop?serverTimezone=UTC", "root", "1234");
                // Step 3: 準備 SQL 指令
                PreparedStatement pstmt = con.prepareStatement("INSERT INTO member (username, password, fullname, phone, address, email, gender, birthdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")
            ) {
                // Step 4: 設置 SQL 指令中的參數
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                pstmt.setString(3, fullname);
                pstmt.setString(4, phone);
                pstmt.setString(5, address);
                pstmt.setString(6, email);
                pstmt.setString(7, gender);
                pstmt.setDate(8, Date.valueOf(birthdate)); 

                // Step 5: 執行 SQL 指令
                int no = pstmt.executeUpdate();
                if (no > 0) {
                    // Step 6: 顯示結果
                    out.println("<div style='text-align: center;'>註冊成功！<a href='index.jsp'>按此</a>關閉此狀態列</div>");
                } else {
                    out.println("註冊失敗！<a href='index.jsp'>按此</a>回主頁重新註冊");
                }
            } catch (SQLException sExec) {
                out.println("SQL錯誤: " + sExec.toString());
            }
        } catch (ClassNotFoundException err) {
            out.println("class錯誤: " + err.toString());
        }
    }
%>
    <!--cookie--> 
    <div class="cookie" id="cookie"><p style="margin:10px;">請允許我們使用cookie</p>
    <button class="agree" id="agreeButton">同意</button>
    <button class="reject" id="rejectButton">拒絕</button>
    </div>
    <script>
        // 獲取同意和拒绝按鈕及 cookie 提示 div 元素
        const agreeButton = document.getElementById('agreeButton');
        const rejectButton = document.getElementById('rejectButton');
        const cookieDiv = document.getElementById('cookie');
        // 定義關閉 cookie 提示 div 的函数
        function closeCookieDiv() {
          cookieDiv.style.display = 'none';
        }
        // 為同意和拒绝按鈕添加點擊事件監聽器
        agreeButton.addEventListener('click', closeCookieDiv);
        rejectButton.addEventListener('click', closeCookieDiv);
    </script>
    <!--cookie--> 
    <nav>
        <a href="#"><img src="img/logo.png" alt="logo" style="width: 130px;position:absolute;top: 15px;left: 10px;"></a>
        <a href="allproduct.jsp">植栽</a>
        <a href="member.jsp">會員專區</a>
        <a href="aboutus.html">關於我們</a>
        <div class="user">
            <button class="user"><img src="img/user.png" alt="user"></button>
            <ul class="menu">
                <li>
                  <button onclick="openLoginForm()" class="userbutton">登入</button>
                </li>
                <li>
                  <button onclick="openregisterForm()" class="userbutton">註冊</button>
                </li>
            </ul>
        </div>
<!-------------user 跳出視窗(login.html/register.html)-------------------->
        <div id="loginForm" class="modal">
            <form class="modal-content animate" action="index.jsp" method="post">
                <span class="close" onclick="closeLoginForm()">&times;</span>
                <div class="container">
                    <label for="uname"><b>帳號</b></label>
                    <input type="text" placeholder="請輸入帳號" name="login_username" required>

                    <label for="psw"><b>密碼</b></label>
                    <input type="password" placeholder="請輸入密碼" name="login_password" required>    
                    <button type="submit" class="login">登入</button>
                </div>
            </form>
        </div>

    <script>
        function openLoginForm() {
        document.getElementById("loginForm").style.display = "block";
        }

        function closeLoginForm() {
            event.preventDefault();
            document.getElementById("loginForm").style.display = "none";
        }

    </script>
<!--register-->
<div id="registerForm" class="modal">
    <form class="modal-content animate" action="index.jsp" method="post">
        <span class="close" onclick="closeregisterForm()">&times;</span>
        <h1>會員註冊</h1>
        <div class="containerregister">
            <label for="username">會員帳號:</label><br>
            <input type="text" id="username" name="username" required><br>
            
            <label for="password">會員密碼:</label><br>
            <input type="password" id="password" name="password" required><br>
            
            <label for="confirm_password">重複密碼:</label><br>
            <input type="password" id="confirm_password" name="confirm_password" required><br>
            
            <label for="fullname">會員名字:</label><br>
            <input type="text" id="fullname" name="fullname" required><br>
            
            <label for="phone">電話:</label><br>
            <input type="tel" id="phone" name="phone" required><br>
            
            <label for="address">會員住址:</label><br>
            <input type="text" id="address" name="address" required><br>
            
            <label for="email">電子信箱:</label><br>
            <input type="email" id="email" name="email" required><br>
            
            <label>會員性別:</label><br>
            <input type="radio" id="male" name="gender" value="male" required>
            <label for="male">男性</label>
            <input type="radio" id="female" name="gender" value="female" required>
            <label for="female">女性</label><br>
            
            <label for="birthdate">會員生日:</label><br>
            <input type="date" id="birthdate" name="birthdate" required><br>
            
            <input type="submit" class="registerbutton" value="送出">
        </div>
    </form>
</div>

<script>
function openregisterForm() {
document.getElementById("registerForm").style.display = "block";
}

function closeregisterForm() {
    event.preventDefault();
    document.getElementById("registerForm").style.display = "none";
}

</script>
<!-------------user 跳出視窗(login.html/register.html)-------------------->
        <div class="cart">   
            <a href="cart.jsp" style="padding: 0;"><button class="cart"><img src="img/cart.png" alt="user"></button></a>
        </div>
        <!--<div class="search">
            <form><input class="search-button" type="image" src="img/search.png"  alt="send" name="searchbutton" id="searchbutton"></form>
            <input class="search-bar" type="text" name="search" id="search" placeholder="在此輸入" style="width: 150px;">
        </div>-->
    </nav>
    <main>      
        <section class="ad">
            <%
			try {
				// Step 1: 載入資料庫驅動程式 
				Class.forName("com.mysql.jdbc.Driver");
				try {
					// Step 2: 建立連線 
					String url = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC&useSSL=false";
					Connection con = DriverManager.getConnection(url, "root", "1234");
					if (con.isClosed())
						out.println("連線建立失敗");
					else {
						// Step 3: 獲取 `randad` 表中的總行數 `n`
						String sql = "SELECT COUNT(*) FROM `randad`";
						ResultSet rs = con.createStatement().executeQuery(sql);
						rs.next();
						int n = rs.getInt(1);

						// 設定亂數 ran
						Random ran = new Random();
						// current_adid 亂數決定值為 1 到 n
						int current_adid = ran.nextInt(n) + 1;

						// Step 4: 執行 SQL 指令, 根據隨機選擇的 current_adid 查詢
						sql = "SELECT * FROM `randad` WHERE `ADID`= " + current_adid;
						rs = con.createStatement().executeQuery(sql);

						// Step 5: 顯示廣告和跑馬燈文本
						String adHtml = "";
						String marqueeText = "";
						if (rs.next()) { // 只有一筆資料
							marqueeText = rs.getString("texts");
							adHtml =
									"<img src='" + rs.getString("file_path") + "/" + rs.getString("ad_file") + "' " +
									 "alt='" + rs.getString("texts") + "' width='40%' height='60%'></a>";
						}

						// 顯示跑馬燈文本
						out.println("<marquee>" + marqueeText + "</marquee>");

						// 顯示廣告
						out.println(adHtml);

						// Step 6: 關閉連線
						con.close();
					}
				} catch (SQLException sExec) {
					out.println("SQL錯誤" + sExec.toString());
				}
			} catch (ClassNotFoundException err) {
				out.println("class錯誤" + err.toString());
			}
		%>
            
            <!--動態廣告-->
        </section>
        <section class="series">
            <a href="allproduct.jsp"><img src="plantimage/方盆/1-1.jpg" alt="plantseries1"></a>
            <h2>方盆系列</h2>
            <a href="allproduct.jsp"><img src="plantimage/犀力/1-1.jpg" alt="plantseries2"></a>
            <h2>犀力系列</h2>
            <a href="allproduct.jsp"><img src="plantimage/窯瓷/1-1.jpg" alt="plantseries3"></a>
            <h2>窯瓷系列</h2>
            <a href="allproduct.jsp"><img src="plantimage/水泥/1-1.jpg" alt="plantseries4"></a>
            <h2>水泥系列</h2>
            <a href="allproduct.jsp"><img src="plantimage/玻璃/1-1.jpg" alt="plantseries5"></a>
            <h2>玻璃系列</h2>
            <a href="allproduct.jsp"><img src="plantimage/居家/1-1.jpg" alt="plantseries6"></a>
            <h2>居家小物</h2>
        </section>
		<section class="recommend" style="background-color: rgb(215, 215, 215);">
    <div class="recommend-container">
        <div class="recommend-text">
            <p>推薦商品</p>
        </div>
        <div class="slider-container">
            <button class="prev">←</button>
            <div class="slider">
                <% 
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
                        String user = "root";
                        String password3 = "1234";
                        con = DriverManager.getConnection(url, user, password3);

                        String sql = "SELECT * FROM allplantpots WHERE productID IN (1, 2, 3, 4)";
                        pstmt = con.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            String image = rs.getString("image");
                %>
                            <div class="slide"><img src="<%=image%>" alt="推薦商品圖片"></div>
                <% 
                        }
                    } catch (SQLException | ClassNotFoundException e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                        if (con != null) try { con.close(); } catch (SQLException ignore) {}
                    }
                %>
            </div>
            <button class="next">→</button>
        </div>
    </div>
</section>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const slider = document.querySelector('.slider');
        const slides = document.querySelectorAll('.slide');
        const prevButton = document.querySelector('.prev');
        const nextButton = document.querySelector('.next');
        let index = 0;

        function showSlide(index) {
            slider.style.transform = `translateX(${-index * 100}%)`;
        }

        prevButton.addEventListener('click', () => {
            index = (index > 0) ? index - 1 : slides.length - 1;
            showSlide(index);
        });

        nextButton.addEventListener('click', () => {
            index = (index < slides.length - 1) ? index + 1 : 0;
            showSlide(index);
        });
    });
</script>

        
    </main>
    <footer>
        <div><p style="font-size: 24px;">常見問題</p><br><a href="#">會員管理</a><br><a href="#">照顧方法</a><br><a href="#">超商/宅配</a><br><a href="#">退換貨說明</a> </div>
        <div><p style="font-size: 24px;">品牌名稱</p><br><a href="#">我們的故事</a><br><a href="#">植物大哉問</a></div>
        <!--品牌名稱改-->
        <div class="contact"><p style="font-size: 24px;">聯絡我們</p> 
        <br><a href="#"><img src="img/ig.png" alt="ig"></a><a href="#"><img src="img/fb.png" alt="fb"></a><a href="#"><img src="img/line.png" alt="line"></a><a href="#"><img src="img/gmail.png" alt="gmail"></a>
        <p style="font-size: 17px;">客服電話 : 0800-800800 <br>服務時間：週一至週五 09:00-18:00</p> 
        </div> 
        <h5>2024 版權所有</h5>
		
<%
  int counter=0;
  String strNo="";
  
  if (application.getAttribute("counter")==null){
	  application.setAttribute("counter", "1000"); 
  }
  else{
  
  strNo = (String)application.getAttribute("counter");
  counter = Integer.parseInt(strNo); 
  if (session.isNew())
  counter++;                                       
  strNo = String.valueOf(counter);    
  application.setAttribute("counter", strNo);
  }

%>
		<h3 style="grid-column: span 4;grid-row: span 1;">你是第<%= counter %>位造訪的貴賓!</h3>		
    </footer>
	
</body>
</html>