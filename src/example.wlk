import materias.*
import curso.*

class Estudiante {
	
	var  materiasAprobadas = []
	var  materiasQueCursa = []
	var  creditos = 0
	var carrera = []
	
	method carrera(){
		return carrera.first()
	}
	
	method puedeInscribirseA(materia){
		return not materiasAprobadas.contains{materia} and not self.estaCursandoLa(materia)
	}
	
	method esNuevoIngresante(){
		return materiasQueCursa.isEmpty() and materiasAprobadas.isEmpty()
	}
	
	method estaCursandoLa(materia){
		return materiasQueCursa.contains(materia)
	}
	
	method creditosAcumulados(){
		return materiasAprobadas.sum{elem => elem.creditos()}
	}
	
	method creditosHastaAhora(){
		return creditos
	}
	
	method listaMateriasAprobadas(){
		return materiasAprobadas
	}

	method InscribirseA(materia){
		if(self.esNuevoIngresante()){
			 materiasQueCursa.add(materia)
		}
		
	}
	
	method materiasDeLaCarrera(){
		return self.carrera().listaDeMaterias()
	}
	
	method pasarNotaA(materia,nota){
		return materiasQueCursa.find{ elem => elem == materia }.pasarNota(nota)
	}
	
	method materiasAprobadas(){
		return materiasQueCursa.find{ elem => elem.estaAprovado() }
			 
	}
	
	method pasarMateriasAprobadas(){
		var mat = self.materiasAprobadas()
		 materiasAprobadas.add{mat}
		 materiasQueCursa.remove(mat)
	}
	
	method tieneAprobadasUnaLista(materias) {
		
		return materiasAprobadas.map{mat => mat.materia()}.asSet()
	}	
	
}