<%@ page import="java.sql.*" %>

<%!
    Statement stmt = null;
    ResultSet rs = null;
    Connection con = null;
    
    int id, sueldo=1;
    String name,type,num;
    String query = "SELECT * FROM Personal";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambios</title>
        <%
        id = Integer.parseInt(request.getParameter("ID"));
        name = request.getParameter("name");
        type = request.getParameter("type");
        num = request.getParameter("num");

        Class.forName("com.mysql.jdbc.Driver").newInstance();

        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");

        stmt = con.createStatement();
                
        rs = stmt.executeQuery("SELECT * FROM personal where idper ="+     id    +"");        
    %>
    </head>
    <body>
        <%
        if (rs.next()){
                stmt.executeUpdate("update personal SET nom_per='" + name +"', tipo_per ='"+ type +"', sueldo_per = "+ sueldo +", tel_per='"+ num +"' where idper ="+ id +" ; ");
                %>
                <meta http-equiv="Refresh" content="0;url=../HTML/EditUser.html">
        <%
            }
            else{%>
                            <script> alert ("El usuario no existe.");</script>
                            <meta http-equiv="Refresh" content="0;url=../HTML/EditUser.html">                            
        <%
            }%>
    </body>
</html>
