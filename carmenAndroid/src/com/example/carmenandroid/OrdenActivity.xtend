package com.example.carmenandroid

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.ActionBarActivity
import android.view.View

class OrdenActivity extends ActionBarActivity {
	
	
	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_orden);
	}


	def pedirPista(View view){
		val Intent intent = new Intent(this, PedirPistaActivity);
		startActivity(intent);
	}
	def irAViajar(View view){
		val Intent intent = new Intent(this, MainActivity1);
		startActivity(intent);
	}
	
}