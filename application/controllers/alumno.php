<?php
defined('BASEPATH') OR exit('No direct script access allowed');
	class Alumno extends CI_Controller
	{ 
		public function __construct(){
			parent::__construct();
		}

		//verifico que el usuario haya iniciado sesion (solo puedo entrar al metodo userdata si ese valor es true)

		public function logueado(){
			if($this->session->userdata('logueado') && $this->session->userdata('id_rol') == 2)
			{
				$data = array();
				$data['mail'] = $this->session->userdata('mail');
				$data['anio'] = $this->getYear();
				$this->load->view ('templates/header');
				$this->load->view ('usuarios/alumnoLogueado', $data);
			} else {
				redirect('usuarios/iniciar_sesion');
			}			
	}

		public function getYear()
		{
			$m = new \DateTime();
			$m = $m->format('m');
			$anioActual = new \DateTime();
			$anioActual = $anioActual->format('Y');
			if($m >= 1 && $m < 4 ){
				return $anioActual;	
				}else{
					return $anioActual + 1;
				}
			}	
	}