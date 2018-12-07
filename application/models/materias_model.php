<?php 
	class Materias_model extends Ci_Model
	{
		
		function __construct()
		{
			parent::__construct();
		}
		// Nos traemos todas las materias a las cuales el alumno puede incribirse que son todas las materias que no figuren en la tabla inscripciones con el id del alumno para la tabla inscripciones y año de cursado correspondiente.
		public function getMateriasInscripcionesModel($id_alumno, $anio_cursado)
		{
			$this->db->select('materias.descripcion')->
						from('materias')->
						join('inscripciones', 'inscripciones.id_materia = materias.id_materia')->
						where('id_alumno', $id_alumno)->
						where('anio_cursado', $anio_cursado);
			$subQuery =  $this->db->get_compiled_select();


			$this->db->distinct();
			$this->db->select('materias.id_materia,
							  materias.descripcion as descripcion,
							  materias.curso,
							  materias.division,
						      carreras.descripcion as nombreCarrera,
							  docentes.nombre as nombreDocente,
							  docentes.apellido as apellidoDocente ');
			$this->db->from('materias');
			$this->db->join('carreras', 'carreras.id = materias.id_carrera');
			$this->db->join('docentes', 'docentes.id = materias.id_docente');
			$this->db->where("materias.descripcion NOT IN ($subQuery)", NULL, FALSE);
			$this->db->order_by("nombreCarrera, materias.curso, materias.division, descripcion");
			$consulta = $this->db->get();
			$resultado = $consulta->result_array();
			return $resultado;


		}
		public function inscribirseAMateria($idAlumno, $idMateria, $anio)
		{
			$data = array
				(
			        'id_alumno' => $idAlumno,
			        'id_materia' => $idMateria,
			        'anio_cursado' => $anio
				);

			$this->db->insert('inscripciones', $data);
				echo "<script>alert('Te has inscripto con exito!,¡Gracias!.');</script>";

 			redirect('materiasController/getMateriasInscripciones', 'refresh');
		}
	}

