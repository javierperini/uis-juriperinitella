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
import java.util.ArrayList
import java.util.List
import com.example.domain.Villano

class OrdenActivity extends MainActivity {
	public static val SISTEMA = "sistema"
//	String arresto
	Sistema sistema
	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_orden);
		sistema= getIntent().getSerializableExtra(SISTEMA) as Sistema
		spinnerVillano
		addListenerOnButton
//		arresto = getIntent().getStringExtra("arresto");
//		val label = findViewById(R.id.ordenDeArresto) as TextView
//		label.text = arresto
	}

	def spinnerVillano() {
		val spinner2 = findViewById(R.id.villanoMostrar)as Spinner;
		val ArrayAdapter<Villano> dataAdapter = new ArrayAdapter<Villano>(this, android.R.layout.simple_spinner_item,
			sistema.villanosSistema);
		dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		spinner2.setAdapter(dataAdapter)
	}

	def pedirPista(View view) {
		val Intent intent = new Intent(this, PedirPistaActivity) =>[
			putExtra(PedirPistaActivity.SISTEMA, sistema)
		] 
		startActivity(intent);
	}

	def irAViajar(View view) {
//		val label = findViewById(R.id.ordenDeArresto) as TextView
//		val Intent intent = new Intent(this, ViajarActivity)
////		intent.putExtra("arresto", label.text)
	val Intent intent = new Intent(this, ViajarActivity) =>[
			putExtra(ViajarActivity.SISTEMA, sistema)
		] 
		startActivity(intent);
	}

	def addListenerOnButton() {
		val spinner1 = findViewById(R.id.villanoMostrar) as Spinner
		val label = findViewById(R.id.ordenDeArresto) as TextView
		val btnSubmit = findViewById(R.id.emitirOrden) as Button
		btnSubmit.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					var String result = '''Emitiste Orden contra: « String.valueOf(spinner1.getSelectedItem())»'''
					Toast.makeText(OrdenActivity.this, result, Toast.LENGTH_SHORT).show()
					label.text = '''Arrestaste a: «String.valueOf(spinner1.getSelectedItem())»'''

				}

			})
		

	}

}
