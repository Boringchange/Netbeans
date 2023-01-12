<%@ page import="java.sql.*" %>

<%!
    Statement stmt = null, stmt2 = null;
    ResultSet rs = null;
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
        
        stmt2 = con.createStatement();

        idadmin =Integer.parseInt(request.getParameter("IDMaster"));
        
        id = Integer.parseInt(request.getParameter("NewID"));
        
        rs = stmt.executeQuery("SELECT * FROM personal where idper ="+     id    +"");
        
        name = request.getParameter("NewName");
        
        type = request.getParameter("NewType");
        
        num = request.getParameter("NewNum");
        %>
    </head>
    <body>
        <%
            if(rs.next()){
                %>
                <script> alert ("El usuario ya existe");</script>
                <%
            }
            else{
                stmt2.executeUpdate("INSERT INTO Personal VALUES("+id+",'"+name+"','"+type+"' , 1 , '"+num+"')");
                %>
                <form action="GestionUsuario.jsp">
                    <script> alert ("Usuario registrado exitosamente.");</script>
                    <input  type="text" style="display: none" name="idadmin" value="<%out.println(id);%>">
                    <button type="submit" id="a" style="display: none">a</button>
                    <script>document.getElementById('a').click();</script>
                </form>
                <%
            }
        %>
    </body>
</html>