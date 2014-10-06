'use strict';

var carmenApp = angular.module('carmenApp', []);

carmenApp.controller('PaisesCtrl', function ($scope) {
    $scope.paisActual = 'abc';
    
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
});

carmenApp.controller('VillanosCtrl', function ($scope) {
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