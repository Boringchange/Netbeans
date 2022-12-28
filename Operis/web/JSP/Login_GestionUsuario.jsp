<%@ page import="java.sql.*" %>

<%!
    Statement stmt = null;
    ResultSet rs = null;
    Connection con = null;

    String query = "SELECT * FROM Personal";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="../CSS/Login.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();

        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");

        stmt = con.createStatement();

        //rs = stmt.executeQuery("SELECT * FROM personal where idper ="+     id    +"");
    %>
</head>
<body>
<main class="fondo">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3" style="height: 1082px">
            </div>
            <div class="col-md-6">
                <div class="divchild">
                    <img  width="200px" src="../IMG/login.png">
                    <h2 style="margin-top: 7%">Ingrese ID de administrador</h2>
                    <form action="../JSP/GestionUsuario.jsp" method="post" name="buscar">
                        <input style="margin-top: 5%" type="number" placeholder="12345678" class="input_login" name="idadmin">
                        <br>
                        <button type="submit" class="Bt_Login">&nbsp&nbsp&nbsp&nbsp&nbspIngresar&nbsp&nbsp&nbsp&nbsp&nbsp</button>
                    </form>
                </div>
                <form action="Operis_direct.html">
                    <div class="div_buttonback">
                        <button class="bt_back"><img width="200px" src="../IMG/bt_back.png"></button>
                    </div>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</main>
</body>
</html>