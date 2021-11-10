import Parcela.*
// PARTE 1
class Planta {
	var property anioDeObtencion  = 0 
	var property altura = 0
	
	
	method horasAlSol()
	method esFuerte(){
		return self.horasAlSol() > 10
	}
	method daSemillas(){
		return self.esFuerte()
	}
	method espacio()
	
	method parcelaIdeal(parcela)
	
}

class Menta inherits Planta{
	override method horasAlSol(){
		return 6
	}
	
	override method daSemillas(){
		return super() or self.altura() >= 0.4
	}
	
	override method espacio(){
		return self.altura() * 3
	}
	
	override method parcelaIdeal(parcela){
		return parcela.superficie() > 6
	}
}

class Soja inherits Planta{
	override method horasAlSol(){
		var resultado
		if (self.altura() < 0.5){ resultado = 6}
		else if (self.altura().between(0.5,1)) { resultado = 7}
		else if (self.altura() > 1) { resultado = 9}
		return resultado
	}
	
	override method daSemillas(){
		return super() or self.anioDeObtencion() > 2007 and self.altura() > 1
	}
	override method espacio(){
		return self.altura() / 2
	}
	
	override method parcelaIdeal(parcela){
		return self.horasAlSol() == parcela.horasAlSol()
	}
	
}

class Quinoa inherits Planta {
	var horasAlSol = 0
	method horasAlSol(horas){
		horasAlSol = horas
	}
	override method horasAlSol(){
		return horasAlSol
	}
	
	override method espacio(){
		return 0.5
	}
	
	override method daSemillas(){
		return super() or self.anioDeObtencion() < 2005
	}
	
	override method parcelaIdeal(parcela){
		return not parcela.hayPlantasAltas()
	}
	
}

// PARTE 2 :
class SojaTrans inherits Soja{
	override method daSemillas(){
		return false
	}
	
	override method parcelaIdeal(parcela){
		return parcela.cantidadMaxima() == 1
	}
}

class HierbaBuena inherits Menta{
	override method espacio(){
		return super() * 2
	}
}