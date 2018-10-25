import example.*
import curso.*

class Materia{
	
	var property cupos = 0
	const anio = 0
	const creditosDeLaMateria = 0
	var  notaDelEstudiante = 0
	var  listaDeEsperra = []
	var curso = []
	
	
	method agregarAlumnoALsDeEspera(estudiante){
		listaDeEsperra.add(estudiante)
	}
	
	method agregarAlumnoAlCurso(materia,estudiante){
	  if(materia.requisitos(estudiante) and cupos > 0){
		curso.add(estudiante)
		cupos -= 1
		}else{
			materia.agregarAlumnoALsDeEspera(estudiante)
		}
	}
	  
	method LsDeEspera(){
		return listaDeEsperra
	}
	  
	method totalCupos(){
		return cupos
	}
	
	method listaDelCurso(){
		return curso
	}
	
	method creditos(){
		return creditosDeLaMateria
	}
	
	method anioDeLaMateria(){
		return anio
	}
	
	method trabajoFinal(estudiante){
		estudiante.creditos()
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
	
	method requisitos(estudiante){
		return	true
	}
	
	
}

class MateriasCorrelativas inherits Materia {
	
	var property materiasNecesariaParaCursar = []
	
	
	override method requisitos(estudiante){
		return	materiasNecesariaParaCursar.all {materia => estudiante.listaMateriasAprobadas().contains(materia)}
	}
	
}

class MateriasConAniosNecesarios inherits Materia {
	
	override method requisitos(estudiante){
		return estudiante.carrera().listaDeMaterias().filter{ elem => elem.anioDeLaMateria() < anio }.size() ==
				estudiante.listaMateriasAprobadas().filter{ elem => elem.anioDeLaMateria() < anio }.size()
	}
	
}

class MateriasConNecesidadDeCreditos inherits Materia {
	
	var property creditosNecesarios = 0
	
	override method requisitos(estudiante){
		return  estudiante.creditosAcumulados() >= creditosNecesarios
	}
	
		
}



