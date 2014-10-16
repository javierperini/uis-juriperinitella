'use strict';

// TO DO: representar los lugares para bindearlo a los botones

var carmenApp = angular.module('carmenApp', []);

carmenApp.controller('PaisesCtrl', function ($scope) {
    $scope.Banco = "glyphicon glyphicon-home";
    $scope.Biblioteca = "glyphicon glyphicon-tower";
    $scope.Club = "glyphicon glyphicon-flag";
    $scope.Embajada = "glyphicon glyphicon-book";
    
    $scope.paisActual =
        {
            'nombre': 'argentina',
            'caracteristicas': [ 'c1', 'c2', 'c3' ],
            'lugares': [
                        {
                            'nombre': 'Banco',
                            'icono': 'glyphicon glyphicon-home'
                        },
                        {
                            'nombre': 'Biblioteca',
                            'icono': 'glyphicon glyphicon-tower'
                        },
                        {
                            'nombre': 'Embajada',
                            'icono': 'glyphicon glyphicon-book'
                        }
                     ]
        };
    
    $scope.paisesSistema = [
        {
            'nombre': 'argentina',
            'caracteristicas': [ 'c1', 'c2', 'c3' ],
            'lugares': [
                        {
                            'nombre': 'Banco'
                        },
                        {
                            'nombre': 'Biblioteca'
                        },
                        {
                            'nombre': 'Embajada'
                        }
                     ]
        },
        {
            'nombre': 'estados unidos',
            'caracteristicas': [ 'c1', 'c2', 'c3' ],
            'lugares': [
                        {
                            'nombre': 'Banco'
                        },
                        {
                            'nombre': 'Biblioteca'
                        },
                        {
                            'nombre': 'Embajada'
                        }
                     ]
        },
        {
            'nombre': 'argelia',
            'caracteristicas': [],
            'lugares': [
                        {
                            'nombre': 'Banco'
                        },
                        {
                            'nombre': 'Biblioteca'
                        },
                        {
                            'nombre': 'Embajada'
                        }
                     ]
        }
    ];
    
    $scope.paisesVisitados = [
        {
            'nombre': 'argentina',
            'caracteristicas': [ 'c1', 'c2', 'c3' ]
        },
        {
            'nombre': 'estados unidos',
            'caracteristicas': [ 'c1', 'c2', 'c3' ]
        }
    ];
    
    $scope.paisesFallidos = [
        {
            'nombre': 'argelia',
            'caracteristicas': []
        }
    ];
    
    $scope.elegirIcono = function(nombreBoton) { }
    
    $scope.revelarPista = function() {
        document.getElementById("pistaSpan").style.display = 'block';
    }
});

carmenApp.controller('VillanosCtrl', function ($scope) {
    
 /*   $scope.emitirOrden = function (nombreVillano) {
        document.getElementById("villanoOrden").innerHTML = nombreVillano;
        $scope.villanoOrden = nombreVillano;
        document.getElementById("villanoOrden").style.display = 'block';
    }; */
    
    $scope.villanoOrden = '';
    
    $scope.emitida = false;
    
    $scope.villanos = [
        {
            'nombre': 'Carmen Sandiego'
        },
        {
            'nombre': 'Gaston Aguirre'
        },
        {
            'nombre': 'El cuco'
        }
    ];
    
    $scope.emitirOrden = function(){
        $scope.emitida = true;
    }
    
    $scope.panelFichas = false;
    $scope.showPanelFichas = function(){
        $scope.panelFichas = !($scope.panelFichas);
    }
});