package com.example.carmenandroid

import android.app.Activity
import com.example.carmenService.CarmenService
import retrofit.RestAdapter

class MainActivity extends Activity {


	protected def createCarmenService() {
		val SERVER_IP = "10.9.1.149" // la facultad
		//192.168.0.109  casa de angie
		//192.168.0.7   mi casa
		val API_URL = "http://192.168.0.7:9000"
		val restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build
		val CarmenService carmenService = restAdapter.create(CarmenService)
		carmenService
	}

}
