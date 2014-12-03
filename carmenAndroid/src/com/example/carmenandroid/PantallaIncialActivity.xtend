package com.example.carmenandroid

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.TextView

class PantallaIncialActivity extends Activity {
	
	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_pantalla_incial);
	}
	
	def irAViajar(View view) {
		val Intent intent = new Intent(this, MainActivity1)
		startActivity(intent)
	}
	
}