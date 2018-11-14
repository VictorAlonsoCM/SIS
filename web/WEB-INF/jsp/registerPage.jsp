<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <style>
            <%@include file="../Resources/css/index.css" %>
            <%@include file="../Resources/css/vehiculosEmergencia.css" %>
        </style>
        <style>
            <%@include file="../Resources/css/googleMaps.css" %>
        </style>
        <script>
             <%@include file="../Resources/js/googleMaps.js" %>
        </script>
    </head>

    <body>
        <div class="menu">
            <div class="card">
                <nav class="navbar" role="navigation">
                    <ul class="nav nav-tabs" role="tablist">
                        
                        <li role="tabs" class="active"><a href="#registroDeIncidente" aria-controls="home" role="tab" data-toggle="tab">Registro de incidente</a></li>
                        <li role="tabs"><a href="#vehiculosDeEmergencia" aria-controls="profile" role="tab" data-toggle="tab">Vehículos de emergencia</a></li>
                        <li role="tabs"><a href="home.htm" aria-controls="profile" role="tab" data-toggle="tab">Home</a></li>
                    </ul>

                    <!-- Tabs Content -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="registroDeIncidente">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="pac-input" class="controls" type="text" placeholder="Search Box">
                                  <div id="map"></div>
                                </div>
                                <div class="col-md-6">
                                    <p>Ingresa datos de la persona a reportar el incidente:</p>
                                    <form:form action="registrarIncidente.htm"  commandName="incidenteForm" method="POST">
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                              <form:label path="nombre_persona">Nombre:</form:label>
                                              <form:input path="nombre_persona" class="form-control"  />
                                            </div>
                                            <div class="form-group col-sm-8">
                                              <form:label path="telefono_persona">Teléfono:</form:label>
                                              <form:input  path="telefono_persona"  class="form-control"  />
                                            </div>
                                            <div class="form-group col-sm-4">
                                              <form:label path="edad_persona">Edad:</form:label>
                                              <form:input path="edad_persona"  class="form-control"  />
                                            </div>
                                            <div class="form-group col-sm-12">
                                              <form:label path="descripcion_incidente">Descripción:</form:label>
                                              <form:textarea path="descripcion_incidente"  class="form-control" rows="6" />
                                              <form:hidden path="longitud" id="long"/>  
                                              <form:hidden path="latitud" id="lat"/>  
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-default"><i class="iconDiv fas fa-2x fa-check-circle historyIcon"></i> Finalizar atención</button>
                                        <!-- Este botón funciona como submit, almacena la información del incidente -->                                          
                                        <button type="submit" class="btn btn-default"><i class="iconDiv fas fa-2x fa-ambulance incidentIcon"></i> Solicitar vehículo</button>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        <div role="tabpanel" class="tab-pane" id="vehiculosDeEmergencia">
                            <div class="map col-md-5">
                                <div id="mapRoutes"></div>
                            </div>
                            
                            <div class="chatDescription col-md-5">
                                <div class="descIncd">
                                    <h3>Descripción del Incidente</h3>
                                    <p>
                                        
                                    </p>
                                </div>
                                <div class="chat">
                                    <h1>THIS IS A CHAT</h1>
                                    
                                </div>
                            </div>
                            
                            <div class="tab">
                                
                                <c:set var="nAmbulancia" scope="session" value="0"/>
                                <c:set var="nBombero" scope="session" value="0"/>
                                <c:set var="nPolicia" scope="session" value="0"/>
                                
                                <c:forEach items="${vehiculosActivos}" var="vehiculo">
                                    
                                    <c:choose>
                                        <c:when test="${vehiculo.tipo=='Ambulancia' }" >
                                            <c:set var="nAmbulancia" scope="session" value="${nAmbulancia+1}"/>
                                            
                                            <a class="tablinks" href="registerPage.htm?niv=${vehiculo.niv}">${vehiculo.tipo} ${nAmbulancia}</a>
                                            
                                        </c:when>
                                            
                                        <c:when test="${vehiculo.tipo=='Policia' }">
                                            <c:set var="nPolicia" scope="session" value="${nPolicia+1}"/>
                                            <a class="tablinks" href="registerPage.htm?niv=${vehiculo.niv}">${vehiculo.tipo} ${nPolicia}</a>
                                        </c:when>
                                            
                                        <c:when test="${vehiculo.tipo == 'Bomberos' }">
                                            <c:set var="nBombero" scope="session" value="${nBombero+1}"/>
                                            <a class="tablinks" href="registerPage.htm?niv=${vehiculo.niv}">${vehiculo.tipo} ${nBombero} </a>
                                        </c:when>
                                        <c:otherwise>
                                            something went wrong
                                        </c:otherwise>
                                    </c:choose>
                                    
                                </c:forEach>    
                            </div>  
                        </div>
                        
                    </div>
                </nav>
                
                <!--Modal to show the user if the incident register action was succesful-->
                <c:if test="${success==0}">
                    <div id="incidentModal" class="successIInserted">
                        <div class="successIInserted-content">
                            <h3>Registrar Incidente</h3>
                            <hr>
                            <div class="form-group">
                                <h3> ¡El registro fue exitoso! </h3>
                            </div>
                            <div clas="form-btns-success">
                                <button type="buton" class="btn btn-primary" onclick="hideModalISuccess()" >Aceptar</button>
                            </div>
                        </div>
                    </div>
                </c:if>
                                
            </div>
        </div>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQ7XPD_fZf8YCv-1gEE_Yid3xzFaEy7DU&libraries=places&callback=initAutocomplete"async defer>
                    
        </script>
        
    </body>
</html>
