USE mysql;

-- CREATE USER admin_super Y ASIGNARLE PRIVILEGIOS
DROP USER IF EXISTS 'admin_super'@'%';
CREATE USER 'admin_super'@'%' IDENTIFIED BY '1111';
GRANT ALL PRIVILEGES ON control_inventario.* TO 'admin_super'@'%' WITH GRANT OPTION;


USE control_inventario;

-- CREACIÓN DE ROLES
DROP ROLE IF EXISTS role_gerencia_administracion;
CREATE ROLE role_gerencia_administracion;

DROP ROLE IF EXISTS role_jefe_almacen;
CREATE ROLE role_jefe_almacen;

DROP ROLE IF EXISTS role_encargado_almacen;
CREATE ROLE role_encargado_almacen;


-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_gerencia_administracion
GRANT SELECT ON control_inventario.vw_1_informe_inventario TO role_gerencia_administracion;
GRANT SELECT ON control_inventario.vw_2_valor_inventario TO role_gerencia_administracion;
GRANT SELECT ON control_inventario.vw_3_valor_total_inventario TO role_gerencia_administracion;
GRANT SELECT ON control_inventario.vw_4_productos_inventario TO role_gerencia_administracion;
GRANT SELECT ON control_inventario.vw_5_entradas_productos TO role_gerencia_administracion;
GRANT SELECT ON control_inventario.vw_6_salidas_productos TO role_gerencia_administracion;

-- SHOW GRANTS FOR role_gerencia_administracion;
-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM role_gerencia_administracion;


-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_jefe_almacen
GRANT ALL PRIVILEGES ON control_inventario.* TO role_jefe_almacen;

-- SHOW GRANTS FOR role_jefe_almacen;
-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM role_jefe_almacen;


-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_encargado_almacen
GRANT INSERT (inventario_inicial), UPDATE (inventario_inicial), SELECT (inventario_inicial) ON control_inventario.inventario TO role_encargado_almacen;
GRANT INSERT, UPDATE, SELECT ON control_inventario.productos TO role_encargado_almacen;
GRANT INSERT, UPDATE, SELECT ON control_inventario.entradas TO role_encargado_almacen;
GRANT INSERT, UPDATE, SELECT ON control_inventario.detalle_entradas TO role_encargado_almacen;
GRANT INSERT, UPDATE, SELECT ON control_inventario.salidas TO role_encargado_almacen;
GRANT INSERT, UPDATE, SELECT ON control_inventario.detalle_salidas TO role_encargado_almacen;

-- SHOW GRANTS FOR role_encargado_almacen;
-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM role_encargado_almacen;


-- CREACIÓN DE USUARIOS Y ASIGNACIÓN A ROLES
DROP USER IF EXISTS 'powell.saill'@'%';
CREATE USER 'powell.saill'@'%' IDENTIFIED BY 'gerente01';
GRANT role_gerencia_administracion TO 'powell.saill'@'%';
SET DEFAULT ROLE ALL TO 'powell.saill'@'%';
-- SHOW GRANTS FOR 'powell.saill'@'%';

DROP USER IF EXISTS 'agnese.ouslem'@'%';
CREATE USER 'agnese.ouslem'@'%' IDENTIFIED BY 'administracion02';
GRANT role_gerencia_administracion TO 'agnese.ouslem'@'%';
SET DEFAULT ROLE ALL TO 'agnese.ouslem'@'%';
-- SHOW GRANTS FOR 'agnese.ouslem'@'%';

DROP USER IF EXISTS 'genvieve.segebrecht'@'%';
CREATE USER 'genvieve.segebrecht'@'%' IDENTIFIED BY 'jefealmacen09';
GRANT role_jefe_almacen TO 'genvieve.segebrecht'@'%';
SET DEFAULT ROLE ALL TO 'genvieve.segebrecht'@'%';
-- SHOW GRANTS FOR 'genvieve.segebrecht'@'%';

DROP USER IF EXISTS 'lavinie.perkis'@'%';
CREATE USER 'lavinie.perkis'@'%' IDENTIFIED BY 'encargado10';
GRANT role_encargado_almacen TO 'lavinie.perkis'@'%';
SET DEFAULT ROLE ALL TO 'lavinie.perkis'@'%';
-- SHOW GRANTS FOR 'lavinie.perkis'@'%';

DROP USER IF EXISTS 'garrick.warden'@'%';
CREATE USER 'garrick.warden'@'%' IDENTIFIED BY 'encargado11';
GRANT role_encargado_almacen TO 'garrick.warden'@'%';
SET DEFAULT ROLE ALL TO 'garrick.warden'@'%';
-- SHOW GRANTS FOR 'garrick.warden'@'%';

DROP USER IF EXISTS 'guntar.piccop'@'%';
CREATE USER 'guntar.piccop'@'%' IDENTIFIED BY 'encargado12';
GRANT role_encargado_almacen TO 'guntar.piccop'@'%';
SET DEFAULT ROLE ALL TO 'guntar.piccop'@'%';
-- SHOW GRANTS FOR 'guntar.piccop'@'%';

DROP USER IF EXISTS 'christopher.pechell'@'%';
CREATE USER 'christopher.pechell'@'%' IDENTIFIED BY 'encargado13';
GRANT role_encargado_almacen TO 'christopher.pechell'@'%';
SET DEFAULT ROLE ALL TO 'christopher.pechell'@'%';
-- SHOW GRANTS FOR 'christopher.pechell'@'%';

-- USE mysql;
-- SHOW tables;
-- SELECT * FROM user;


