class Socio {

	var club
	var property edad = 0
	var property antiguedad = 0

	method club() = club

	method club(nuevoClub) {
		club = nuevoClub
	}
	
	method esEstrella() {
		return self.antiguedad() > 20
	}
	
	method cantidadActividades() {
		return club.cantidadActividades(self)
	}

}

class Jugador inherits Socio {

	var partidosJugados = 0
	var property valorPase = 0

	method jugoPartido() {
		partidosJugados++
	}

	method partidosJugados() = partidosJugados

	override method club(nuevoClub) {
		super(nuevoClub)
		partidosJugados = 0
	}
	
	override method esEstrella() {
		return self.partidosJugados() > 50 or club.esEstrella(self)
	}

}

