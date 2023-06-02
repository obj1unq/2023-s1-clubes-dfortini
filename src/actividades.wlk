class Actividad {

	var property sanciones = null
	var property lider = null
	const property participantes = #{}

	method evaluacion()

	method participa(socio) {
		return participantes.contains(socio)
	}

	method sancionar()

}

class ActividadDeportiva inherits Actividad {

	var cantidadSanciones = 0
	var campeonatos = 0
	const puntosPorCampeonato = 5
	const puntosPorPlantel = 2
	const puntosPorLiderEstrella = 5
	const puntosPorSanciones = 20

	override method sancionar() {
		cantidadSanciones++
	}

	method cantidadSanciones() = cantidadSanciones

	override method evaluacion() {
		return self.evaluacionCampeonato() + self.evaluacionPlantel() + self.evaluacionLiderEstrella() - self.evaluacionSanciones()
	}

	method estrellas() = self.participantes().filter({ participante => participante.esEstrella() })

	method evaluacionCampeonato() = campeonatos * puntosPorCampeonato

	method evaluacionPlantel() = participantes.size() * puntosPorPlantel

	method evaluacionLiderEstrella() = if (lider.esEstrella()) puntosPorLiderEstrella else 0

	method evaluacionSanciones() = cantidadSanciones * puntosPorSanciones

}

class ActividadSocial inherits Actividad {

	var suspendida = false
	var property valorEvaluacion = 0

	override method sancionar() {
		suspendida = true
	}

	method reanudar() {
		suspendida = false
	}

	method suspendida() = suspendida
	
	override method evaluacion() = if (suspendida) 0 else valorEvaluacion

}

class Futbol inherits ActividadDeportiva {

	const sancionExtra = 10
	const puntosPorEstrellas = 5

	method evaluacionEstrellas() = self.estrellas().size() * puntosPorEstrellas
	
	override method evaluacionSanciones() = super() - sancionExtra + self.evaluacionEstrellas() 

}

