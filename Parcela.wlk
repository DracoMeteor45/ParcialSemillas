// PARTE 3
import plantas.*

class Parcela {
	var property ancho = 0
	var property largo = 0
	var property horasAlSol = 0
	var cantidadDePlantas = 0
	const plantas = []
	
	method superficie(){
		return self.ancho() * self.largo()
	}
	
	method cantidadMaxima(){
		var resultado = 0
		if (self.ancho()> self.largo()){resultado = self.superficie() / 5}
		else {resultado = self.superficie() / 3 + self.largo()}
		return resultado
	}
	
	method tieneComplicaciones(){
		return plantas.any({cosa => cosa.horasAlSol() < self.horasAlSol()})
	}
	
	method addPlantas(planta){
		if (plantas.size() < self.cantidadMaxima()){
			cantidadDePlantas += 1
			plantas.add(planta)
		}
		else {self.error("No hay espacio para tu planta")}
	}
	
	method hayPlantasAltas(){ // realizado para el punto 4 
		return plantas.any({cosa => cosa.altura() > 1.5})
	} 
	
	method cantidadDePlantas(){
		return cantidadDePlantas
	}
	
	// metodos agregados para el punto 6
	method seAdaptaBien(planta) 
	
	method cantidadDeAsociadas(){
		return plantas.count({cosa => self.seAdaptaBien(cosa)})
	}
}

// Punto 5
class ParcelaEco inherits Parcela{
	override method seAdaptaBien(planta){
		return not self.tieneComplicaciones() and planta.parcelaIdeal(self)
	}
	
}

class Parcelaindustrial inherits Parcela {
	override method seAdaptaBien(planta){
		return self.cantidadMaxima() == 2 and planta.esFuerte()
	}
}


