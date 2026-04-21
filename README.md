# send_mail
This is a procedure to send mail from Oracle database.

Enviar correo desde Oracle

Accede al siguiente directorio

cd $ORACLE_HOME/rdbms/admin

Exportar varibles de entorno

	export ORACLE_SID=test
	
	export ORACLE_HOME=/u01/app/oracle/product/12.2.0/dbhome_1/

Conectarse por sqlplus

sqlplus /nolog

connect / as sysdba

Ejecutar los siguiente ficheros

	SQL> @utlmail.sql
	
	SQL> @utlsmtp.sql
	
	SQL> @prvtmail.plb
	
Otorgar permisos al usuario que va a enviar correo

	grant create procedure to test
	
	grant create job to test
	
Crear paquete para multiples recipientes

	Nota: Acceder al directorio anterior (cd $ORACLE_HOME/rdbms/admin) y copiar el script del paquete y luego ejecutarlo
	
	SQL> @string_api.sql

Conectarse por el usuario que va a enviar los correos

	sqlplus /nolog
	connect username/password@cadena_tnsnames

Cargar script

	SQL> @prvtmail.plb

Crear procedimientos y schedule job
  Crear ACLs: create_acls
  
  Crear procedimiento para enviar correos HTML: send_mail.prc
  
  Crear procedimiento para llamar al procedimiento que envía los correos y devolver la salida en formato html: call_send_mail.prc
  
  Crear scheduled job para enviar los correos: SJ_CALL_SEND_MAIL
  
