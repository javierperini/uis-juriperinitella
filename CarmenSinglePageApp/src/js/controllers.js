'use strict';

// TO DO: representar los lugares para bindearlo a los botones

var carmenApp = angular.module('carmenApp', []);

carmenApp.controller('PaisesCtrl', function ($scope) {
    $scope.paisActual =
        {
            'nombre': 'argentina',
            'caracteristicas': [ 'c1', 'c2', 'c3' ]
        };
    
    $scope.paisesSistema = [
        {
            'nombre': 'argentina',
            'caracteristicas': [ 'c1', 'c2', 'c3' ]
        },
        {
            'nombre': 'estados unidos',
            'caracteristicas': [ 'c1', 'c2', 'c3' ]
        },
        {
            'nombre': 'argelia',
            'caracteristicas': []
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