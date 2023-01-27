<%@page import="java.sql.*"%>
<hmtl>
    <head>
        <%!
        Statement stmt = null, stmt2= null;
        Connection con = null;
        ResultSet rs = null;
        
        String Name;
        int BasePrice, SalePrice, Number, id;
        %>
    </head>
    <body>
        <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");
        stmt = con.createStatement();
        stmt2 = con.createStatement();
        Name = request.getParameter("Name");
        BasePrice = Integer.parseInt(request.getParameter("BasePrice"));
        SalePrice = Integer.parseInt(request.getParameter("SalePrice"));
        Number = Integer.parseInt(request.getParameter("Number"));
        id = Integer.parseInt(request.getParameter("id"));
        
        rs = stmt.executeQuery("SELECT * FROM Producto WHERE nom_produ = '"+ Name +"' ");
        
        if(rs.next()){
        %>
        <script> alert ("El producto ya existe");</script>
        <form action="PapeleriaAdd.jsp">
            <input  type="text" style="display: none" name="idadmin" value="<%out.println(id);%>">
            <button type="submit" id="a" style="display: none">a</button>
            <script>document.getElementById('a').click();</script>
        </form>
        <%
            }
            else{
            stmt2.executeUpdate("INSERT INTO Producto VALUES(default,'"+Name+"',"+Number+","+BasePrice+","+SalePrice+")");
            %>
            <script> alert ("Prodcuto registrado");</script>
            <form action="PapeleriaAdd.jsp">
                <input  type="text" style="display: none" name="idadmin" value="<%out.println(id);%>">
                <button type="submit" id="a" style="display: none">a</button>
                <script>document.getElementById('a').click();</script>
             </form>
        <%
            }
        %>
    </body>
</hmtl>
