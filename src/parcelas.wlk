import especiesDePlantas.*


class Parcelas{
	var property ancho
	var property largo
	var property horasSol
	const property plantas = []
	
	
	method superficieParcela(){
		return ancho * largo
	}
	
	method cantidadMaximaDePlantas(){
		if(ancho>largo){
			return( self.superficieParcela() /5)
		} else {return (self.superficieParcela()/3) +largo}
	}
	
	method tieneComplicaciones(){
		return not(plantas.filter{planta=>planta.horasSol()<horasSol}.isEmpty())
	}
	
	method plantarUnaPlanta(planta){
		if((plantas.size()>= self.cantidadMaximaDePlantas()) or (horasSol - planta.horasSol() > 2)){self.error("No es posible sembrar esta planta")}
		 else {plantas.add(planta)}
		 
	}
	
	method parcelaEcologica(planta){
		return planta.parcelaIdeal(self) and not(self.tieneComplicaciones())
	}
	
	method parcelaIndustrial(planta){
		
		return self.plantas().size()<=2 and planta.esFuerte()
		
		
	}
	
	method cantidadDePlantasBienAsociadas(){
		plantas.filter{planta=>planta.plantaBienAsociada()}
	}
	
}