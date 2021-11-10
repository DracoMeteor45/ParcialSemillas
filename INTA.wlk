object inta {
	const parcelas = []
	
	method addParcela(parcela){
		parcelas.add(parcela)}
		
	method promedio(){
		return parcelas.sum({cosa => cosa.cantidadDePlantas()}) / parcelas.size()
	}
	
	method masDe4Plantas(){
		return parcelas.filter({cosa => cosa.cantidadDePlantas() > 4})
	}
	method masAuto(){
		return self.masDe4Plantas().max({cosa => cosa.cantidadDeAsociadas()})
	}
	
	}
