# apiChoho
## Contenido de las tablas 
1. Asesor
2. Cliente
3. Pedido
4. pedido_producto
5. producto

## Installation APP
***
$ cd /c/xampp/htdocs/
$ git clone https://github.com/CarlosCasas/apiChoho.git
$ cd apiChoho

## Installation BD
***
* Crear una base de datos  "apiprueba"
* Importar la base de datos "apiprueba.sql" que se encuentra en el repositorio


## Configuración
***
> En el archivo /inc/config.php se debe cambiar
	#define("DB_USERNAME", "root"); //Cambiar por el usuario configurado
	#define("DB_PASSWORD", ""); //Cambiar por el password configurado, si no se ha configurado dejarlo vacio
	
## Ejecutar el API con los parametros
* Se debe enviar el parametro de codigo de asesor con metodo GET al API
* Ejecutar el api por POSTMAN
	http://localhost/apiChoho/index.php/ventas/list?codigo=C001
	** Existen 3 asesor registrados en la BD para consulta
		id_asesor|codigo_asesor|name   
	---------|-------------|-------
			1|C001         |asesor1
			2|C002         |asesor2
			3|C003         |asesor3