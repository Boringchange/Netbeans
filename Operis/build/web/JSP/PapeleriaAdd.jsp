<!DOCTYPE html>
<%@page import="java.sql.*"%>

<html lang="en">
    <head>
        <%!
        Statement stmt = null;
        Connection con = null;
        ResultSet rs = null;
        
        int idadmin;
        %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Añadir producto</title>
        <link href="../CSS/Papeleria_add_mod.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM Producto");
        
        idadmin = Integer.parseInt(request.getParameter("idadmin"));
        %>
        <header>
            <h1>Agregar</h1>
        </header>
        <br>
        <br>
        <main>
            <div class="container">
                <form action="AltasProducto.jsp">
                    <div class="row">
                        <div class="col-md-4" style="height: 100px">
                            <button class="Botones" disabled>Nombre del producto</button>
                        </div>
                        <div class="col-md-8">
                            <input class="input" name="Name">
                        </div>
                    </div>
                    <div class="row" style="margin-top: 4%">
                        <div class="col-md-4" style="height: 100px">
                            <button class="Botones" disabled>Precio base</button>
                        </div>
                        <div class="col-md-8">
                            <input class="input" name="BasePrice">
                        </div>
                    </div>
                    <div class="row" style="margin-top: 4%">
                        <div class="col-md-4" style="height: 100px">
                            <button class="Botones" disabled>Precio de venta</button>
                        </div>
                        <div class="col-md-8">
                            <input class="input" name="SalePrice">
                        </div>
                    </div>
                    <div class="row" style="margin-top: 4%">
                        <div class="col-md-4" style="height: 100px">
                            <button class="Botones" disabled>No. de piezas</button>
                        </div>
                        <div class="col-md-2">
                            <input class="input" name="Number">
                        </div>
                    </div>
                    <div class="row" style="margin-top: 4%">
                        <div class="col-md-4"></div>
                        <div class="col-md-3">
                            <input value="<%out.println(idadmin);%>" name="id" style="display: none;">
                            <button class="btn btn-outline-primary" style="border-radius: 20px;"><i class='bx bx-plus-circle'></i> Agregar</button>
                        </div>
                    </form>
                    <div class="col-md-3">
                        <button class="btn btn-outline-danger" style="border-radius: 20px;"><i class='bx bx-trash' ></i>Limpiar</button>
                    </div>
                </div>
                <div class="row" style="margin-top: 4%">
                    <div class="col-md-2">
                        <form action="PapeleriaInvent.jsp">
                            <input value="<%out.println(idadmin);%>" name="id" style="display: none;">
                            <button class="btn btn-outline-secondary" style="border-radius: 20px;"><i class='bx bx-arrow-back' ></i> Regresar</button>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>