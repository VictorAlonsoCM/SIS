/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function showAlert(){
    alert("btn pressed");
};

function showModalVehiculoForm(){
    var modalVehiculo = document.getElementById("vehiculoModal");
    modalVehiculo.style.display="block";
}

function hideModalVehiculoForm(){
    var modalVehiculo = document.getElementById("vehiculoModal");
    modalVehiculo.style.display="none";
}

function hideModalVSuccess(){
    var modal = document.getElementById("successVModal");
    modal.style.display="none";
}