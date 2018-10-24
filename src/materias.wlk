import example.*

class Materia{
	
	var property creditosDeLaMateria = 0
	var property creditosNecesario = 0
	var property materiasNecesariaParaCursar = []
	var property notaDelEstudiante = 0
	var property listaDeEsperra = []
	
	
	method creditos(){
		return creditosDeLaMateria
	}
	
	method trabajoFinal(estudiante){
		estudiante.creditos()
	}
	
	method aproboLasMeterias(estudiante){
		if(materiasNecesariaParaCursar.isEmpty()){
			return true
		}else{
		return	estudiante.materiasAprobadas().contains(materiasNecesariaParaCursar.first()) and 
			estudiante.materiasAprobadas().contains(materiasNecesariaParaCursar.last())
		}
	}
	
	method pasarNota(nota){
		notaDelEstudiante = nota
	}
	
	method nota(){
		return notaDelEstudiante
	}
	
	method estaAprovado(){
		return self.nota() > 6
	}
	
	
}
class Curso{
	
	var property lsCurso = []
	
	
	method agregarEstudiante(estudiante){
		lsCurso.add{ estudiante }
	}
}
