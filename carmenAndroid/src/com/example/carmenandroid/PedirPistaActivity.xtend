package com.example.carmenandroid

import android.app.AlertDialog
import android.content.DialogInterface
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.View.OnClickListener
import android.widget.Button
import android.widget.TextView
import com.example.domain.CarmenAppModal
import com.example.domain.PedirPista
import retrofit.Callback
import retrofit.RetrofitError
import retrofit.client.Response

class PedirPistaActivity extends MainActivity {

	override onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_pedir_pista);
		carmen = getIntent().getSerializableExtra(CARMEN) as CarmenAppModal
		paisActualText()
		setButtonListeners()
		emitirOrdenText()
	}

	def setButtonListeners() {

		val carmenService = createCarmenService

		findViewById(R.id.lugar1) as Button => [
			text = carmen.lugar(0).toString
			setOnClickListener(
				new OnClickListener() {
					override onClick(View v) {
						carmenService.pista(carmen.lugar(0),
							new Callback<PedirPista>() {

								override failure(RetrofitError e) {
									Log.e("", e.message)
									e.printStackTrace
								}

								override success(PedirPista pista, Response response) {
									pedirPista(pista, carmen.lugar(0).toString)

								}
							})
					}
				})
		]
		findViewById(R.id.lugar2) as Button => [
			text = carmen.lugar(1).toString
			setOnClickListener(
				new OnClickListener() {
					override onClick(View v) {
						carmenService.pista(carmen.lugar(1),
							new Callback<PedirPista>() {

								override failure(RetrofitError e) {
									Log.e("", e.message)
									e.printStackTrace
								}

								override success(PedirPista pista, Response response) {
									pedirPista(pista, carmen.lugar(1).toString)

								}
							})
					}
				})
		]
		findViewById(R.id.lugar3) as Button => [
			text = carmen.lugar(2).toString
			setOnClickListener(
				new OnClickListener() {
					override onClick(View v) {
						carmenService.pista(carmen.lugar(2),
							new Callback<PedirPista>() {

								override failure(RetrofitError e) {
									Log.e("", e.message)
									e.printStackTrace
								}

								override success(PedirPista pista, Response response) {
									pedirPista(pista, carmen.lugar(2).toString)

								}
							})
					}
				})
		]

	}

	def pedirPista(PedirPista pista, String lugar) {
		if (pista.estaVillano) {
			verFinDeJuego(pista.gane)
		} else {
			verPista(pista, lugar)
		}
	}

	def verFinDeJuego(String gane) {
		val AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(PedirPistaActivity.this);

		alertDialogBuilder.setTitle("Fin de juego");
		alertDialogBuilder.setMessage(gane);
		alertDialogBuilder.setNegativeButton("OK",
			new DialogInterface.OnClickListener() {
				override onClick(DialogInterface dialog, int id) {
					dialog.cancel();
				}
			});
		val AlertDialog alertDialog = alertDialogBuilder.create();
		alertDialog.show();
	}

	def verPista(PedirPista pista, String lugar) {
		val AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(PedirPistaActivity.this);
		alertDialogBuilder.setTitle(lugar);
		alertDialogBuilder.setMessage(pista.pistas);
		alertDialogBuilder.setNegativeButton("OK",
			new DialogInterface.OnClickListener() {
				override onClick(DialogInterface dialog, int id) {
					dialog.cancel();
				}
			});
		val AlertDialog alertDialog = alertDialogBuilder.create();
		alertDialog.show();
	}

	def irAViajar(View view) {
		val Intent intent = new Intent(this, ViajarActivity) => [
			putExtra(ViajarActivity.CARMEN, carmen)
		]
		startActivity(intent);
	}

	def pedirOrden(View view) {
		val Intent intent = new Intent(this, OrdenActivity) => [
			putExtra(OrdenActivity.CARMEN, carmen)
		]
		startActivity(intent);
	}

}
