import materias.*

class Estudiante {
	
	var property materiasAprobadas = []
	var property materiasQueCursa = []
	var property creditos = 0
	
	method puedeInscribirseA(materia){
		return not materiasAprobadas.contains{materia} and self.estaCursandoLa(materia)
	}
	
	method esNuevoIngresante(){
		return materiasQueCursa.isEmpty() and materiasAprobadas.isEmpty()
	}
	
	method estaCursandoLa(materia){
		return materiasQueCursa.contains(materia)
	}
	
	method creditosAcumulados(){
		creditos = materiasAprobadas.sum{elem => elem.creditos()}
	}
	
	method creditosHastaAhora(){
		return creditos
	}
	
	method materiasAprovadas(){
		return materiasAprobadas
	}
	
	method InscribirseA(materia){
		if(self.esNuevoIngresante()){
			 materiasQueCursa.add(materia)
		}
	}
	
	method EliminarInscripcion(materia){
		return materiasQueCursa.remove(materia)
	}
	
	method pasarMateriasAprobadas(){
		return	materiasAprobadas.add{elem => elem.estaAprovado()}
	}
	
	

}