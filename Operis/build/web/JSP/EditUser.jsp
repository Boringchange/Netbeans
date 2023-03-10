<%@ page import="java.sql.*" %>

<%!
    Statement stmt = null;
    ResultSet rs = null;
    Connection con = null;
    
    int id, idadmin;
    String name,type,num;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modificar Usuario</title>
      <link href="../CSS/EditUser.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <%
        id = Integer.parseInt(request.getParameter("EditarID"));
        
        idadmin = Integer.parseInt(request.getParameter("IDMaster"));
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();

        con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");

        stmt = con.createStatement();
                
        rs = stmt.executeQuery("SELECT * FROM personal where idper ="+     id    +"");
    %>
</head>
<body>
    <%
        if(rs.next()){
            name = rs.getString("nom_per");

            type = rs.getString("tipo_per");

            num = rs.getString("tel_per");
        }
    %>
  <main class="Top">
    <div class="row">
      <div class="col-md-6">
        <h1 class="h1Header">Modificar usuario</h1>
      </div>
      <div class="col-md-4">
        <h1 class="h2Header">ID a modificar</h1>
      </div>
      <div class="col-md-2">
        <img width="150px" src="../IMG/login.png" class="ImgUser">
      </div>
    </div>
  </main>
  <form action="../JSP/CambioUser.jsp">
  <main class="Middle">
    <div class="row">
      <div class="col-md-2"></div>
      <div class="col-md-4">
        <input placeholder="ID de usuario" class="ouiduser1" disabled>
        <input placeholder="Nombre" class="ouiduser" disabled>
        <input placeholder="Tipo" class="ouiduser" disabled>
        <input placeholder="Numero de telefono" class="ouiduser" disabled>
      </div>
      <form>
      <div class="col-md-4">
        <input placeholder="<%out.println(id);%>" type="number" class="iniduser1" name="ID">
        <input type="text" placeholder="<%out.println(name);%>" class="iniduser" name="name">
        <div>
            <select class="select" name="type">
            <%
            if(type.equals("administrador")){
                    %>
                    <option value="administrador" selected>Admin</option>
                    <option value="empleado de piso">Empleado de piso</option>
                    <option value="repartidor">Repartidor</option>
            <%
                }
                else{
                    if(type.equals("repartidor")){
                            %>
                            <option value="administrador" >Admin</option>
                            <option value="empleado de piso">Empleado de piso</option>
                            <option value="repartidor" selected>Repartidor</option>
                         <%
                        }
                        else{
                            %>
                                <option value="administrador" >Admin</option>
                                <option value="empleado de piso" selected>Empleado de piso</option>
                                <option value="repartidor">Repartidor</option>
                             <%
                        }
                }
            %>
          </select>
        </div>
        <input type="text" placeholder="<%out.println(num);%>" class="iniduser" name="num">
      </div>
    </div>
  </main>
    <div class="divbt">
        <input  type="text" style="display: none" name="idadmin" value="<%out.println(idadmin);%>">
        <button class="bt_change" type="submit" style="border: 0px;">Confirmar cambios</button>
    </div>
  </form>
    <form action="../JSP/GestionUsuario.jsp">
                    <div class="div_buttonback">
                        <input  type="text" style="display: none; " name="idadmin" value="<%out.println(idadmin);%>">
                        <button class="bt_back" style="border: 0px;"><img width="200px" src="../IMG/bt_back.png"></button>
                    </div>
                </form>
</body>
</html>
