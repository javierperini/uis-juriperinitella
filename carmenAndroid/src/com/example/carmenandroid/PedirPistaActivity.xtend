package com.example.carmenandroid

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.view.View.OnClickListener
import android.widget.Button
import android.widget.TextView
import android.widget.Toast

class PedirPistaActivity extends Activity {

	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_pedir_pista);

		val label = findViewById(R.id.paisActual) as TextView
		label.text = getIntent().getStringExtra("paisActual")
		
		setButtonListeners()
	}
	
	def setButtonListeners(){
		val lugar1 = findViewById(R.id.lugar1) as Button
		val lugar2 = findViewById(R.id.lugar2) as Button
		val lugar3 = findViewById(R.id.lugar3) as Button
		lugar1.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					Toast.makeText(PedirPistaActivity.this, "lugar1", Toast.LENGTH_LONG).show()
				}
			})
		lugar2.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					Toast.makeText(PedirPistaActivity.this, "lugar1", Toast.LENGTH_LONG).show()
				}
			})
		lugar3.setOnClickListener(
			new OnClickListener() {
				override onClick(View v) {
					Toast.makeText(PedirPistaActivity.this, "lugar1", Toast.LENGTH_LONG).show()
				}
			})
	}

	def irAViajar(View view) {
		val Intent intent = new Intent(this, MainActivity1);
		startActivity(intent);
	}

	def pedirOrden(View view) {
		val Intent intent = new Intent(this, OrdenActivity);
		startActivity(intent);
	}

}
