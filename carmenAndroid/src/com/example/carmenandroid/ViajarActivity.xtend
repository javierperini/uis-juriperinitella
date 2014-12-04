package com.example.carmenandroid

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.view.View.OnClickListener
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.Spinner
import android.widget.TextView
import android.widget.Toast
import com.example.domain.Sistema
import dummieDomain.Lugar
import dummieDomain.Pais
import java.util.ArrayList
import java.util.List

class ViajarActivity extends MainActivity {
	String arresto
	
	public static val SISTEMA = "sistema"
	Sistema sistema

	//	Persona ordenArresto = new Persona("")
	//		
	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
//		arresto = getIntent().getStringExtra("arresto");
		val label = findViewById(R.id.ordenDeArresto) as TextView
		label.text = arresto
		sistema= getIntent().getSerializableExtra(SISTEMA) as Sistema
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
	
	def spinnerPaises(){
		val spinner = findViewById(R.id.paisesViajar) as Spinner;
		val List<Pais> list = new ArrayList<Pais>()
		var List<Lugar> lugares = new ArrayList<Lugar>()
		lugares.add(new Lugar("Biblioteca", "pista biblioteca"))
		lugares.add(new Lugar("Embajada", "pista embajada"))
		lugares.add(new Lugar("Club", "pista club"))
		list.add(new Pais("Argentina", lugares))
		list.add(new Pais("Brasil", lugares))
		list.add(new Pais("Colombia", lugares))
		val ArrayAdapter<Pais> dataAdapter = new ArrayAdapter<Pais>(this, android.R.layout.simple_spinner_item, list);
		dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		spinner.setAdapter(dataAdapter)
	}


	def pedirPista(View view) {
		val label = findViewById(R.id.paisActual) as TextView
		val Intent intent = new Intent(this, PedirPistaActivity);
		intent.putExtra("paisActual", label.text)
		startActivity(intent);
	}

	def pedirOrden(View view) {
		val Intent intent = new Intent(this, OrdenActivity);
		intent.putExtra("arresto", arresto)

		startActivity(intent);
	}
	

	
	def addListenerOnButton() {
		val spinner = findViewById(R.id.paisesViajar) as Spinner
		val label = findViewById(R.id.paisActual) as TextView
		val viajarBoton = findViewById(R.id.viajar) as Button
		val viajarPaisAnteriorBoton = findViewById(R.id.volverPaisAnterior) as Button
		viajarBoton.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					var String result = "Viajaste a " + String.valueOf(spinner.getSelectedItem())
					Toast.makeText(ViajarActivity.this, result, Toast.LENGTH_SHORT).show()
					label.text = "Estas en: " + String.valueOf(spinner.getSelectedItem())

				}

			})
		viajarPaisAnteriorBoton.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					var String result = "Viajaste a " //Paisactual.nombrepaisanterior + String.valueOf(spinner.getSelectedItem())
					Toast.makeText(ViajarActivity.this, result, Toast.LENGTH_SHORT).show()
					label.text = "Estas en: " //paisactual.nombre + String.valueOf(spinner.getSelectedItem())
					

				}

			})
		

	}

}
