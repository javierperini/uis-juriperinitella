package com.example.carmenandroid

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.TextView
import com.example.domain.Sistema
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response

class PantallaIncialActivity extends MainActivity {

	Sistema sistema

	new() {
	}

	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_pantalla_incial);
		inicio()
		inicioDeCaso()

	}

	def irAViajar2(View view) { 
		val Intent intent = new Intent(this, ViajarActivity) =>[
			putExtra(ViajarActivity.SISTEMA, sistema)
		] 
		startActivity(intent)
	}

	def inicioDeCaso() {
		val carmenService = createCarmenService
		carmenService.getInicioDeCaso(
			new Callback<String>() {

				override failure(RetrofitError e) {
					Log.e("", e.message)
					e.printStackTrace
				}

				override success(String inicioDeCaso, Response response) {
					val inicioDeCasoTextView = findViewById(R.id.inicioDeCaso) as TextView
					inicioDeCasoTextView.text = inicioDeCaso
				}

			})
	}

	def inicio() {
		val carmenService = createCarmenService
		carmenService.getInicio(
			new Callback<Sistema>() {

				override failure(RetrofitError e) {
					Log.e("", e.message)
					e.printStackTrace
				}

				override success(Sistema sistema1, Response response) {
					sistema = sistema1
				}

			})
	}
	
	

}
