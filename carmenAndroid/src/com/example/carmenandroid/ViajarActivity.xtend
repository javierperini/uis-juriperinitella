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
import com.example.domain.CarmenAppModal
import com.example.domain.Pais
import com.example.domain.Sistema
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response

class ViajarActivity extends MainActivity {

	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		carmen = getIntent().getSerializableExtra(CARMEN) as CarmenAppModal
		spinnerPaises()
		addListenerOnButton()
		paisActualText()
		emitirOrdenText
		labelPaisesVisitados()
		desabilitarBotones()
	}

	def desabilitarBotones() {
		val button = findViewById(R.id.viajar) as Button
		button.visibility = if(carmen.paisSinConexiones) View.INVISIBLE else View.VISIBLE
		val button2 = findViewById(R.id.volverPaisAnterior) as Button
		button2.visibility = if(carmen.esPrimerPais) View.INVISIBLE else View.VISIBLE
	}

	def spinnerPaises() {
		val spinner = findViewById(R.id.paisesViajar) as Spinner;
		val ArrayAdapter<Pais> dataAdapter = new ArrayAdapter<Pais>(this, android.R.layout.simple_spinner_item,
			carmen.conexionesPaisActual);
		dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		spinner.setAdapter(dataAdapter)
	}

	def refrescarActivity(Sistema sistemaNuevo) {
		carmen.asignarSistema(sistemaNuevo)
		paisActualText()
		spinnerPaises()
		labelPaisesVisitados()
		desabilitarBotones()
		Toast.makeText(ViajarActivity.this, "viajaste a " + carmen.paisActual.toString, Toast.LENGTH_SHORT).show()
	}

	def labelPaisesVisitados() {
		val label = findViewById(R.id.paisesRecorridos) as TextView
		label.text = carmen.paisesRecorridos
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
					carmenService.volverAPaisAnterior(carmen.paisActual,
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

	def pedirPista(View view) {
		val Intent intent = new Intent(this, PedirPistaActivity) => [
			putExtra(PedirPistaActivity.CARMEN, carmen)
		]
		startActivity(intent);
	}

	def pedirOrden(View view) {
		val Intent intent = new Intent(this, OrdenActivity) => [
			putExtra(OrdenActivity.CARMEN, carmen)
		]
		startActivity(intent);
	}
}
