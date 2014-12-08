package com.example.carmenService

import com.example.domain.Lugar
import com.example.domain.Pais
import com.example.domain.PedirPista
import com.example.domain.Sistema
import retrofit.Callback
import retrofit.http.Body
import retrofit.http.GET
import retrofit.http.POST

interface CarmenService {
	@GET("/inicioCaso")
	def void getInicioDeCaso(Callback<String> callback)

	@GET("/inicio")
	def void getInicio(Callback<Sistema> callback)

	@POST("/viajar")
	def void viajarA(@Body Pais paisSelccionado, Callback<Sistema> callback)
	
	@POST("/volverPaisAnterior")
	def void volverAPaisAnterior(@Body Pais paisActual, Callback<Sistema> callback)

	@POST("/pista")
	def void pista(@Body Lugar nombre, Callback<PedirPista> callback)
}
