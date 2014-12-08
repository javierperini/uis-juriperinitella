package com.example.carmenandroid

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.View.OnClickListener
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.Spinner
import android.widget.TextView
import android.widget.Toast
import com.example.domain.Pais
import com.example.domain.Sistema
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response

class ViajarActivity extends MainActivity {
	String arresto

	public static val SISTEMA = "sistema"
	Sistema sistema

	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		val label = findViewById(R.id.ordenDeArresto) as TextView
		label.text = arresto
		sistema = getIntent().getSerializableExtra(SISTEMA) as Sistema
		spinnerPaises()
		addListenerOnButton()
		paisActualText()
		val viajarPaisAnteriorBoton = findViewById(R.id.volverPaisAnterior) as Button
		viajarPaisAnteriorBoton.visibility = View.VISIBLE
	}

	def paisActualText() {
		val label = findViewById(R.id.paisActual) as TextView
		label.text = "Estas en: " + String.valueOf(sistema.paisActual)

	}

	def spinnerPaises() {
		val spinner = findViewById(R.id.paisesViajar) as Spinner;
		val ArrayAdapter<Pais> dataAdapter = new ArrayAdapter<Pais>(this, android.R.layout.simple_spinner_item,
			sistema.conexionesPaisActual);
		dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		spinner.setAdapter(dataAdapter)
	}

	def refrescarActivity(Sistema sistemaNuevo) {
		sistema = sistemaNuevo
		paisActualText()
		spinnerPaises()
		Toast.makeText(ViajarActivity.this, "viajaste a " + sistema.paisActual.toString + "tu pais anterior es " + sistema.paisAnterior.toString, Toast.LENGTH_SHORT).show()
		
	}

	def pedirPista(View view) {
		val Intent intent = new Intent(this, PedirPistaActivity) => [
			putExtra(PedirPistaActivity.SISTEMA, sistema)
		]
		startActivity(intent);
	}

	def pedirOrden(View view) {
		val Intent intent = new Intent(this, OrdenActivity) => [
			putExtra(OrdenActivity.SISTEMA, sistema)
		]
		startActivity(intent);
	}

	def addListenerOnButton() {
		val spinner = findViewById(R.id.paisesViajar) as Spinner
		val viajarBoton = findViewById(R.id.viajar) as Button
		val viajarPaisAnteriorBoton = findViewById(R.id.volverPaisAnterior) as Button
		val carmenService = createCarmenService
		viajarBoton.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					carmenService.viajarA(new Pais(String.valueOf(spinner.getSelectedItem())),
						new Callback<Sistema>() {

							override failure(RetrofitError e) {
								Log.e("", e.message)
								e.printStackTrace
							}

							override success(Sistema sistemaNuevo, Response response) {
								refrescarActivity(sistemaNuevo)
							}
						})
				}

			})
		viajarPaisAnteriorBoton.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					carmenService.volverAPaisAnterior(sistema.paisActual,
						new Callback<Sistema>() {
							override failure(RetrofitError e) {
								Log.e("", e.message)
								e.printStackTrace
							}

							override success(Sistema sistemaNuevo, Response response) {
								refrescarActivity(sistemaNuevo)
							}
						})

				}

			})

	}
}
