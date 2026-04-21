CREATE OR REPLACE PROCEDURE test.call_send_mail as
  l_html VARCHAR2(32767);
  dateVar varchar(20);
  operations varchar(20);
  max_date varchar(10);
BEGIN
    
    select count(*) into operations from test.operations where upload_date = trunc(sysdate-1);

    if operations >0 then
    select upload_date into dateVar from test.operations  where upload_date = trunc(sysdate-1) and rownum=1;
  l_html := '<html>
    <head>
      <title>Testing</title>
    </head>
    <body>
      <p>Cantidad de operaciones recibidas.</p>
      <table border="1"> 
	<tr><th> Fecha </th> <th> Operaciones </th> </tr>
	<tr><th> ' ||dateVar||' </th> <th> ' ||operaciones||' </th> </tr>
	
	</table>
    </body>
  </html>';    
  else
     select max(upload_date) into max_date from test.operations;
    l_html := '<html>
    <head>
      <title>Testing</title>
    </head>
    <body>
      <p>No se han recibido operaciones desde el ' ||max_date||'.</p>      
    </body>
  </html>';
  end if;
    
   test.send_mail(p_to  => 'test1@gmail.com',
            p_cc        => 'test@gmail.com',
            p_bcc       => '',
            p_from      => 'test@gmail.com',
            p_subject   => 'Transfermovil',
            p_message  => 'Cantidad de operaciones recibidas.' ||dateVar||'',
            p_html_msg  => l_html,
            p_smtp_host => '127.0.0.1');
END;
/