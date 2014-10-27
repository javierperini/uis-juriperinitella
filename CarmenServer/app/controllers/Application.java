package controllers;

import java.util.Collection;
import java.util.List;

import lugares.Lugar;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import detective.Pais;
import detective.SetUpCarmen;
import detective.Sistema;
import personajes.Villano;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;





public class Application extends Controller {
      static Sistema sistema= new SetUpCarmen().getSistema();
    
      public static Result paisesSistema()  {
    	response().setContentType("application/json");
    	Collection<Pais> paisesSistema = sistema.getPaisesSistema();
    	return ok(Json.toJson(paisesSistema));
    }
    
    public static Result villanosSistema() {
    	response().setContentType("application/json");
    	Collection<Villano> villanosSistema = sistema.getVillanosSistema();
    	return ok(Json.toJson(villanosSistema));
     }
    
    public static Result paisActual() {
    	response().setContentType("application/json");
    	return ok(Json.toJson(sistema.getPaisActual()));
     }
    
    public static Result paisesVisitados(){
    	response().setContentType("application/json");
    	return ok(Json.toJson(sistema.getPaisesVisitados()));
   }
    
   public static Result paisesFallidos(){
    	response().setContentType("application/json");
    	return ok(Json.toJson(sistema.getPaisesFallidos()));
   }
  
   public static Result prueba(){
	  
	   JsonNode algo= request().body().asJson();
	   //Rompe porque no puede pasar Json a Pais
//	   Pais actualizado = Json.fromJson(algo, Pais.class);
	   if(algo== null){
		 return ok ("Algo  malo paso");	   
			  
	   }
	   return ok("Esta todo bien");
   }

   public static Result viajar(){
	   JsonNode paisViajar = request().body().asJson();
	   sistema.viajarA(Json.fromJson(paisViajar, Viajar.class).getPais());
	   return ok(paisViajar);
    }

   protected static ObjectNode crearJsonOk() {
   	ObjectNode result = Json.newObject();
		result.put("status", "OK");
		return result;
	}
   
   public static Result volverAPaisAnterior(){
	   sistema.volverAPaisAnterior();
	   return ok("Volviste a tu anterior pais");
   }
   
   public static Result pedirPista(){
	   JsonNode pedirPista = request().body().asJson();
	   List<String> resultado= sistema.obtenerPistaDe(Json.fromJson(pedirPista, PedirPista.class).getNombreLugar());
	   return ok(Json.toJson(resultado));
   }
 
   
   //////////////////////////////////////777777777
   
   public static Result emitirArresto(){
	   	response().setContentType("application/json");
	   	Sistema sistema= new SetUpCarmen().getSistema();
	   	return ok(Json.toJson(sistema));
	}




}
