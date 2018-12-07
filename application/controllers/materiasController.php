<?php
defined('BASEPATH') OR exit('No direct script access allowed');
	class MateriasController extends CI_Controller
	{ 
		public function __construct(){
			parent::__construct();
		}

		//verifico que el usuario haya iniciado sesion (solo puedo entrar al metodo userdata si ese valor es true)

		public function getMateriasInscripciones()
		{
			if($this->session->userdata('logueado') && $this->session->userdata('id_rol') == 2) { 
				$year = $this->getYear();
				$data = array();
				$this->load->model('materias_model');
				$data['id'] = $this->session->userdata('id');
				$data['anio_cursado'] = $year;
				$data['materiasArray'] =$this->materias_model->getMateriasInscripcionesModel($this->session->userdata('idAlumno'),$data['anio_cursado'] );
				$this->load->view ('templates/header');
				$this->load->view ('usuarios/tablaMaterias', $data);
				$this->load->view ('templates/footer');
			} else {
				redirect('usuarios/iniciar_sesion');
			}	
		}
		public function inscribirseAMateria($idMat)
		{
			if($this->session->userdata('logueado') && $this->session->userdata('id_rol') == 2)
			{
				$this->load->model('materias_model');
				$this->materias_model->inscribirseAMateria($this->session->userdata('idAlumno'), $idMat,$this->getYear());
				$this->getMateriasInscripciones();
			} else {
				redirect('usuarios/iniciar_sesion');
			}	
		}
			public function getYear(){
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
	