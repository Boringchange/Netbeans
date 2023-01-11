<%@ page import="java.sql.*" %>

<%!
    Statement stmt = null;
    Connection con = null;
    
    int id, idadmin;
    String name, type, num;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();

        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");

        stmt = con.createStatement();

        idadmin =Integer.parseInt(request.getParameter("IDMaster"));
        
        id = request.
        %>
    </head>
    
    <body>
        
    </body>
</html>