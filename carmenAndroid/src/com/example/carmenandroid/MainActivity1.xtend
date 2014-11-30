package com.example.carmenandroid

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.Menu
import android.view.View
import android.widget.TextView
import dummieDomain.Persona

class MainActivity1 extends Activity {
	
	public static val ORDEN_ARRESTO = "ORDEN_ARRESTO"
	Persona ordenArresto
		
	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		this.ordenArresto = intent.getSerializableExtra(ORDEN_ARRESTO) as Persona 
		val label = findViewById(R.id.ordenDeArresto) as TextView 
//		if(ordenArresto != null)
			label.text = "Arrestaste a: " + ordenArresto.nombre
	}

	override onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

//	override onOptionsItemSelected(MenuItem item) {
//		// Handle action bar item clicks here. The action bar will
//		// automatically handle clicks on the Home/Up button, so long
//		// as you specify a parent activity in AndroidManifest.xml.
//		val int id = item.getItemId();
//		if (id == R.id.action_settings) {
//			return true;
//		}
//		return super.onOptionsItemSelected(item);
//	}
	
	def pedirPista(View view){
		val Intent intent = new Intent(this, PedirPistaActivity);
		startActivity(intent);
	}
	def pedirOrden(View view){
		val Intent intent = new Intent(this, OrdenActivity);
		startActivity(intent);
	}
		
	
}