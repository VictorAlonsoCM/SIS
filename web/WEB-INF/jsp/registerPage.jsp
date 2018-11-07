<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                        <li role="tabs"><a href="/home.htm" aria-controls="profile" role="tab" data-toggle="tab">Home</a></li>
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
                                    <form action="/action_page.php">
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                              <label for="nombre">Nombre:</label>
                                              <input type="text" class="form-control" id="nombre" placeholder="Nombre" name="nombre">
                                            </div>
                                            <div class="form-group col-sm-8">
                                              <label for="telefono">Teléfono:</label>
                                              <input type="number" class="form-control" id="telefono" placeholder="Teléfono" name="telefono">
                                            </div>
                                            <div class="form-group col-sm-4">
                                              <label for="edad">Edad:</label>
                                              <input type="number" class="form-control" id="edad" placeholder="Edad" name="edad">
                                            </div>
                                            <div class="form-group col-sm-12">
                                                <label for="descripcion">Descripción:</label>
                                                <textarea class="form-control" rows="5" id="descipcion" name="descripcion"></textarea>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-default"><i class="iconDiv fas fa-2x fa-check-circle historyIcon"></i> Finalizar atención</button>                                        
                                        <button type="submit" class="btn btn-default"><i class="iconDiv fas fa-2x fa-ambulance incidentIcon"></i> Solicitar vehículo</button>
                                      </form>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        <div role="tabpanel" class="tab-pane" id="vehiculosDeEmergencia">
                            <div class="map col-md-5">
                                
                            </div>
                            
                            
                           
                            <div class="chatDescription col-md-5">
                                <div class="descIncd">
                                    <h3>Descripción del Incidente</h3>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                        Praesent magna lectus, mollis et feugiat a, lobortis at sem. 
                                        Integer risus est, dapibus non sollicitudin quis, interdum vitae quam. 
                                        Donec non sem eu odio euismod venenatis
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
                                            <button onclick="" clas="tablinks">${vehiculo.tipo} ${nAmbulancia} </button>
                                        </c:when>
                                            
                                        <c:when test="${vehiculo.tipo=='Policia' }">
                                            <c:set var="nPolicia" scope="session" value="${nPolicia+1}"/>
                                            <button onclick="" clas="tablinks">${vehiculo.tipo} ${nPolicia} </button>
                                        </c:when>
                                            
                                        <c:when test="${vehiculo.tipo == 'Bomberos' }">
                                            <c:set var="nBombero" scope="session" value="${nBombero+1}"/>
                                            <button onclick="" clas="tablinks">${vehiculo.tipo} ${nBombero} </button>
                                        </c:when>
                                            
                                        
                                        
                                        
                                        <c:otherwise>
                                            something went wrong

                                        </c:otherwise>
                                        
                                    </c:choose>
                                    
                                    
                                    
                                    
                                    <c:set var="j" scope="session" value="${j+1}"/>
                                </c:forEach>    
                            </div>
                            
                            
                            
                        </div>
                        
                    </div>
                </nav>
            </div>
        </div>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQ7XPD_fZf8YCv-1gEE_Yid3xzFaEy7DU&libraries=places&callback=initAutocomplete"async defer>
                    
        </script>
        
    </body>
</html>
