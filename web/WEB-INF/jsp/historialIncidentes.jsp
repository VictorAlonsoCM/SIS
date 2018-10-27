<%-- 
    Document   : historialIncidentes
    Created on : 25/10/2018, 09:24:08 PM
    Author     : eherd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial Incidentes</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <style>
            <%@include file="../Resources/css/historialIncidentes.css" %>
        </style>
        
        
    </head>
    <body>
        <div class="fila-1">
            <h2>HISTORIAL DE INCIDENTES</h2>
        </div>
        
        <div class="FiltroBusqueda">
            <h3>FILTROS DE BÚSQUEDA</h3>
            <form:form >
                
                
                <div class="fila-1">

                    <div class="row col-md-6">
                        <div class="col-md-1">
                            <label name="Fecha">Fecha</label>
                        </div>
                        <div class="col-md-5">
                            <input type="date" name="placa" class="form-control" />
                        </div>
                        <div class="col-md-1">
                            <i class="fas fa-2x fa-calendar-alt"></i>
                        </div>
                    </div>
                    
                    <div class="row col-md-6">
                        <div class="col-md-2">
                            <label name="tipo">Tipo de vehículo</label>
                        </div>
                        <div class="col-md-5">
                            <select class="form-control">
                                <option value="volvo">Volvo</option>
                                <option value="saab">Saab</option>
                                <option value="mercedes">Mercedes</option>
                                <option value="audi">Audi</option>
                            </select>
                        </div>
                    </div>
                    
                </div>
                
                <div class="fila-1">
                    
                    <div class="row col-md-6">
                        <div class="col-md-1">
                            <label name="IMEI">IMEI</label>
                        </div>
                        <div class="col-md-5">
                            <input type="text" name="IMEI" class="form-control" />
                        </div>
                    </div>
                    
                    <div class="row col-md-6">
                        <div class="col-md-1">
                            <label name="NIV">NIV</label>
                        </div>
                        <div class="col-md-5">
                            <input type="text" name="NIV" class="form-control" />
                        </div>
                    </div>
                    
                </div>
                
                <div class="btn-form fila-1">
                    <div class="btn-form">
                        <input type="submit"class="btn btn-primary" value="Aceptar" />
                    </div>
                </div>
                
            </form:form>
            
        </div>
        
        <div class="tablaHistorial">
            <div class="w3-container">
                <h2>Historial de incidentes</h2>
                <table class="w3-table-all">
                    <thead>
                        <tr class="w3-red">
                            <th>
                                Tipo de Vehículo
                            </th>
                            <th>
                                Operador
                            </th>
                            <th>
                                Fecha Y Hora
                            </th>
                            <th>
                                Descripción de Emergencia
                            </th>
                            <th>
                                NIV
                            </th>
                            <th>
                                IMEI
                            </th>
                        </tr>
                            
                    </thead>
                    <c:forEach items="${incidentes}" var="incidente">
                        <tr>
                            <td>
                                incidente.vehiculo.tipo
                            </td>
                            <td>
                                incidente.operador.nombre
                            </td>
                            <td>
                                incidente.datetime
                            </td>
                            <td>
                                incidente.description
                            </td>
                            <td>
                                incidente.vehiculo.
                            </td>
                            <td>
                                
                            </td>
                            
                        </tr>
                    </c:forEach>
                        <tr>
                            <td>Jill</td>
                            <td>Smith</td>
                            <td>50</td>
                            <td>Jill</td>
                            <td>Smith</td>
                            <td>50</td>
                          </tr>
                          <tr>
                            <td>Eve</td>
                            <td>Jackson</td>
                            <td>94</td>
                            <td>Eve</td>
                            <td>Jackson</td>
                            <td>94</td>
                          </tr>
                          <tr>
                            <td>Adam</td>
                            <td>Johnson</td>
                            <td>67</td>
                            <td>Adam</td>
                            <td>Johnson</td>
                            <td>67</td>
                          </tr>
                          <tr>
                            <td>Jill</td>
                            <td>Smith</td>
                            <td>50</td>
                            <td>Jill</td>
                            <td>Smith</td>
                            <td>50</td>
                          </tr>
                          <tr>
                            <td>Eve</td>
                            <td>Jackson</td>
                            <td>94</td>
                            <td>Eve</td>
                            <td>Jackson</td>
                            <td>94</td>
                          </tr>
                          <tr>
                            <td>Adam</td>
                            <td>Johnson</td>
                            <td>67</td>
                            <td>Adam</td>
                            <td>Johnson</td>
                            <td>67</td>
                          </tr>
                          <tr>
                            <td>Jill</td>
                            <td>Smith</td>
                            <td>50</td>
                            <td>Jill</td>
                            <td>Smith</td>
                            <td>50</td>
                          </tr>
                          <tr>
                            <td>Eve</td>
                            <td>Jackson</td>
                            <td>94</td>
                            <td>Eve</td>
                            <td>Jackson</td>
                            <td>94</td>
                          </tr>
                          <tr>
                            <td>Adam</td>
                            <td>Johnson</td>
                            <td>67</td>
                            <td>Adam</td>
                            <td>Johnson</td>
                            <td>67</td>
                          </tr>
                    
                </table>
                
            </div>
            
            <div class="btn-form fila-1">
                    <div class="btn-form">
                        <input type="submit"class="btn btn-primary" value="Aceptar" />
                    </div>
                </div>

        </div>
    </body>
</html>
