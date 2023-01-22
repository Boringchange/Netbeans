<!DOCTYPE html>
<%@page import="java.sql.*"%>

<%!
Statement stmt = null;
Connection con = null;
ResultSet rs = null;

int id, IDPro, PrecioBase, PrecioVenta, UnidadesDisp;
String namepro;


%>
<html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Inventario papeleria</title>
      <link href="../CSS/Papeleria.css" rel="stylesheet" type="text/css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
      <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
      <%
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      con = DriverManager.getConnection("jdbc:mysql://localhost/NEGOCIO3?user=root&password=n0m3l0");
      stmt = con.createStatement();
      
      id = Integer.parseInt(request.getParameter("id"));
      
      rs = stmt.executeQuery("SELECT * FROM Producto");
      %>
  </head>
  <body>
  <div class="sidebar">
    <div class="logo_content">
      <div class="logo">
        <i class='bx bx-store'></i>
        <div class="logo_name">Papeleria</div>
      </div>
      <i class='bx bx-menu-alt-left' id="btn"></i>
    </div>
    <ul class="nav_list">
      <li>
        <a href="Papeleria_venta.html">
          <i class='bx bx-store-alt' ></i>
          <span class="links-name">Venta</span>
        </a>
        <span class="tooltip">Venta</span>
      </li>
      <li>
        <a href="#">
          <i class='bx bx-clipboard' ></i>
          <span class="links-name">Inventario</span>
        </a>
        <span class="tooltip">Inventario</span>
      </li>
      <li>
        <a href="Papeleria_Reabast.html">
          <i class='bx bxs-component' ></i>
          <span class="links-name">Reabastecimiento</span>
        </a>
        <span class="tooltip">Reabastecimiento</span>
      </li>
      <li>
        <a href="Operis_direct.html">
          <i class='bx bxs-log-out' id="log-out"></i>
          <span class="links-name">Salir</span>
        </a>
        <span class="tooltip">Salir</span>
      </li>
    </ul>
    <div class="current_date">
      <div class="date">
        <script>
          date = new Date();
          year = date.getFullYear();
          month = date.getMonth() + 1;
          day = date.getDay();
          document.getElementById("current_date").innerHTML = "Fecha: " + day + "/" + month + "/" + year;
        </script>
      </div>
    </div>
  </div>
  <div class="container">
          <div class="row">
              <div class="col-md-6">
                  <h1><b>Papelería Inventario</b></h1>
              </div>
              <div class="col-md-6">
                  <img id="login" src="../IMG/login.png" alt="Imagen de login">
              </div>
          </div>
          <br>
          <div class="row">
              <h2 class="mx-auto">Inventario</h2>
          </div>
          <br>
          <div class="row">
              <table class="table mx-auto">
                  <thead class="table-dark">
                    <tr>
                        <th>Id</th>
                        <th>Nombre del producto</th>
                        <th>Unidades disponibles</th>
                        <th>Precio base</th>
                        <th>Precio venta</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%
                    while(rs.next()){
                        %>
                        <tr>
                        <th>
                            <%
                            IDPro = rs.getInt("idprodu");
                            out.println(IDPro);
                            %>
                        </th>
                        <th>
                            <%
                            namepro = rs.getString("nom_produ");
                            out.println(namepro);
                            %>
                        </th>
                        <th>
                            <%
                            UnidadesDisp = rs.getInt("unidades_disp");
                            out.println(UnidadesDisp);
                            %>
                        </th>
                        <th>
                            <%
                            PrecioBase = rs.getInt("padq_produ");
                            out.println(PrecioBase);
                            %>
                        </th>
                        <th>
                            <%
                            PrecioVenta = rs.getInt("pvent_produ");
                            out.println(PrecioVenta);
                            %>
                        </th>
                        </tr>
                        <%
                        }
                    %>
                  </tbody>
              </table>
          </div>
          <br><br><br><br><br>
          <div class="row">
              <div class="col-sm"></div>
              <div class="col-sm">
                  <form action="../HTML/Papeleria_Add.html">
                      <button class="btn btn-primary btn-lg mx-auto">Agregar</button>
                  </form>
              </div>
              <div class="col-sm">
                  <form action="Papeleria_Mod.html">
                      <button class="btn btn-primary btn-lg mx-auto">Modificar</button>
                  </form>
              </div>
              <div class="col-sm"></div>
          </div>
      </div>

    <script>
       let btn = document.querySelector("#btn");
       let sidebar = document.querySelector(".sidebar");

       btn.onclick = function (){
           sidebar.classList.toggle("active");
       }
    </script>
  </body>
</html>