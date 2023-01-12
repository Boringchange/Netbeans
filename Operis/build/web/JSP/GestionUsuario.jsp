<%@ page import="java.sql.*" %>

<%!
    Statement stmt = null;
    ResultSet rs = null;
    Connection con = null;
    
    int ID, ShowID;
    String Name;
    String EmployedType;
    
    
    String query = "SELECT * FROM Personal";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gestion Usuario</title>
    <link href="../CSS/GestionUsuario.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%
        ID = Integer.parseInt(request.getParameter("idadmin"));
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
    
        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");
    
        stmt = con.createStatement();
        
        rs = stmt.executeQuery("SELECT * FROM personal");
    %>
<div class="divTxtBig">
    <h1 class="h1Header">Registrar/Modificar usuario</h1>
</div>
<form action="AltasAdmin.jsp">
    <main class="fondo">
        <div class="row" style="margin-top: 3%">
            <div class="col-md-4">
                <img width="400px" height="425px" src="../IMG/login.png" class="img">
            </div>
            <div class="col-md-6">
                <main class="fondo">
                    <div class="row">
                        <div class="col-md-6">
                            <input placeholder="ID de usuario" class="ouiduser" disabled>
                            <div class="col-md-12" style="margin-top: 3%">
                                <input placeholder="Nombre" class="ouiduser" disabled>
                            </div>
                            <div style="margin-top: 3%">
                                <input placeholder="Tipo" class="ouiduser" disabled>
                            </div>
                            <div style="margin-top: 3%">
                                <input placeholder="Numero de telefono" class="ouiduser" disabled>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <input placeholder="de 6 digitos" type="number" class="iniduser" name="NewID">
                            <div class="col-md-12" style="margin-top: 3%">
                                <input type="text" placeholder="Juan" class="iniduser" name="NewName">
                            </div>
                            <div style="margin-top: 3%">
                                <select class="select" name="NewType">
                                    <option value="">(Admin, Empleado de piso, Repartidor)</option>
                                    <option value="administrador">Admin</option>
                                    <option value="empleado de piso">Empleado de piso</option>
                                    <option value="repartidor">Repartidor</option>
                                </select>
                            </div>
                            <div class="col-md-12" style="margin-top: 3%">
                                <input type="text" placeholder="0147471741" class="iniduser" name="NewNum">
                            </div>
                        </div>
                    </div>
                </main>
                <div class="col-md-6" style="margin-left: 22%; margin-top: 3%">
                    <input  type="text" style="display: none" name="IDMaster" value="<%out.println(ID);%>">
                    <button style="border-radius: 15px; font-size: 30px; width: 100%; background-color: #0CA789; color: #ffffff; margin-top: 10px">Confirmar</button>
                </div>
            </div>
        </div>
    </main>
</form>
<main class="fondo">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-6" style="border-top: 2px solid black;">
            <p style="font-size: 30px; margin-left: 35%; margin-top: 2%;">Usuarios actuales</p>
            <main>
                <div class="row">
                    <div class="col-md-1">
                        <p style="font-size: 40px; text-align: center"></p>
                    </div>
                    <table class="table">
                        <thead class="table-black">
                            <tr>
                                <th>ID</th>
                                <th>NOMBRE</th>
                                <th>TIPO</th>
                                <th>MODIFICAR</th>
                                <th>ELIMINAR</th>
                            </tr>
                        </thead>
                        <tbody class="table-secondary">
                                <%
                            while (rs.next()){%>
                            <tr>
                                <td>
                                    <%
                                    ShowID = rs.getInt("idper");
                                    out.println(ShowID);
                                    %>
                                </td>
                                <td>
                                    <%
                                    Name = rs.getString("nom_per");
                                    out.println(Name);
                                    %>
                                </td>
                                <td>
                                    <%
                                    EmployedType = rs.getString("tipo_per");
                                    out.println(EmployedType);
                                    %>
                                </td>
                                <td class="tablebutton">
                                    <form action="EditUser.jsp">
                                        <input  type="text" style="display: none" name="IDMaster" value="<%out.println(ID);%>">
                                        <input  type="text" style="display: none" name="EditarID" value="<%out.println(ShowID);%>">
                                        <button class="btn btn-outline-secondary">MODIFICAR</button>
                                    </form>
                                </td>
                                <td class="tablebutton">
                                    <form action="bajasUser.jsp">
                                        <input  type="text" style="display: none" name="IDMaster" value="<%out.println(ID);%>">
                                        <input  type="text" style="display: none" name="EditarID" value="<%out.println(ShowID);%>">
                                        <button class="btn btn-outline-danger">ELIMINAR</button>
                                     </form>
                                </td>
                            </tr>
                           <% }
                        %>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>
</main>
</body>
</html>