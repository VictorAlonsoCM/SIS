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
        <h3>DESPACHO DE VEHÍCULOS CON GPS QUE ATIENDEN EMERGENCIAS</h3>
        </div>

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

            <a href="#" onclick="showAsociacion()">
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
                                    <form:checkbox path="status" class="form-control" style="display:none;" />
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
        
        <c:if test="${success==0}">
            <div id="successVModal" class="successVInserted">
                <div class="successVInserted-content">
                    <h3>Registrar vehículo de emergencia</h3>
                    <hr>
                    <div class="form-group">
                        <h3> ¡Vehículode emergencia registrado satisfactoriamente! </h3>
                    </div>
                    <div clas="form-btns-success">
                        <button type="buton" class="btn btn-primary" onclick="hideModalVSuccess()" >Aceptar</button>
                    </div>
                </div>
            </div>
        </c:if>
        
        <c:if test="${success==1}">
            <div id="successVModal" class="successVInserted">
                <div class="successVInserted-content">
                    <h3>Registrar vehículo de emergencia</h3>
                    <hr>
                    <div class="form-group">
                        <h3> Hubo un error al insertar el vehículo </h3>
                    </div>
                    <div clas="form-btns-success">
                        <button type="buton" class="btn btn-primary" onclick="hideModalVSuccess()" >Aceptar</button>
                    </div>
                </div>
            </div>
        </c:if>
        
        <!--div id="AsociacionModal"  -->
        
        <div id="AsociacionModal" class="asociacionModalClass">
                <div class="asociacionModal-content">
                    <form:form action="relacionarVehCel.htm" commandName="relacion" id="vehiculo-form" method="POST">
                    <div class="form-content">
                        
                        <div class="">
                            <h3>Configurar Asociación</h3>
                        </div>
                        <hr size="2" class="title-line"/>
                        
                        <h4>NIV del vehículo de emergencia</h4>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-1">
                                    <form:label path="vehiculo_niv">NIV</form:label>
                                </div>
                                
                                <div class="col-md-11">
                                <form:select path="vehiculo_niv" class="form-control" items="${avImeis}"/>
                                </div>    
                            </div>

                        </div>
                                
                        <h4>Datos del nuevo dispositivo móvil</h4>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-1">
                                    <form:label path="dispositivoMovil_imei">IMEI</form:label>
                                </div>

                                <div class="col-md-11">
                                    <form:input path="dispositivoMovil_imei" class="form-control"  />
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-1">
                                    <form:label path="numeroTelefonico">Numero Telefónico</form:label>
                                </div>

                                <div class="col-md-11">
                                    <form:input path="numeroTelefonico" class="form-control"  />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-btns">
                        <button type="button" onclick="hideAsociacion()" class="btn btn-danger">Cancelar</button>
                        <button type="submit" id="RegisterVehiculo" onclick="changeToLoading()" class="btn btn-primary">Aceptar</button>
                    </div>

                </form:form>
            </div>
        </div>
        
        <c:if test="${success==2}">
            <div id="successVModal" class="successVInserted">
                <div class="successVInserted-content">
                    <h3>Asociación entre vehículo y dispositivo móvil</h3>
                    <hr>
                    <div class="form-group">
                        <h3> ¡Datos actualizados satisfactoriamente! </h3>
                    </div>
                    <div clas="form-btns-success">
                        <button type="buton" class="btn btn-primary" onclick="hideModalVSuccess()" >Aceptar</button>
                    </div>
                </div>
            </div>
        </c:if>
        
        <c:if test="${success==3}">
            <div id="successVModal" class="successVInserted">
                <div class="successVInserted-content">
                    <h3>Asociación entre vehículo y dispositivo móvil</h3>
                    <hr>
                    <div class="form-group">
                        <h3> Hubo un error al realizar la asociación </h3>
                    </div>
                    <div clas="form-btns-success">
                        <button type="buton" class="btn btn-primary" onclick="hideModalVSuccess()" >Aceptar</button>
                    </div>
                </div>
            </div>
        </c:if>
        
            
        
        
    </body>
</html>

