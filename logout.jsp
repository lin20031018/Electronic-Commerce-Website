<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 使當前會話無效
    session.invalidate();
    // 重定向到登錄頁面或首頁
    response.sendRedirect("index.jsp");
%>