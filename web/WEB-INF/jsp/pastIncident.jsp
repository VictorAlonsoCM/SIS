<%-- 
    Document   : pastIncident
    Created on : 14/11/2018, 10:50:01 PM
    Author     : eherd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
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
        
    </head>

    <body>
        <div class="menu">
            <div class="card">
                <nav class="navbar" role="navigation">
                    <ul class="nav nav-tabs" role="tablist">
                        
                        <li role="tabs" class="active"><a href="#registroDeIncidente" aria-controls="home" role="tab" data-toggle="tab">Registro de incidente</a></li>
                        <!--<li role="tabs"><a href="#vehiculosDeEmergencia" aria-controls="profile" role="tab" data-toggle="tab">Vehículos de emergencia</a></li>
                        <li role="tabs"><a href="home.htm" aria-controls="profile" role="tab" data-toggle="tab">Home</a></li> -->
                    </ul>

                    <!-- Tabs Content -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="registroDeIncidente">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Sitio del incidente</h4>
                                    <input id="pac-input" class="controls" type="text" placeholder="Search Box">
                                  <div id="map"></div>
                                </div>
                                <div class="col-md-6">
                                    <p>Ingresa datos de la persona a reportar el incidente:</p>
                                    <form action="#"  method="POST">
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                              <label for="nombre_persona">Nombre:</label>
                                              <input disabled="true" id="nombre_persona" class="form-control" value="${Person.nombre}" />
                                            </div>
                                            <div class="form-group col-sm-8">
                                              <label for="telefono_persona">Teléfono:</label>
                                              <input disabled="true" name="telefono_persona" value="${Person.telefono}"  class="form-control"  />
                                            </div>
                                            <div class="form-group col-sm-4">
                                              <label for="edad_persona">Edad:</label>
                                              <input disabled="true" name="edad_persona" value="${Person.edad}"  class="form-control"  />
                                            </div>
                                            <div class="form-group col-sm-12" >
                                              <label for="descripcion_incidente">Descripción:</label>
                                              <textarea disabled="true" name="descripcion_incidente" class="form-control" rows="6" >${currentIncident.descripcion}</textarea>
                                              <input type="hidden" value="${currentIncident.longitud}" id="long"/>  
                                              <input type="hidden" value="${currentIncident.latitud}" id="lat"/>  
                                            </div>
                                        </div>
                                            <div class="btn-past-incident">
                                                <button type="button" class="btn btn-default btn-accept" onclick="goBack()"> Aceptar</button>
                                            </div>
                                    </form>
                                </div>
                            </div>
                        </div>                        
                    </div>
                </nav>          
            </div>
        </div>
        <script>
            <%@include file="../Resources/js/pastIncident.js" %>
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQ7XPD_fZf8YCv-1gEE_Yid3xzFaEy7DU&libraries=places&callback=initAutocomplete"async defer></script>
    </body>
</html>
