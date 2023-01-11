<%@ page import="java.sql.*" %>

<%!
    Statement stmt = null;
    Connection con = null;
    
    int id, sueldo=1;
    String name,type,num;
%>

<!DOCTYPE html>
<html>
    <head>
        <%
        id = Integer.parseInt(request.getParameter("id"));

        Class.forName("com.mysql.jdbc.Driver").newInstance();

        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");

        stmt = con.createStatement();
                
        stmt.executeUpdate("DELETE FROM Personal where idper ="+ id +"");
    %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar User</title>
    </head>
    <body>
        <meta http-equiv="Refresh" content="0;url=GestionUsuario.jsp">
    </body>
</html>
