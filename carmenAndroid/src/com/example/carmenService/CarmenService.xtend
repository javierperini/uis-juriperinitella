package com.example.carmenService

import com.example.domain.Sistema
import retrofit.Callback
import retrofit.http.GET

interface CarmenService {
	@GET("/inicioCaso")
	def void getInicioDeCaso(Callback<String> callback)
	
	@GET("/inicio")
	def void getInicio(Callback<Sistema> callback)

}
