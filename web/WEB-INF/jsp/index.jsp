<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <style>
            <%@include file="../Resources/css/index.css" %>
        </style>
    </head>

    <body>
        <div class="col-md-12 title">
        <h4>DESPACHO DE VEHÍCULOS CON GPS QUE ATIENDEN EMERGENCIAS</h4>
        </div>
        
        <a href="testSecondPage.htm">Go to another page</a>

        <div class="menu">
            <a href="registroIndicente.htm">
                <div class="menuItem">
                    <div class="col-sm-1 iconDiv">
                        <i class="fas fa-plus-square fa-4x incidentIcon"></i>
                    </div>
                    <div class="col-sm-11 menuItemText">
                        <p>
                            Registrar Incidente
                        </p>
                    </div>
                </div>
            </a>

            <a href="#">
                <div class="menuItem">
                    <div class="col-sm-1 iconDiv">
                            <i class="fas fa-history fa-4x historyIcon"></i>
                    </div>
                    <div class="col-sm-11 menuItemText">
                        <p>
                            Historial de Incidentes
                        </p>
                    </div>
                </div>
            </a>

            <a href="#">
                <div class="menuItem">
                    <div class="col-sm-1 iconDiv">
                        <i class="fas fa-cog fa-4x  settingIcon"></i>
                    </div>
                    <div class="col-sm-11 menuItemText">
                            <p>
                                Configurar asociación entre vehículo de emergencia y dispositivo móvil
                            </p>
                    </div>
                </div>
            </a>

            <a href="#">
                <div class="menuItem">
                    <div class="col-sm-1 iconDiv">
                        <i class="fas fa-plus-circle fa-4x registerVIcon"></i>
                    </div>
                    <div class="col-sm-11 menuItemText">
                        <p>
                            Registrar vehículo de emergencia
                        </p>
                    </div>
                </div>
            </a>
        </div>
        
    </body>
</html>
