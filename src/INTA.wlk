import parcelas.*
import especiesDePlantas.*

object inta {
	const property parcelas = []
	
	method promedioDePlantas(){
		return(parcelas.sum{parcela=>parcela.plantas()}) / parcelas.sum()
	}
	
	method masAutosustentable(){
		(self.parcelasConMasDe4Plantas()).max{parcela=>parcela.cantidadDePlantasBienAsociadas()}
	}
	
	method parcelasConMasDe4Plantas(){
		return parcelas.filter{parcela=>parcela.plantas().size()>4}
	}
}
