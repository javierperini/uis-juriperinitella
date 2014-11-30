package com.example.carmenandroid

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.view.View.OnClickListener
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.Spinner
import android.widget.Toast
import dummieDomain.Persona
import java.util.ArrayList
import java.util.List

class OrdenActivity extends Activity  {
	
	
	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_orden);
		spinnerVillano
		addListenerOnButton
	}
	
	def spinnerVillano() {
		val spinner2 = findViewById(R.id.villanoMostrar)as Spinner;
		val List<Persona> list= new ArrayList<Persona>()
		list.add(new Persona("Pepe"))
		list.add(new Persona("Pepo"))
		list.add(new Persona("Pepy"))
		val ArrayAdapter<Persona> dataAdapter = new ArrayAdapter<Persona>(this, android.R.layout.simple_spinner_item,list);
		dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		spinner2.setAdapter(dataAdapter)
	}


	def pedirPista(View view){
		val Intent intent = new Intent(this, PedirPistaActivity);
		startActivity(intent);
	}
	def irAViajar(View view){
		val Intent intent = new Intent(this, MainActivity1);
		startActivity(intent);
	}

	def addListenerOnButton() {
		val spinner1 = findViewById(R.id.villanoMostrar) as Spinner;
		val btnSubmit =  findViewById(R.id.emitirOrden) as Button;
		btnSubmit.setOnClickListener(new OnClickListener() {
			override onClick(View v) {
				var String result="Emitiste Orden contra: ".concat( String.valueOf(spinner1.getSelectedItem()))  
				Toast.makeText(OrdenActivity.this,
							   result,
							   Toast.LENGTH_SHORT).show();
			}

		});
		
	}

	
}