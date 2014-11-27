package com.example.carmenandroid

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import android.widget.Toast
import dummieDomain.ListaPersonas
import dummieDomain.Persona

class OrdenActivity extends Activity implements View.OnClickListener, AdapterView.OnItemSelectedListener {
	
	
	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_orden);
		findViewById(R.id.villanoMostrar) as Spinner => [
			adapter = new ArrayAdapter(this, R.layout.lista_villanos, R.id.todos_villanos, (new ListaPersonas).personas)
			onItemSelectedListener = this
		]
	}


	def pedirPista(View view){
		val Intent intent = new Intent(this, PedirPistaActivity);
		startActivity(intent);
	}
	def irAViajar(View view){
		val Intent intent = new Intent(this, MainActivity1);
		startActivity(intent);
	}
	
	override onClick(View v) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override onItemSelected(AdapterView<?> parent, View view, int pos, long id) {
		val villanoSeleccionado = parent.getItemAtPosition(pos) as Persona
		Toast.makeText(applicationContext, villanoSeleccionado.nombre, Toast.LENGTH_LONG).show
	}
	
	override onNothingSelected(AdapterView<?> arg0) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}