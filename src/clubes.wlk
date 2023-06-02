object municipio {

}

class Club {

	var property actividades = #{}
	var property socios = #{}
	var property perfilClub
	var property valorPaseEstrella = 100
	var property gastoMensual = 0

	method agregarSocio(nuevoSocio) {
		socios.add(nuevoSocio)
		nuevoSocio.club(self)
	}

	method socioMasViejo() = socios.max({ socio => socio.edad() })

	method sociosDestacados() = actividades.map({ actividad => actividad.lider() })

	method sociosDestacadosEstrella() = self.sociosDestacados().filter({ socio => socio.esEstrella() })

	method esEstrella(socio) = perfilClub.esEstrella(socio)

	method cantidadActividades(jugador) = actividades.count({ actividad => actividad.participa(jugador) })

	method sancionar() {
		if (socios.size() > 500) {
			actividades.forEach({ actividad => actividad.sancionar()})
		}
	}

	method evaluacion() = self.evalucionBruta() / socios.size()

	method evalucionBruta() = perfilClub.evalucionBruta(self)
	
	method esPrestigioso() = self.tieneUnEquipoExperimentado() or tieneActividadConEstrellas() 
	
	method tieneUnEquipoExperimentado() = self.actividades().any({actividad => actividad.esExperimentado()})
	

}

class PerfilClub {

	method superaValorDePaseEstrella(jugador) {
		return jugador.valorPase() > jugador.club().valorPaseEstrella()
	}

	method parcitipaDeMuchasActividades(socio) {
		return socio.cantidadActividades() >= 3
	}

	method evalucionBruta(club) = self.sumaEvaluacionesActividades(club) - self.gasto(club)

	method sumaEvaluacionesActividades(club) = club.actividades().sum({ actividad => actividad.evaluacion() })

	method gasto(club) = 0

}

object tradicional inherits PerfilClub {

	method esEstrella(socio) {
		return self.parcitipaDeMuchasActividades(socio) or self.superaValorDePaseEstrella(socio)
	}

	override method gasto(club) = club.gastoMensual()

}

object comunitario inherits PerfilClub {

	method esEstrella(socio) {
		return self.parcitipaDeMuchasActividades(socio)
	}

}

object profesional inherits PerfilClub {

	method esEstrella(jugador) {
		return self.superaValorDePaseEstrella(jugador)
	}

	override method gasto(club) = club.gastoMensual() * 5

	override method sumaEvaluacionesActividades(club) = super(club) * 2

}

