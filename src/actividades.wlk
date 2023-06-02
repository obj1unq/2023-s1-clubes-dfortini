class Actividad {
	var property sanciones = null
	var property lider = null
	const property participantes = #{}
	
	method evaluacion() {}
	
	method participa(socio) {
		return participantes.contains(socio)
	}
	
}

class ActividadDeportiva inherits Actividad {
}

class ActividadSocial inherits Actividad {
	 
	
}
