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
import com.example.domain.Villano
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response

class OrdenActivity extends MainActivity {

	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_orden);
		carmen = getIntent().getSerializableExtra(CARMEN) as CarmenAppModal
		spinnerVillano
		addListenerOnButton
		emitirOrdenText
	}

	def spinnerVillano() {
		val spinner2 = findViewById(R.id.villanoMostrar)as Spinner;
		val ArrayAdapter<Villano> dataAdapter = new ArrayAdapter<Villano>(this, android.R.layout.simple_spinner_item,
			carmen.villanosSistema);
		dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		spinner2.setAdapter(dataAdapter)
	}


	def refrescarActivity(Villano v) {
		carmen.setVillanoOrden(v)
		emitirOrdenText()
		Toast.makeText(OrdenActivity.this, "Emitiste orden contra: " + v.nombre, Toast.LENGTH_SHORT).show()
	}

	def addListenerOnButton() {
		val spinner1 = findViewById(R.id.villanoMostrar) as Spinner

		val btnSubmit = findViewById(R.id.emitirOrden) as Button
		val carmenService = createCarmenService
		btnSubmit.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					carmenService.emitiriOrden(new Villano(String.valueOf(spinner1.getSelectedItem())),
						new Callback<Villano>() {

							override failure(RetrofitError e) {
								Log.e("", e.message)
								e.printStackTrace
							}

							override success(Villano sistemaNuevo, Response response) {
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

	def irAViajar(View view) {
		val Intent intent = new Intent(this, ViajarActivity) => [
			putExtra(ViajarActivity.CARMEN, carmen)
		]
		startActivity(intent);
	}
}
