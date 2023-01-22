<%@page import="java.sql.*"%>

<%!
Statement stmt = null;
Connection con = null;
ResultSet rs = null;

int id;
%>

<html>
    <head>
        <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        
        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");
        
        stmt = con.createStatement();

        id = Integer.parseInt(request.getParameter("id"));
        
        rs = stmt.executeQuery("SELECT * FROM personal where idper ="+  id  +"");
        %>
    </head>
    <body>
        <%
        if(rs.next()){
            %>
            <form action="PapeleriaInvent.jsp">
                <input type="text" style="display: none" name="id" value="<%out.println(id);%>">
                <button type="submit" id="a" style="display: none;">a</button>
                <script>document.getElementById('a').click();</script>
            </form>
            <%
            }
        else{
            %>
            <script> alert ("No existe el usuario");</script>
            <META HTTP-EQUIV="REFRESH" CONTENT="0;URL=../HTML/Login_Papeleria.html">
            <%
            }
        %>
    </body>
</html>
