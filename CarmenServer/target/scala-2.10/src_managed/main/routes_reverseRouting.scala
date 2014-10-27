// @SOURCE:/home/javier/Escritorio/Facultad/Interface/CarmenServer/conf/routes
// @HASH:92fb0edb7df40d779aabe0b26d49a560c8af89ed
// @DATE:Mon Oct 27 20:41:02 ART 2014

import Routes.{prefix => _prefix, defaultPrefix => _defaultPrefix}
import play.core._
import play.core.Router._
import play.core.j._

import play.api.mvc._
import play.libs.F

import Router.queryString


// @LINE:17
// @LINE:14
// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
package controllers {

// @LINE:17
class ReverseAssets {
    

// @LINE:17
def at(file:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "assets/" + implicitly[PathBindable[String]].unbind("file", file))
}
                                                
    
}
                          

// @LINE:14
// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
class ReverseApplication {
    

// @LINE:6
def paisesSistema(): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "paises")
}
                                                

// @LINE:7
def villanosSistema(): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "villanos")
}
                                                

// @LINE:9
def paisesFallidos(): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "paisesFallidos")
}
                                                

// @LINE:10
def paisActual(): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "paisActual")
}
                                                

// @LINE:12
def pedirPista(): Call = {
   Call("POST", _prefix + { _defaultPrefix } + "pista")
}
                                                

// @LINE:14
def prueba(): Call = {
   Call("POST", _prefix + { _defaultPrefix } + "prueba")
}
                                                

// @LINE:13
def volverAPaisAnterior(): Call = {
   Call("POST", _prefix + { _defaultPrefix } + "volverPaisAnterior")
}
                                                

// @LINE:11
def viajar(): Call = {
   Call("POST", _prefix + { _defaultPrefix } + "viajar")
}
                                                

// @LINE:8
def paisesVisitados(): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "paisesVisitados")
}
                                                
    
}
                          
}
                  


// @LINE:17
// @LINE:14
// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
package controllers.javascript {

// @LINE:17
class ReverseAssets {
    

// @LINE:17
def at : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Assets.at",
   """
      function(file) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "assets/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("file", file)})
      }
   """
)
                        
    
}
              

// @LINE:14
// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
class ReverseApplication {
    

// @LINE:6
def paisesSistema : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.paisesSistema",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "paises"})
      }
   """
)
                        

// @LINE:7
def villanosSistema : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.villanosSistema",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "villanos"})
      }
   """
)
                        

// @LINE:9
def paisesFallidos : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.paisesFallidos",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "paisesFallidos"})
      }
   """
)
                        

// @LINE:10
def paisActual : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.paisActual",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "paisActual"})
      }
   """
)
                        

// @LINE:12
def pedirPista : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.pedirPista",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "pista"})
      }
   """
)
                        

// @LINE:14
def prueba : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.prueba",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "prueba"})
      }
   """
)
                        

// @LINE:13
def volverAPaisAnterior : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.volverAPaisAnterior",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "volverPaisAnterior"})
      }
   """
)
                        

// @LINE:11
def viajar : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.viajar",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "viajar"})
      }
   """
)
                        

// @LINE:8
def paisesVisitados : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.paisesVisitados",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "paisesVisitados"})
      }
   """
)
                        
    
}
              
}
        


// @LINE:17
// @LINE:14
// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
package controllers.ref {


// @LINE:17
class ReverseAssets {
    

// @LINE:17
def at(path:String, file:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Assets.at(path, file), HandlerDef(this, "controllers.Assets", "at", Seq(classOf[String], classOf[String]), "GET", """ Map static resources from the /public folder to the /assets URL path""", _prefix + """assets/$file<.+>""")
)
                      
    
}
                          

// @LINE:14
// @LINE:13
// @LINE:12
// @LINE:11
// @LINE:10
// @LINE:9
// @LINE:8
// @LINE:7
// @LINE:6
class ReverseApplication {
    

// @LINE:6
def paisesSistema(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.paisesSistema(), HandlerDef(this, "controllers.Application", "paisesSistema", Seq(), "GET", """ Home page""", _prefix + """paises""")
)
                      

// @LINE:7
def villanosSistema(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.villanosSistema(), HandlerDef(this, "controllers.Application", "villanosSistema", Seq(), "GET", """""", _prefix + """villanos""")
)
                      

// @LINE:9
def paisesFallidos(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.paisesFallidos(), HandlerDef(this, "controllers.Application", "paisesFallidos", Seq(), "GET", """""", _prefix + """paisesFallidos""")
)
                      

// @LINE:10
def paisActual(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.paisActual(), HandlerDef(this, "controllers.Application", "paisActual", Seq(), "GET", """""", _prefix + """paisActual""")
)
                      

// @LINE:12
def pedirPista(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.pedirPista(), HandlerDef(this, "controllers.Application", "pedirPista", Seq(), "POST", """""", _prefix + """pista""")
)
                      

// @LINE:14
def prueba(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.prueba(), HandlerDef(this, "controllers.Application", "prueba", Seq(), "POST", """""", _prefix + """prueba""")
)
                      

// @LINE:13
def volverAPaisAnterior(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.volverAPaisAnterior(), HandlerDef(this, "controllers.Application", "volverAPaisAnterior", Seq(), "POST", """""", _prefix + """volverPaisAnterior""")
)
                      

// @LINE:11
def viajar(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.viajar(), HandlerDef(this, "controllers.Application", "viajar", Seq(), "POST", """""", _prefix + """viajar""")
)
                      

// @LINE:8
def paisesVisitados(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.paisesVisitados(), HandlerDef(this, "controllers.Application", "paisesVisitados", Seq(), "GET", """""", _prefix + """paisesVisitados""")
)
                      
    
}
                          
}
        
    