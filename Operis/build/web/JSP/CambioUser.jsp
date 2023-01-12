<%@ page import="java.sql.*" %>

<%!
    Statement stmt = null;
    ResultSet rs = null;
    Connection con = null;
    
    int id, sueldo=1, idadmin;
    String name,type,num;
    String query = "SELECT * FROM Personal";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambios</title>
        <%
        id = Integer.parseInt(request.getParameter("ID"));
        idadmin = Integer.parseInt(request.getParameter("idadmin"));
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
                <form action="GestionUsuario.jsp">
                    <script> alert ("Usuario modificado exitosamente.");</script>
                   <input  type="text" style="display: none" name="idadmin" value="<%out.println(idadmin);%>">
                    <button type="submit" id="a" style="display: none" >a</button>
                    <script>document.getElementById('a').click();</script>
                </form>
        <%
            }
            else{%>
                            <form action="GestionUsuario.jsp">
                                <script> alert ("El usuario no existe.");</script>
                                <input  type="text" style="display: none" name="idadmin" value="<%out.println(idadmin);%>">
                                <button type="submit" id="a" style="display: none" >a</button>
                                <script>document.getElementById('a').click();</script>
                            </form>                      
        <%
            }%>
    </body>
</html>
