 	<body>
 	<!-- armamos un foreach que nos trae la descripcion de la tabla materias y lo ponemos en una tabla -->
 	<h2 style="text-align: center;">INSCRIPCION A CICLO LECTIVO <?php echo $anio_cursado?>
 	</h2> <br>
    <table class="table table-hover">
    	<thead class="thead-dark">
    		<tr>
    			<th>Materia</th>
    			<th>Carrera</th>
    			<th>Curso</th>
    			<th>Division</th>
    			<th>Docente</th>
    			<th>Inscripcion <?php echo $anio_cursado?></th>
    		</tr>
    	</thead>
    	<tbody>
    	  <?php foreach ($materiasArray as $unaMateria): ?>
				<tr>
    				<th scope="row">
    					<?php 
  	  					echo $unaMateria['descripcion'];
    					?>
    				</th>
    				</td>
    				<td>
    					<?php 
  	  					echo $unaMateria['nombreCarrera'];
    					?>
    				</td>
    				<td>
    					<?php 
  	  					echo $unaMateria['curso'];
    					?>
    				</td>
    				<td>
    					<?php 
  	  					echo $unaMateria['division'];
    					?>
    				</td>
    				    				<td>
    					<?php 
  	  					echo $unaMateria['apellidoDocente'];
    					?>
    				</td>
    				<td>
    					<input type="button" class="btn btn-primary" name="btnInscribirseAMateria" value="Inscribirse" onclick="inscribirseAMateria(<?php 
  	  					echo $unaMateria['id_materia'];
    					?>)">
    				</td>
    			</tr>
		
		<?php endforeach ?>

    	</tbody>
    </table>
 </body>
</html>
<script type="text/javascript">
	function inscribirseAMateria(idMateria){
		window.location= "<?php echo base_url() ?>index.php/materiasController/inscribirseAMateria/" + idMateria;
	}
</script>
