package com.example.domain

import java.io.Serializable
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PedirPista implements Serializable {
	String nombreLugar;
	boolean estaVillano;
	String gane;
	List<String> pistas;
}