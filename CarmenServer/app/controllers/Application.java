package controllers;

import java.util.Collection;


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

    public static Result paisesSistema()  {
    	response().setContentType("application/json");
    	Sistema sistema= new SetUpCarmen().getSistema();
    	Collection<Pais> paisesSistema = sistema.getPaisesSistema();
    	return ok(Json.toJson(paisesSistema));
    }
    
    public static Result villanosSistema() {
    	response().setContentType("application/json");
    	Sistema sistema= new SetUpCarmen().getSistema();
    	Collection<Villano> villanosSistema = sistema.getVillanosSistema();
    	return ok(Json.toJson(villanosSistema));
     }
    
    public static Result paisActual() {
    	response().setContentType("application/json");
    	Sistema sistema= new SetUpCarmen().getSistema();
    	return ok(Json.toJson(sistema.getPaisActual()));
     }
    
    public static Result paisesVisitados(){
    	response().setContentType("application/json");
    	Sistema sistema= new SetUpCarmen().getSistema();
    	return ok(Json.toJson(sistema.getPaisesVisitados()));
   }
    
   public static Result paisesFallidos(){
    	response().setContentType("application/json");
    	Sistema sistema= new SetUpCarmen().getSistema();
    	return ok(Json.toJson(sistema.getPaisesFallidos()));
   }
   
   public static Result viajar(){
	   	JsonNode node = request().body().asJson();
	   	Pais nuevo = Json.fromJson(node, Pais.class);
	   	Sistema sistema= new SetUpCarmen().getSistema();
	   	sistema.setPaisSeleccionado(nuevo);
	   	sistema.viajar();
	   	ObjectNode result = Json.newObject();
	   	result.put("Viajaste a ", nuevo.getNombre());
	   	return ok(result);
  }

   public static Result volverAPaisAnterior(){
	   	JsonNode node = request().body().asJson();
	   	Pais nuevo = Json.fromJson(node, Pais.class);
	   	Sistema sistema= new SetUpCarmen().getSistema();
	   	sistema.volverAPaisAnterior();
	   	ObjectNode result = Json.newObject();
	   	result.put("Viajaste a ", nuevo.getNombre());
	   	return ok(result);
   }
   
   //////////////////////////////////////777777777
   public static Result mostrarPistaPrimerLugar(){
	   response().setContentType("application/json");
	   Sistema sistema= new SetUpCarmen().getSistema();
	   return ok(Json.toJson(sistema));
   }
  
   public static Result mostrarPistaSegundoLugar(){
	   response().setContentType("application/json");
	   Sistema sistema= new SetUpCarmen().getSistema();
	   return ok(Json.toJson(sistema));
   }
   
   public static Result mostrarPistaTercerLugar(){
	   response().setContentType("application/json");
	   Sistema sistema= new SetUpCarmen().getSistema();
	   return ok(Json.toJson(sistema));
   }
   
   public static Result emitirArresto(){
	   	response().setContentType("application/json");
	   	Sistema sistema= new SetUpCarmen().getSistema();
	   	return ok(Json.toJson(sistema));
	}




}
