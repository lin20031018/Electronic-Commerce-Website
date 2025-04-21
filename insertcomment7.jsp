<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>插入評論</title>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    String productID = request.getParameter("productID");
    String ratingParam = request.getParameter("rating");
    int rating = 0;
	if (ratingParam != null && !ratingParam.isEmpty()) {
        rating = Integer.parseInt(ratingParam);
    }
    if (ratingParam != null && !ratingParam.isEmpty()) {
        String content = request.getParameter("content");
		java.sql.Date commentdate = new java.sql.Date(System.currentTimeMillis());

		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement memberPstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/plantshop?serverTimezone=UTC";
			String user = "root"; 
			String password = "1234";
			con = DriverManager.getConnection(url, user, password);

		

			String sql = "INSERT INTO comment ( productCategory, productID, username, content, rating, commentdate) VALUES ('homegoods', ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productID);
			pstmt.setString(2, username);
			pstmt.setString(3, content);
			pstmt.setInt(4, rating);
		   pstmt.setDate(5, new java.sql.Date(new java.util.Date().getTime()));

			pstmt.executeUpdate();
		} catch (SQLException sExec) {
			out.println("SQL錯誤: " + sExec.toString());
		} catch (ClassNotFoundException cnfExec) {
			out.println("類加載錯誤: " + cnfExec.toString());
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
			if (memberPstmt != null) try { memberPstmt.close(); } catch (SQLException ignore) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
			if (con != null) try { con.close(); } catch (SQLException ignore) {}
		}

		response.sendRedirect("product7.jsp?productID=" + productID);
    } else {
        out.println("評分值不能為空");

    }
%>
</body>
</html>
