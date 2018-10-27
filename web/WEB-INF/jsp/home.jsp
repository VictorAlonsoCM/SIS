<%-- 
    Document   : home
    Created on : 22/10/2018, 11:14:20 PM
    Author     : eherd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <script>
            <%@include file="../Resources/js/home.js" %>
        </script>
        
        <style>
            <%@include file="../Resources/css/index.css" %>
        </style>
        
    </head>

    <body>
        <div class="col-md-12 title">
        <h4>DESPACHO DE VEHÍCULOS CON GPS QUE ATIENDEN EMERGENCIAS</h4>
        </div>
        
        <a href="registerPage.htm">Go to another page!</a>

        <div class="menu">
            <a href="registerPage.htm">
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

            <a href="historialIncidentes.htm">
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

            <a href="#" onclick="showModalVehiculoForm()">
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
        
        <div id="vehiculoModal" class="modal-form-vehiculo">
            <div class="modal-content">
                <form:form action="registrarVehiculo.htm" id="vehiculo-form" method="POST">
                    <div class="form-content">
                        
                        <div class="">
                            <h3>Registrar vehículo de emergencia</h3>
                        </div>
                        <hr size="2" class="title-line"/>
                        
                        <p>Datos del vehículo de emergencia nuevo</p>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-1">
                                    <form:label path="tipo">Tipo</form:label>
                                </div>
                                
                                <div class="col-md-11">
                                    <form:select path="tipo" class="form-control" items="${types}"/>
                                </div>    
                            </div>

                        </div>

                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-1">
                                    <form:label path="placa">Placa</form:label>
                                </div>

                                <div class="col-md-11">
                                    <form:input path="placa" class="form-control" />
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-1">
                                    <form:label path="niv">NIV*</form:label>
                                </div>

                                <div class="col-md-11">
                                    <form:input path="niv" class="form-control" required="true" />
                                </div>
                            </div>
                        </div>

                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-1">
                                    <form:label path="seriegps">Serie GPS*</form:label>
                                </div>

                                <div class="col-md-11">
                                    <form:input path="seriegps" class="form-control" required="true" />
                                </div>

                            </div>
                        </div>


                    </div>

                    <div class="form-btns">
                        <button type="button" onclick="hideModalVehiculoForm()" class="btn btn-danger">Cancelar</button>
                        <button type="submit" id="RegisterVehiculo" onclick="changeToLoading()" class="btn btn-primary">Aceptar</button>
                    </div>

                </form:form>
            </div>
        </div>
        
        <c:if test="${success}">
            <div id="successVModal" class="successVInserted">
                <div class="successVInserted-content">
                    <h3>Registrar vehículo de emergencia</h3>
                    <hr>
                    <div class="form-group">
                        <h3> ¡Vehículo de emergencia registrado satisfactoriamente! </h3>
                    </div>
                    <div clas="form-btns-success">
                        <button type="buton" class="btn btn-primary" onclick="hideModalVSuccess()" >Aceptar</button>
                    </div>
                </div>
            </div>
        </c:if>
        
        
    </body>
</html>

