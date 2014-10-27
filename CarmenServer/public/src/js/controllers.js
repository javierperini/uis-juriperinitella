'use strict';
	
var carmenApp = angular.module('carmenApp', []);

carmenApp.controller('PaisesCtrl', function ($scope, $http) {
//    $scope.Banco = "glyphicon glyphicon-home";
//    $scope.Biblioteca = "glyphicon glyphicon-tower";
//    $scope.Club = "glyphicon glyphicon-flag";
//    $scope.Embajada = "glyphicon glyphicon-book";
    
    $scope.actualizarPaisActual = function() {
    	$http.get('/paisActual').success(function(data) {
            $scope.paisActual = data;
            console.log(data);
            })        
        }
    
    $scope.actualizarPaisesSistema= function() {
    	$http.get('/paises').success(function(data) {
            $scope.paisesSistema = data;
        })
       
    }
    
    $scope.actualizarPaisesVisitados =function() {
    	$http.get('/paisesVisitados').success(function(data) {
            $scope.paisesVisitados = data;
        })
    }
    
    $scope.actualizarPaisesFallidos = function() {
    	$http.get('/paisesFallidos').success(function(data) {
            $scope.paisesFallidos = data;
        })
    }
    
    $scope.actualizarPagina = function() {
    	$scope.actualizarPaisActual();
    	$scope.actualizarPaisesSistema();
    	$scope.actualizarPaisesVisitados();
    	$scope.actualizarPaisesFallidos();
    }

    $scope.actualizarPagina();
    
    $scope.viajar = function() {
    	$http.post('/viajar' , {pais: $scope.paisSeleccionado} )
    	.success(function(data) {
    		$scope.actualizarPagina();
    		
          })
    }
    $scope.volverPaisAnterior = function(){
    	$http.post('/volverPaisAnterior',$scope.paisActual)
    	.success(function(data){
    		$scope.actualizarPagina();
    	})
    }
//    $scope.seleccionarPais = function(){
//    	$http.get('/pais/'+ $scope.paisSeleccionado).success(function(data) {
////            $scope.paisResultante = data;
//            alert("El pais actual es "+ data);
//            $scope.prueba(data)
//    	})
//        
//      }
    
    $scope.pedirPista = function(nombreLugar){
    	$http.post('/pista' ,{nombreLugar:nombreLugar}).
    		success(function(data){
    			$scope.pistaLugar = data;
    		})
    	
    }
    

    
    $scope.elegirIcono = function(nombreBoton) { }   /*document.getElementById("pistaSpan").style.display = 'block';*/
    
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