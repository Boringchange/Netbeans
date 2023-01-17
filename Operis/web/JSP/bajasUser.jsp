<%@ page import="java.sql.*" %>

<%!
    Statement stmt = null;
    Connection con = null;
    
    int id, idadmin;
%>

<!DOCTYPE html>
<html>
    <head>
        <%
        id = Integer.parseInt(request.getParameter("EditarID"));
        
        idadmin = Integer.parseInt(request.getParameter("IDMaster"));

        Class.forName("com.mysql.jdbc.Driver").newInstance();

        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");

        stmt = con.createStatement();
                
        stmt.executeUpdate("DELETE FROM Personal where idper ="+ id +"");
    %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <form action="GestionUsuario.jsp">
            <script> alert ("Usuario elimando exitosamente.");</script>
            <input  type="text" style="display: none" name="idadmin" value="<%out.println(idadmin);%>">
            <button type="submit" id="a" style="display: none">a</button>
            <script>document.getElementById('a').click();</script>
        </form>
    </body>
</html>
