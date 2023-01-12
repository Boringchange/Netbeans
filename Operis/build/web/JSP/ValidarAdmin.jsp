<%@ page import="java.sql.*" %>

<%!
    Statement stmt = null;
    ResultSet rs = null;
    Connection con = null;

    String query = "SELECT * FROM Personal";
    
    int id;
    String tipo;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();

        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");

        stmt = con.createStatement();

        id =Integer.parseInt(request.getParameter("idadmin"));
       
        rs = stmt.executeQuery("SELECT * FROM personal where idper ="+     id    +"");
        %>
    </head>
    <body>
        <%
        
    if (rs.next())
    {
        tipo = rs.getString("tipo_per");
     
        if (tipo.equals("administrador")){%>
        <form action="GestionUsuario.jsp">
            <input  type="text" style="display: none" name="idadmin" value="<%out.println(id);%>">
            <button type="submit" id="a" style="display: none">a</button>
            <script>document.getElementById('a').click();</script>
        </form>
        <%}
else{
%>
<script> alert ("Esta cuenta no tiene permisos de administrador");</script>
<meta http-equiv="Refresh" content="0;url=../HTML/Operis_direct.html">
<%
}
    }
    else{%>
    <script> alert ("El usuario no existe");</script>
    <meta http-equiv="Refresh" content="0;url=../HTML/Operis_direct.html">     
<%}
%>
    </body>
</html>


