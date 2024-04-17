
---- actulizar ---

UPDATE public.productos
	SET  sw=1
	WHERE <condition>;
	
----------------------------------------


select * from productos where codigoitem='184.313'


SELECT * INTO placastornillos from productos where codigointerno='P01A01'


select * from placastornillos

----delete from placastornillos

copy placastornillos from 'C:\ORTOMAX\AGROSPRE\TABLAS\PLACASTORNILLOSu.csv' delimiter ',' csv header

select * from placastornilloslin
select * from placastornillos


-------

select * from placastornillos where codigointerno='P13N2C20'
select * from placastornilloslin where codigointerno='P13N2C20'




_______________________

create procedure USP_Buscar_articulo
@ccadena varchar(100)
as
select codigointerno,codigoitem,descripcion,cantidad
from clavostornillos where 
upper(trim(codigointerno)+trim(codigoitem)+trim(descripcion))
like '%'+upper(trim(@ccadena))+'%'
order by 1
go








