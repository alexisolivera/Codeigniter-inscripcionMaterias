<?php

	class Usuarios extends CI_Controller
	{ 
		public function __construct(){
			parent::__construct();
		}
		// cargo la vista para iniciar sesion
		public function iniciar_sesion(){
			$data = array();
			$data['error'] = $this->session->flashdata('error');
			$this->load->view('templates/headerLogin');
			$this->load->view('usuarios/iniciar_sesion', $data);
			$this->load->view('templates/footer');
		}

		//recibo los datos que envie por el formulario mail y clave
		public function iniciar_sesion_post()
		{
			if ($this->input->post()) 
			{
				$mail = $this->input->post('mail');
				$clave = md5($this->input->post('clave'));
				$this->load->model('usuario_model');
		// verifico que los datos sean correctos, si es correcto creo la sesion con del metodo set_userdata
				$usuario = $this->usuario_model->usuario_por_mail_clave($mail, $clave);
				$idAlumnoRow = $this->usuario_model->getIdAlumno($usuario->id);
				if ($usuario) {
					$usuario_data = array(
						'id' => $usuario->id,
						'mail' => $usuario->mail,
						'id_rol' => $usuario->id_rol,
						'logueado' => TRUE,
						'idAlumno' => $idAlumnoRow
					);
					$this->session->set_userdata($usuario_data);
		// redirecciono a logueado
					if ($usuario->id_rol ==2) {
						redirect('alumno/logueado');
					}else{
						redirect('usuarios/profesor');
					}
					
				}else {
					$this->session->set_flashdata('error', 'El usuario y/o la contraseña son incorrectos');
					redirect('usuarios/iniciar_sesion');
						}
			} else {
					$this->iniciar_sesion();				
						}
		}
		
		public function cerrar_sesion(){
			$usuario_data = array (
				'logueado' => FALSE 
			);
			$this->session->set_userdata($usuario_data);
			redirect('usuarios/iniciar_sesion');
		}
		public function profesor()
			{
			if ($this->session->userdata('logueado') && $this->session->userdata('id_rol') ==1) {
				$this->load->view('templates/headerProfesor');
				$this->load->view('usuarios/profesor');
			}else {
				redirect('usuarios/iniciar_sesion');}
			}
		}
	