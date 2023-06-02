class Actividad {
	var property sanciones = null
	var property lider = null
	const property participantes = #{}
	
	method evaluacion() {}
	
	method participa(socio) {
		return participantes.contains(socio)
	}
	
	method sancionar()
	
}

class ActividadDeportiva inherits Actividad {
	var cantidadSanciones = 0
	
	override method sancionar() {
		cantidadSanciones ++
	}
	
	method cantidadSanciones() = cantidadSanciones
	
}

class ActividadSocial inherits Actividad {
	var suspendida = false
	 
	override method sancionar() {
		suspendida = true
	}
	
	method reanudar() {
		suspendida = false
	}
	
	method suspendida() = suspendida
	
}
