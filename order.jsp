<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>傳送到order資料庫</title>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    ArrayList<String> productRecList = new ArrayList<>();
    ArrayList<String> quantityRecList = new ArrayList<>();
    if (username != null && !username.equals("")) {
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
                    
                    productRecList.add(productName); // 修改這裡
                    quantityRecList.add(String.valueOf(quantity)); // 修改這裡
                }
                show_rs.close();
                show_pstmt.close();
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

<%    
    int size = productRecList.size();
    
    // 轉換為普通陣列
    String[] productRec = productRecList.toArray(new String[size]);
    String[] quantitytRec = quantityRecList.toArray(new String[size]);
    
    String[] usernameRec = new String[size]; 

    for(int i = 0; i < size; i++){
        usernameRec[i] = username;
    }
%>

<%
    try {
        // Step 1: 載入資料庫驅動程式 
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        try (
            // Step 2: 建立連線 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plantshop?serverTimezone=UTC", "root", "1234");
            // Step 3: 準備 SQL 指令
            PreparedStatement pstmtOrder = con.prepareStatement("INSERT INTO `order` (username, productname, quantity) VALUES (?, ?, ?)")
        ) {
            // 設置 SQL 指令中的參數並執行插入操作
            boolean orderInsertSuccess = true;
            for (int i = 0; i < size; i++) {
                pstmtOrder.setString(1, usernameRec[i]);
                pstmtOrder.setString(2, productRec[i]);
                pstmtOrder.setInt(3, Integer.parseInt(quantitytRec[i]));
                int orderNo = pstmtOrder.executeUpdate();
                if (orderNo <= 0) {
                    orderInsertSuccess = false;
                    break;
                }
            }

            if (orderInsertSuccess) {
                // Step 4: 顯示結果
                //out.println("<div style='text-align: center;'>插入成功！<a href='index.jsp'>按此</a>關閉此狀態列</div>");
				response.sendRedirect("index.jsp");
            } else {
                out.println("插入失敗！<a href='index.jsp'>按此</a>回主頁重新操作");
            }
        } catch (SQLException sExec) {
            out.println("SQL錯誤: " + sExec.toString());
        }
    } catch (ClassNotFoundException err) {
        out.println("class錯誤: " + err.toString());
    }
%>
</body>
</html>
