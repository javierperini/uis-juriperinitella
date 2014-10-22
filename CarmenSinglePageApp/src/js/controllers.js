'use strict';
	
var carmenApp = angular.module('carmenApp', []);

carmenApp.controller('PaisesCtrl', function ($scope, $http) {
    $scope.Banco = "glyphicon glyphicon-home";
    $scope.Biblioteca = "glyphicon glyphicon-tower";
    $scope.Club = "glyphicon glyphicon-flag";
    $scope.Embajada = "glyphicon glyphicon-book";
    
    $scope.paisActual = function() {
    	$http.get('/paisActual').success(function(data) {
            $scope.paisActual = data;
        })
    }
    $scope.paisesSistema = function() {
    	$http.get('/paises').success(function(data) {
            $scope.paisesSistema = data;
        })
    }
    
    $scope.paisesVisitados =function() {
    	$http.get('/paisVisitados').success(function(data) {
            $scope.paisesVisitados = data;
        })
    }
    
    $scope.paisesFallidos =function() {
    	$http.get('/paisesFallidos').success(function(data) {
            $scope.paisesFallidos = data;
        })
    }
    $scope.paisActual();
    $scope.paisesSis ();
    $scope.paisesVisitado();
    $scope.paisesFallido();
    
    $scope.viajar = function() {
    	$http.post('/viajar', $scope.nuevoPais)
    	.success(function(data) {
            if (data.msg != '') {
            	$scope.notificarMensaje('Viajaste a :' + data.nombre);
            }
            else {
            	$scope.notificarError(data.error);
            }
            $scope.paisActual();
            $scope.paisesFallido();
            $scope.paisesVisitado();
        })
        .error(function(data, status) { 
        	if (data.error) {
        		$scope.notificarError("Error: " + data.error);
        	}
        	else {
        		$scope.notificarError(status + ": " + data);
        	}
        })
    }
    
    $scope.elegirIcono = function(nombreBoton) { }
    
    $scope.revelarPista = function() {
        /*document.getElementById("pistaSpan").style.display = 'block';*/
    }
});

carmenApp.controller('VillanosCtrl', function ($scope, $http) {
    
 /*   $scope.emitirOrden = function (nombreVillano) {
        document.getElementById("villanoOrden").innerHTML = nombreVillano;
        $scope.villanoOrden = nombreVillano;
    }; */
    
    $scope.villanoOrden = '';
    
    $scope.emitida = false;  

    $scope.villanosSistema = function() {
    	$http.get('/villanos').success(function(data) {
            $scope.villanos = data;
        })
    }
    
    $scope.villanosSistema();
    
    $scope.emitirOrden = function(){
        $scope.emitida = true;
    }
    
    $scope.panelFichas = false;
    $scope.showPanelFichas = function(){
        $scope.panelFichas = !($scope.panelFichas);
    }
});