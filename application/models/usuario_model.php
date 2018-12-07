<?php 
	class Usuario_model extends Ci_Model
	{
		
		function __construct()
		{
			parent::__construct();
		}
		// Creo un objeto usuario, dependiendo si el mail y la clave coinciden en la BD.
		public function usuario_por_mail_clave($mail, $clave){
			$this->db->select('id, mail, id_rol');
			$this->db->from('usuarios');
			$this->db->where('mail', $mail);
			$this->db->where('clave', $clave);

			// con el metodo get, obtengo la consulta, y despues el metodo row me devuelve la unica fila que coincide con los datos. 
			$consulta = $this->db->get();
			$resultado = $consulta->row();
			return $resultado;
		}
		public function getIdAlumno($idUsuario){
			$this->db->select('id');
			$this->db->from('alumnos');
			$this->db->where('id_usuario', $idUsuario);
			$consulta = $this->db->get();
			$resultado = $consulta->row()->id;
			return $resultado;
		}
	}

