package com.example.carmenandroid

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.View.OnClickListener
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import com.example.domain.PedirPista
import com.example.domain.Sistema
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response

class PedirPistaActivity extends MainActivity {
	public static val SISTEMA = "sistema"
	Sistema sistema

	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_pedir_pista);
		sistema = getIntent().getSerializableExtra(SISTEMA) as Sistema
		paisActualText()
		sistema.asignarLugares()
		setButtonListeners()
	}

	def paisActualText() {
		val label = findViewById(R.id.paisActual) as TextView
		label.text = sistema.paisActual.toString
	}

	def setButtonListeners() {

		val carmenService = createCarmenService

		val lugar1 = findViewById(R.id.lugar1) as Button => [
			text = sistema.lugar1.toString
		]
		val lugar2 = findViewById(R.id.lugar2) as Button => [
			text = sistema.lugar2.toString
		]
		val lugar3 = findViewById(R.id.lugar3) as Button => [
			text = sistema.lugar3.toString
		]
		lugar1.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					carmenService.pista(sistema.lugar1,
						new Callback<PedirPista>() {

							override failure(RetrofitError e) {
								Log.e("", e.message)
								e.printStackTrace
							}

							override success(PedirPista pista, Response response) {
								if (pista.estaVillano) {
									Toast.makeText(PedirPistaActivity.this, pista.pistas.get(0) + pista.pistas.get(1), Toast.LENGTH_LONG).show()
//									val Intent intent = new Intent(this, ViajarActivity) => [
//										putExtra(ViajarActivity.SISTEMA, sistema)
//									]
//									startActivity(intent);
								} else {
									Toast.makeText(PedirPistaActivity.this, pista.pistas.get(0), Toast.LENGTH_LONG).
										show()
								}

							//									if (data.estaVillano) {
							//									$scope.pistaLugar = data.pistas;
							//									$scope.finalJuego = data.gane;
							//									$scope.mostrarBotonFinal = true;
							//									$scope.abrirJuegoFinal();
							//
							//								} else {
							//									$scope.pistaLugar = data.pistas;
							//									$scope.pistaShow = true;
							//								}
							//							}
							//						)
							}

						})
				}
			})
		lugar2.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					Toast.makeText(PedirPistaActivity.this, "lugar2", Toast.LENGTH_LONG).show()
				}
			})
		lugar3.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					Toast.makeText(PedirPistaActivity.this, "lugar3", Toast.LENGTH_LONG).show()
				}
			})
	}

	def irAViajar(View view) {
		val Intent intent = new Intent(this, ViajarActivity) => [
			putExtra(ViajarActivity.SISTEMA, sistema)
		]
		startActivity(intent);
	}

	def pedirOrden(View view) {
		val Intent intent = new Intent(this, OrdenActivity) => [
			putExtra(OrdenActivity.SISTEMA, sistema)
		]
		startActivity(intent);
	}
}
