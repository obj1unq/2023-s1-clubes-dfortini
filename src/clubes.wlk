object municipio {

}

class Club {

	var property actividades = #{}
	var property socios = #{}
	var property perfilClub
	var property valorPaseEstrella = 100

	method evaluar() {
	}

	method agregarSocio(nuevoSocio) {
		socios.add(nuevoSocio)
		nuevoSocio.club(self)
	}

	method socioMasViejo() = socios.max({ socio => socio.edad() })

	method sociosDestacados() = actividades.map({ actividad => actividad.lider() })

	method esEstrella(socio) = perfilClub.esEstrella(socio)

	method cantidadActividades(jugador) = actividades.count({ actividad => actividad.participa(jugador) })

}

class PerfilClub {

	method superaValorDePaseEstrella(jugador) {
		return jugador.valorPase() > jugador.club().valorPaseEstrella()
	}

	method parcitipaDeMuchasActividades(socio) {
		return socio.cantidadActividades() >= 3
	}

}

object tradicional inherits PerfilClub {

	method esEstrella(socio) {
		return self.parcitipaDeMuchasActividades(socio) or self.superaValorDePaseEstrella(socio)
	}

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

}

