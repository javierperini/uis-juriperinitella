package com.example.carmenandroid

import android.app.Activity
import android.widget.TextView
import com.example.carmenService.CarmenService
import com.example.domain.CarmenAppModal
import org.eclipse.xtend.lib.annotations.Accessors
import retrofit.RestAdapter

@Accessors
class MainActivity extends Activity {
	public static val CARMEN = "carmen"
	CarmenAppModal carmen
	protected def createCarmenService() {
		val SERVER_IP = "10.9.1.149" // la facultad

		//192.168.0.109  casa de angie
		//192.168.0.7   mi casa
		val API_URL = "http://192.168.0.7:9000"
		val restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build
		val CarmenService carmenService = restAdapter.create(CarmenService)
		carmenService
	}

	def paisActualText() {
		val label = findViewById(R.id.paisActual) as TextView
		label.text = "Estas en: " + String.valueOf(carmen.paisActual)

	}

	def emitirOrdenText() {
		val label = findViewById(R.id.ordenDeArresto) as TextView
		label.text = '''Arrestaste a: «carmen.villanoOrden.nombre»'''
	}
	

}
