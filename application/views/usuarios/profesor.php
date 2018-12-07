 <body class="login" style=" background-color: #f5f5f5;">
    <h1> Bienvenido! Que tarea desea realizar: </h1>
    <div class="btn-group" style="width:100%">
        <button style="width:33.3%"/>
        Tomar Asistencia
        </button>
        <button style="width:33.3%">
            Consultar Asistencia
        </button>
        <button style="width:33.3%">
            Modificar asistencias
        </button>
    </div>

    <script>
    	function redirect(){
    		window.location = "<?php echo base_url() ?>index.php/materiasController/getMateriasInscripciones";
    	}
    </script>
 </body>
</html>