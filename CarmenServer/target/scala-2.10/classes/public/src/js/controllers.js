'use strict';
	
var carmenApp = angular.module('carmenApp', []);

carmenApp.controller('PaisesCtrl', function ($scope, $http) {
    $scope.Banco = "glyphicon glyphicon-home";
    $scope.Biblioteca = "glyphicon glyphicon-tower";
    $scope.Club = "glyphicon glyphicon-flag";
    $scope.Embajada = "glyphicon glyphicon-book";
    
    $scope.paisActualF = function() {
    	$http.get('/paisActual').success(function(data) {
            $scope.paisActual = data;
        })
    }
    $scope.paisesSisF= function() {
    	$http.get('/paises').success(function(data) {
            $scope.paisesSistema = data;
        })
    }
    
    $scope.paisesVisitadosF =function() {
    	$http.get('/paisVisitados').success(function(data) {
            $scope.paisesVisitados = data;
        })
    }
    
    $scope.paisesFallidosF =function() {
    	$http.get('/paisesFallidos').success(function(data) {
            $scope.paisesFallidos = data;
        })
    }
    $scope.paisActualF();
    $scope.paisesSisF ();
    $scope.paisesVisitadosF();
    $scope.paisesFallidosF();
    
    $scope.viajar = function() {
    	alert('Apretaron viajar' + $scope.paisSeleccionado)
    	$http.post('/viajar', $scope.paisSeleccionado)
    	.success(function(data) {
            if (data.msg != '') {
            	$scope.notificarMensaje('Viajaste a :' + data.nombre);
            }
            else {
            	$scope.notificarError(data.error);
            }
            $scope.paisActualF();
            $scope.paisesSisF ();
            $scope.paisesVisitadosF();
            $scope.paisesFallidosF();
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
	/////////
    $scope.msgs = [];
	$scope.notificarMensaje = function(mensaje) {
		$scope.msgs.push(mensaje);
		$timeout(function(){
			while($scope.msgs.length > 0) 
				$scope.msgs.pop();
	    }, 3000);
	};

	$scope.errors = [];
    $scope.notificarError = function(mensaje) {
    	$scope.errors.push(mensaje);
		$timeout(function(){
			while($scope.errors.length > 0) 
				$scope.errors.pop();
	    }, 3000);
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