// @SOURCE:/home/javier/Escritorio/Facultad/Interface/CarmenServer/conf/routes
// @HASH:92fb0edb7df40d779aabe0b26d49a560c8af89ed
// @DATE:Mon Oct 27 20:41:02 ART 2014


import play.core._
import play.core.Router._
import play.core.j._

import play.api.mvc._
import play.libs.F

import Router.queryString

object Routes extends Router.Routes {

private var _prefix = "/"

def setPrefix(prefix: String) {
  _prefix = prefix
  List[(String,Routes)]().foreach {
    case (p, router) => router.setPrefix(prefix + (if(prefix.endsWith("/")) "" else "/") + p)
  }
}

def prefix = _prefix

lazy val defaultPrefix = { if(Routes.prefix.endsWith("/")) "" else "/" }


// @LINE:6
private[this] lazy val controllers_Application_paisesSistema0 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("paises"))))
        

// @LINE:7
private[this] lazy val controllers_Application_villanosSistema1 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("villanos"))))
        

// @LINE:8
private[this] lazy val controllers_Application_paisesVisitados2 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("paisesVisitados"))))
        

// @LINE:9
private[this] lazy val controllers_Application_paisesFallidos3 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("paisesFallidos"))))
        

// @LINE:10
private[this] lazy val controllers_Application_paisActual4 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("paisActual"))))
        

// @LINE:11
private[this] lazy val controllers_Application_viajar5 = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("viajar"))))
        

// @LINE:12
private[this] lazy val controllers_Application_pedirPista6 = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("pista"))))
        

// @LINE:13
private[this] lazy val controllers_Application_volverAPaisAnterior7 = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("volverPaisAnterior"))))
        

// @LINE:14
private[this] lazy val controllers_Application_prueba8 = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("prueba"))))
        

// @LINE:17
private[this] lazy val controllers_Assets_at9 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("assets/"),DynamicPart("file", """.+""",false))))
        
def documentation = List(("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """paises""","""controllers.Application.paisesSistema()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """villanos""","""controllers.Application.villanosSistema()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """paisesVisitados""","""controllers.Application.paisesVisitados()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """paisesFallidos""","""controllers.Application.paisesFallidos()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """paisActual""","""controllers.Application.paisActual()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """viajar""","""controllers.Application.viajar()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """pista""","""controllers.Application.pedirPista()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """volverPaisAnterior""","""controllers.Application.volverAPaisAnterior()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """prueba""","""controllers.Application.prueba()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """assets/$file<.+>""","""controllers.Assets.at(path:String = "/public", file:String)""")).foldLeft(List.empty[(String,String,String)]) { (s,e) => e.asInstanceOf[Any] match {
  case r @ (_,_,_) => s :+ r.asInstanceOf[(String,String,String)]
  case l => s ++ l.asInstanceOf[List[(String,String,String)]] 
}}
      

def routes:PartialFunction[RequestHeader,Handler] = {

// @LINE:6
case controllers_Application_paisesSistema0(params) => {
   call { 
        invokeHandler(controllers.Application.paisesSistema(), HandlerDef(this, "controllers.Application", "paisesSistema", Nil,"GET", """ Home page""", Routes.prefix + """paises"""))
   }
}
        

// @LINE:7
case controllers_Application_villanosSistema1(params) => {
   call { 
        invokeHandler(controllers.Application.villanosSistema(), HandlerDef(this, "controllers.Application", "villanosSistema", Nil,"GET", """""", Routes.prefix + """villanos"""))
   }
}
        

// @LINE:8
case controllers_Application_paisesVisitados2(params) => {
   call { 
        invokeHandler(controllers.Application.paisesVisitados(), HandlerDef(this, "controllers.Application", "paisesVisitados", Nil,"GET", """""", Routes.prefix + """paisesVisitados"""))
   }
}
        

// @LINE:9
case controllers_Application_paisesFallidos3(params) => {
   call { 
        invokeHandler(controllers.Application.paisesFallidos(), HandlerDef(this, "controllers.Application", "paisesFallidos", Nil,"GET", """""", Routes.prefix + """paisesFallidos"""))
   }
}
        

// @LINE:10
case controllers_Application_paisActual4(params) => {
   call { 
        invokeHandler(controllers.Application.paisActual(), HandlerDef(this, "controllers.Application", "paisActual", Nil,"GET", """""", Routes.prefix + """paisActual"""))
   }
}
        

// @LINE:11
case controllers_Application_viajar5(params) => {
   call { 
        invokeHandler(controllers.Application.viajar(), HandlerDef(this, "controllers.Application", "viajar", Nil,"POST", """""", Routes.prefix + """viajar"""))
   }
}
        

// @LINE:12
case controllers_Application_pedirPista6(params) => {
   call { 
        invokeHandler(controllers.Application.pedirPista(), HandlerDef(this, "controllers.Application", "pedirPista", Nil,"POST", """""", Routes.prefix + """pista"""))
   }
}
        

// @LINE:13
case controllers_Application_volverAPaisAnterior7(params) => {
   call { 
        invokeHandler(controllers.Application.volverAPaisAnterior(), HandlerDef(this, "controllers.Application", "volverAPaisAnterior", Nil,"POST", """""", Routes.prefix + """volverPaisAnterior"""))
   }
}
        

// @LINE:14
case controllers_Application_prueba8(params) => {
   call { 
        invokeHandler(controllers.Application.prueba(), HandlerDef(this, "controllers.Application", "prueba", Nil,"POST", """""", Routes.prefix + """prueba"""))
   }
}
        

// @LINE:17
case controllers_Assets_at9(params) => {
   call(Param[String]("path", Right("/public")), params.fromPath[String]("file", None)) { (path, file) =>
        invokeHandler(controllers.Assets.at(path, file), HandlerDef(this, "controllers.Assets", "at", Seq(classOf[String], classOf[String]),"GET", """ Map static resources from the /public folder to the /assets URL path""", Routes.prefix + """assets/$file<.+>"""))
   }
}
        
}

}
     