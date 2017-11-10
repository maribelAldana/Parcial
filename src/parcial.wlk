/*object escuela{
	var profesores = []
	var alumnos = []
	
	method agregarProfesor(profe){
		profesores.add(profe)
	}
	
	method profesores()= profesores
}
* 
*/


class Estudiante {
	var dinero=0
	var platos = []
	var pedido 
	var profesor=""
	
	method profesor() = profesor
	
	method probarPlatos(p){
		platos.add(p)	
		}
	method platos() = platos
	
	method cantDePlatos(){
		return platos.size()
	}
	
	method tieneEstePedido(lugar){
		return lugar.poseeEstePlato(pedido)
	}
	 method descontarPlata(plata){
	 	dinero-=plata
	 }
	 
	method probarAleatoriamente(listaDePlato){
		self.probarPlatos(listaDePlato.anyOne())
	}
	
	
	

}

class Criticos inherits Estudiante{
	var horaDePrograma=0
	
	method horaDePrograma(hora){
		horaDePrograma=hora
	}
	
	method horaDePrograma()=horaDePrograma
	
	method esBuenaOnda(){
		return self.platos()*10 > horaDePrograma
		
	}
	
	
}

class Declutidores inherits Estudiante{
	var tieneAuto= false
	
	method tieneAuto(valor){
		tieneAuto = valor
	}
	method tieneAuto() = tieneAuto
	
	method esBuenaOnda(){
		return self.platos()>20 || self.tieneAuto()
		
	}
	
}

class Plato{
	var nombre = ""
	
	method nombre(n) { nombre = n}
	
	method nonbre() = nombre
}


class Gira{

	var participantes=[]
	var platosPedidos = []
	
	
	constructor(p){
		participantes.add(p)
	}
	
	method platos(listaDePlatos){
	 platosPedidos.addAll(listaDePlatos)
	}
	
	method valeLaPenaIr(lugar){
		if(lugar.cumpleConLoRequerido(participantes)){
			self.pagarCuenta(lugar)
		}
	}
	
	method valorDelCostoXpersona(lugar){
	 return lugar.costo()/ participantes.size()
		
	}
	method pagarCuenta(lugar){
		participantes.forEach({p=>p.descontarPlata(self.valorDelCostoXpersona(lugar))})
	}
}

class Bodegon{
	var costo=0
	var cartaDePlatos = []
	
	method costo(c){ costo = c}
	
	method agragarPlatos(plato){
		cartaDePlatos.add(plato)
	}
	method cartaDePlatos() = cartaDePlatos
	
	method poseeEstePlato(plato){
		return cartaDePlatos.add(plato)
	}
	
	method cumpleConLoRequerido(participantes){
		return participantes.all({p=>p.tieneEstePedido(self)})
	}

	
}

class Restaurante{
	var calificacion = 0
	var chef
	
	constructor(cali,_chef){
		calificacion = cali
		chef= _chef
	}
	method cumpleConLoRequerido(participantes){
		return calificacion >= 3 && (chef.esProfesorDe(participantes) || chef.trabajaEnUnPrograma())
	}
	
}

class Etnicos inherits Restaurante{
	var esExotico = false
	
	constructor(c,ch,valor)= super(c,ch){
		esExotico = valor
	}
	
	override method cumpleConLoRequerido(_){
		return esExotico
	}
}


class Chef{
	var trabajaEnUnPrograma = false
	var nombre=""
	
	method nombre(n) {nombre = n}
	method nombre() = nombre
	
	method trabajaEnUnPrograma(valor){
		trabajaEnUnPrograma = valor
	}
	method trabajaEnUnPrograma()= trabajaEnUnPrograma
	
	method esProfesorDe(participantes){
		return participantes.profesor() == self.nombre()
	}
	
	
}


/*
 * Para PENSAR
 * 
 * Si es posible crear nuevo lugar de comida sin modificar el codigo existente.
 * Solo se tiene que agregar una clase mas  para este lugar que pueda responda a los mismos 
 * metodos que los demas lugares , es decir, que se debe utilizar polimorfismo para que un alumno o un lugar 
 * pueda utilizar esta clase nueva.
 * 
 * 
 */