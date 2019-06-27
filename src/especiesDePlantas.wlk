import parcelas.*

class Especies {
	var property horasSol
	var property anioObtencion
	var property altura
	var property espacioQueOcupa
	
	
	
	method esFuerte(){
		return (horasSol>10)
	}
	
	method daSemillas(){
		return( self.esFuerte())
	}
	
	method plantaBienAsociada(parcela){
		return parcela.Ecologica(self) or parcela.industrial(self)
		
	}
	
	
}

class Menta inherits Especies{
	
	override method daSemillas(){
		return (self.esFuerte()|| altura>0.4)
	}
	
	override method espacioQueOcupa(){
		return (altura * 3)
	}
	
	method parcelaIdeal(parcela){
		return (parcela.superficieParcela()>6)
	}
	
}

class Soja inherits Especies{
	
	override method horasSol(){
		if (altura<0.5){ return 6 }
			else if(altura>=0.5 && altura<=1){return 7}
				else {return 9}
	}
	
	override method daSemillas(){
		return (self.esFuerte() || (self.obtencionReciente() && altura>1))
	}
	
	method obtencionReciente(){
		return anioObtencion > 2007
	}
	override method espacioQueOcupa(){
		return (altura /2)
	}
	
	method parcelaIdeal(parcela){
		return(parcela.horasSol() == horasSol)
	}
	
}
class Quinoa inherits Especies{
	
	override method espacioQueOcupa(){
		return 0.5
		
	}
	
	override method daSemillas(){
		return (self.esFuerte() || (self.obtencionReciente() && altura>1))
	}
	
	method obtencionReciente(){
		return (anioObtencion <2005)
	
	}	
	
	method parcelaIdeal(parcela){
		parcela.plantas().filter{planta=>planta.altura()<1.5}.isEmpty()
	}
}

class SojaTransgenica inherits Soja{
	
	override method daSemillas(){
		return false
	}
	 override method parcelaIdeal(parcela){
	 	return parcela.plantas().size()<=1
	 	
	 }
	
	
}

class Hierbabuena inherits Menta{
	
	override method espacioQueOcupa(){
		return (altura * 3)*2
	}
}


