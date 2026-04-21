BEGIN
  DBMS_NETWORK_ACL_ADMIN.create_acl (
    acl          => 'test_email.xml', 
    description  => 'Email for test',
    principal    => 'test',
    is_grant     => TRUE, 
    privilege    => 'connect',
    start_date   => SYSTIMESTAMP,
    end_date     => NULL);

  COMMIT;
END;
/

BEGIN
  DBMS_NETWORK_ACL_ADMIN.assign_acl (
    acl => 'test_email.xml',
    host => '10.10.10.10', 
    lower_port => 25,
    upper_port => 25); 
  COMMIT;
END;
/