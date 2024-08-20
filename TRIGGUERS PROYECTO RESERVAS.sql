
	CREATE OR REPLACE PROCEDURE insertar_restaurante (id_restaurante number, nombre varchar2,  id_admin number, mesasDisponibles number, mesasOcupadas number)
    IS
    BEGIN
           INSERT INTO restaurante (id_restaurante, nombre, admin_id_admin, cantidad_mesas_disp, cantidad_mesas_ocupadas) VALUES (id_restaurante, nombre, id_admin, mesasDisponibles, mesasOcupadas);
END insertar_restaurante;


insert into mesa values(20,0);




insert into producto values(25, 'Arequipe Casero', 5000, 100);

CREATE OR REPLACE PROCEDURE insertar_restaurante (id_restaurante number, nombre varchar2,id_admin number, mesasDisponibles number, mesasOcupadas number)
    IS
    BEGIN
           INSERT INTO restaurante (id_restaurante, nombre, admin_id_admin, cantidad_mesas_disp, cantidad_mesas_ocupadas) VALUES (id_restaurante, nombre, id_admin,  mesasDisponibles, mesasOcupadas) ;
END insertar_restaurante;

CREATE OR REPLACE PROCEDURE modificar_restaurante (id_restaurante  number, nombre_a VARCHAR2)
   AS 
   BEGIN
        UPDATE RESTAURANTE set NOMBRE = nombre_a WHERE ID_RESTAURANTE = id_restaurante; 
END modificar_restaurante;


create or replace procedure agregarReserva(newid_reserva number, newnombre varchar2, newcantidadmesa number, newrestaurante_id number, newtarjetacredito varchar2, newnumeromesa number, newfecha date)
is 
--declarar veriables locales
total number;
begin
total := 0;
select count(*) into total from RESERVA where ID_RESERVA = newid_reserva;

if total = 0 then
   insert into RESERVA values(newid_reserva , newnombre , newcantidadmesa , newrestaurante_id , newtarjetacredito , newnumeromesa , newfecha );
end if;


end;

--llamada
begin
agregarreserva('1', 'Daniela', '4','8765', '123456789','5','30/03/19');
agregarreserva('1', 'Daniela', '4','8765', '123456789','5','30/03/19');
commit;
end;


CREATE OR REPLACE PROCEDURE insertar_domicilio (id_domicilio number, nombrecliente varchar2,  direccion varchar2, nombre_producto varchar2, precio number, cantidad number, id_restaurante number, tarjeta_credito  varchar2, celular varchar2 )
    IS
    BEGIN    INSERT INTO domicilio (id_domicilio,  nombrecliente, direccion, nombre_producto,   precio, cantidad, restaurante_id_restaurante, tarjeta_credito_no_tarj_cred,          celular) VALUES (id_domicilio, nombrecliente, direccion, nombre_producto, precio,          cantidad, id_restaurante, tarjeta_credito, celular) ;
END insertar_domicilio;


CREATE OR REPLACE TRIGGER actualizar_mesa AFTER
    DELETE OR INSERT OR UPDATE OF mesa_no_mesa ON reserva
    FOR EACH ROW
BEGIN
    IF inserting THEN
        UPDATE mesa
        SET
            disponibilidad = 1
        WHERE
            mesa.no_mesa = :new.mesa_no_mesa;
    END IF;   
END actualizar_mesa;

CREATE OR REPLACE TRIGGER actualizar_mesa2 before
    DELETE mesa_no_mesa ON reserva
    FOR EACH ROW
BEGIN
   
        UPDATE mesa
        SET
            disponibilidad = 0
        WHERE
            mesa.no_mesa = :new.mesa_no_mesa;
       
END actualizar_mesa2;

delete from reserva where id_reserva = 7;



insert into RESERVA(TARJETA_CREDITO_NO_TARJ_CRED,RESTAURANTE_ID_RESTAURANTE,FECHA,ID_RESERVA,CANTIDAD_MESA,MESA_NO_MESA,NOMBRE) values ('123456789','8765','30/03/19','7','5','2', 'Daniela' )


