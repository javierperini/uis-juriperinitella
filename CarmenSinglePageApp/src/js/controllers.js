'use strict';

// TO DO: representar los lugares para bindearlo a los botones

var carmenApp = angular.module('carmenApp', []);

carmenApp.controller('PaisesCtrl', function ($scope) {
    $scope.idBotonBanco = "glyphicon glyphicon-home";
    $scope.idBotonBiblioteca = "glyphicon glyphicon-tower";
    $scope.idBotonClub = "glyphicon glyphicon-flag";
    $scope.idBotonEmbajada = "glyphicon glyphicon-book";
    
    $scope.paisActual =
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
    
    $scope.emitirOrden = function () {
        document.getElementById("villanoOrden").innerHTML = "{{villano.nombre}}";
        document.getElementById("villanoOrden").style.display = 'block';
    };
    
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
});