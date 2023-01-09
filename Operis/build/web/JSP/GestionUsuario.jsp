<%!
    int ID;
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
    %>
<div class="divTxtBig">
    <h1 class="h1Header">Registrar/Modificar usuario</h1>
</div>
<form>
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
                            <input placeholder="de 6 digitos" type="number" class="iniduser">
                            <div class="col-md-12" style="margin-top: 3%">
                                <input type="text" placeholder="Juan" class="iniduser">
                            </div>
                            <div style="margin-top: 3%">
                                <select class="select">
                                    <option value="">(Admin, Empleado de piso, Repartidor)</option>
                                    <option value="Admin">Admin</option>
                                    <option value="Empleado de piso">Empleado de piso</option>
                                    <option value="Repartidor">Repartidor</option>
                                </select>
                            </div>
                            <div class="col-md-12" style="margin-top: 3%">
                                <input type="text" placeholder="0147471741" class="iniduser">
                            </div>
                        </div>
                    </div>
                </main>
                <div class="col-md-6" style="margin-left: 22%; margin-top: 3%">
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
        <div class="col-md-6">
            <h1 style="margin-left: 11%">_________________________________________</h1>
            <div>
                <p style="font-size: 30px; margin-left: 30%">Computadoras actuales</p>
            </div>
            <div style="overflow: scroll">
                <main>
                    <div class="row">
                        <div class="col-md-6">
                            <p style="font-size: 40px; text-align: center">Hola q hace</p>
                        </div>
                        <div class="col-md-3">
                            <form action="">
                                <button style="border: none"><img width="200px" src="../IMG/ModifyUser.png"></button>
                            </form>
                        </div>
                        <div class="col-md-3">
                            <form>
                                <button style="border: none"><img width="200px" src="../IMG/DeleteUser.png"></button>
                            </form>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
</main>
</body>
</html>