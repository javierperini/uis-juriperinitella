package com.example.carmenandroid

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.ActionBarActivity
import android.view.Menu
import android.view.MenuItem
import android.view.View

class PedirPistaActivity extends ActionBarActivity {
	


	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_pedir_pista);
	}

	override onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.pedir_pista, menu);
		return true;
	}

	
	override onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		val int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
	def irAViajar(View view){
		val Intent intent = new Intent(this, MainActivity1);
		startActivity(intent);
	}
	def pedirOrden(View view){
		val Intent intent = new Intent(this, OrdenActivity);
		startActivity(intent);
	}
	
}