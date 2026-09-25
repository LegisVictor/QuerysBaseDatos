-- ****************************************************************************************************
-- RESERVADO INSERTAR MANUALMENTE. 
-- ****************************************************************************************************
DECLARE
	REFCONTENT VARCHAR2(128) := 'laboral';
	-- El rango de reservados se insertará despues de este parrafo:
	REFPAR VARCHAR2(128) := 'xlaboral.dc927e2649eb4bd7b96457e226859d5d';
	-- Codigo interno desde que empezará el rango
	REFNUM1 NUMBER := 5441;
	-- Codigo interno con el que finalizará el rango
	REFNUM2 NUMBER := 5445;

	-- Flag de autodetección de rango
	AUTODETECTRANGE NUMBER := 0;
	GENERATEDGUID   VARCHAR2(128);
BEGIN
	-- Autodetectar rango de códigos internos deacuerdo a la ubicación del párrafo referencia
	IF AUTODETECTRANGE = 1 THEN
	
		SELECT VALOR0
			INTO REFNUM2
			FROM CONTENIDOCODIGOINTERNO
		 WHERE IDPARRAFO =
					 (SELECT ID
							FROM (SELECT ID
											 FROM CONTENIDOPARRAFO CP
											WHERE CP.FLAGCODIGOINTERNO = 1 AND CP.FLAGBORRADO = 0 AND
														CP.IDCONTENIDO = REFCONTENT
											START WITH CP.ID = REFPAR
										 CONNECT BY CP.ID = PRIOR CP.IDSIGUIENTE AND LEVEL < 50)
						 WHERE ROWNUM = 1);
		REFNUM2 := REFNUM2 - 1;
	
		SELECT VALOR0
			INTO REFNUM1
			FROM CONTENIDOCODIGOINTERNO
		 WHERE IDPARRAFO =
					 (SELECT ID
							FROM (SELECT ID
											 FROM CONTENIDOPARRAFO CP
											WHERE CP.FLAGCODIGOINTERNO = 1 AND CP.FLAGBORRADO = 0 AND
														CP.IDCONTENIDO = REFCONTENT
											START WITH CP.ID = REFPAR
										 CONNECT BY CP.ID = PRIOR CP.IDANTERIOR AND LEVEL < 50)
						 WHERE ROWNUM = 1);
		REFNUM1 := REFNUM1 + 1;
	
	END IF;

	SPAGREGARRANGORESERVADO(REFCONTENT, REFPAR, 1, 1, -1, GENERATEDGUID);

	UPDATE CONTENIDOCODIGOINTERNO
		 SET VALOR0 = REFNUM1, VALOR1 = REFNUM2
	 WHERE IDPARRAFO = GENERATEDGUID;

END;


-- ****************************************************************************************************
-- RESERVADO ELIMINAR MANUALMENTE. 
-- ****************************************************************************************************
-- PRIMERO CONSULTAMOS EN AMBAS TABLAS.


SELECT * FROM CONTENIDOCODIGOINTERNO WHERE IDCONTENIDO  = 'REFORMALABORAL'
AND idparrafo IN ( 'xREFORMALABORAL.41c67a6030da0196e0630a010182a69d',
'xREFORMALABORAL.41c3363d60f801dae0630a0101826cb1'); 
			
SELECT * FROM CONTENIDOPARRAFO WHERE id IN (

'xlaboral.d1cc6e30ab6a485eb306a05cb55791ee'
)

--  SEGUNDO ELIMINARMOS LOS REGISTROS DEL CODIGO INTERNO. Y ACTUALIZAMOS EN CONTENIDOPARRAFO

DELETE FROM CONTENIDOCODIGOINTERNO 
WHERE IDCONTENIDO  = 'carlva'
AND idparrafo IN ( 'xcarlva.2c63f491c75701d4e0630a0101826224'); 

-- TERCERO ACTUALIZAMOS 
UPDATE CONTENIDOPARRAFO SET xml = REPLACE(xml, '<Reservados id="41c3363d60fb01dae0630a0101826cb1">[§ 0037 a 0039] Reservados.</Reservados>','') WHERE id IN (

'xcarlva.2c63f491c75701d4e0630a0101826224'
); 
			
-- ****************************************************************************************************
-- RESERVADO CORREGIR MANUALMENTE. 
-- ****************************************************************************************************

-- SE BUSCA EL RANGO DEL RESERVADO QUE SE QUIERE CORREGIR. 
SELECT * FROM CONTENIDOCODIGOINTERNO WHERE IDCONTENIDO  = 'laboral' AND 
id ='xlaboral.d1cc6e30ab6a485eb306a05cb55791ee' AND valor0 >= 14405

-- SEGUNDO CON EL ID SE VERIFICA BIEN EL REGISTRO. 
SELECT * FROM CONTENIDOCODIGOINTERNO WHERE IDCONTENIDO  = 'ventas' and
id='e2c0f5c4e15f0130e0530a01018221a4' AND rownum <=  25 
ORDER BY VALOR0  desc 

-- TERCERO CON LA CONSULTA ANTERIOR SE HACE EL UPDATE Y SE CORRIGE EL VALOR.  
UPDATE CONTENIDOCODIGOINTERNO SET VALOR0 = 5446 WHERE IDCONTENIDO  = 'laboral' and  id='d3302006dcd14e8dabf14215c9494e5d'; 


SELECT valor0, VALOR1, id  FROM CONTENIDOCODIGOINTERNO WHERE IDCONTENIDO  = 'estatuto' AND valor0 >= 14405


-- actualizamos el parrafo 
SELECT * FROM CONTENIDOPARRAFO WHERE id IN (

'xlaboral.d1cc6e30ab6a485eb306a05cb55791ee'
)



UPDATE CONTENIDOCODIGOINTERNO SET VALOR0 =4330WHERE IDCONTENIDO = 'laboral' AND id = '6904164eead84683bfcee33afaa8120e'


UPDATE CONTENIDOCODIGOINTERNO SET IDPARRAFO = 'xJEP.97c06082d49c40fdb0e3372dd19da412' WHERE IDCONTENIDO  = 'JEP'
AND ID IN  ( '239f52eff3e60154e0630a0101821284'); 


UPDATE CONTENIDOPARRAFO SET estilo = 'reservado', grupo='ND', flagreagrupar= 1, flagcodigointerno=1, flagdisponible=1, flagsistema=1
WHERE id IN ('xfinancie.55173a62264001b2e0630a01018250f2'); 



UPDATE CONTENIDOPARRAFO SET estilo = 'cuerpo', grupo='ND', flagreagrupar= 0, flagcodigointerno=0, flagdisponible=1, flagsistema=0
WHERE id IN ('xfinancie.55173a62264001b2e0630a01018250f2'); 

















	  SELECT IDCONTENIDO, id, IDANTERIOR , IDSIGUIENTE ,  ordinal, XML  FROM CONTENIDOPARRAFO c 
	  WHERE c.IDCONTENIDO  = 'laboral'
AND ordinal 
BETWEEN 2107700 AND 2107900
ORDER BY ordinal asc 



-- PARRAFO BETWEEN 1727200 AND 1727600
update contenidoparrafo set 
idanterior = 'xlaboral.d82c69b3226a4da58ec0880daa84e354', 
idsiguiente = 'xlaboral.97fc2338cf1a4c24b2c1408421d75148' -- CAMBIAR 
where IDCONTENIDO = 'laboral' and  id = 'xlaboral.185a1e05de0841bb83a268cd74ae1f0c';


-- bueno
update contenidoparrafo set 
idanterior = 'xlaboral.f92ce62c0c9e49f1a81d5f0195a5b48f', -- CAMBIAR
idsiguiente = 'xlaboral.9e44daf4fd8a4a94822cb6c227dff97b' 
where IDCONTENIDO = 'laboral' and  id = 'xlaboral.c006310d74804346bb7269d0d6acabe6';



-- BETWEEN 1902400 AND 1902600
-- bueno 
update contenidoparrafo set 
idanterior = 'xlaboral.ad3c3939b9c645389129c0a212120558', 
idsiguiente = 'xlaboral.2604fd0ae47547faa91a96e15f8ab153' -- CAMBIAR
where IDCONTENIDO = 'laboral' and  id = 'xlaboral.c4f8bd7ce02f493c801f2cb415db3e43';


-- bueno 
update contenidoparrafo set 
idanterior = 'xlaboral.185a1e05de0841bb83a268cd74ae1f0c', -- CAMBIAR
idsiguiente = 'xlaboral.5ef79166ef8d4b6497e83ed17fb846e0' 
where IDCONTENIDO = 'laboral' and  id = 'xlaboral.97fc2338cf1a4c24b2c1408421d75148';




--  BETWEEN 2107700 AND 2107900 --- BUENO 
update contenidoparrafo set 
idanterior = 'xlaboral.c679f9a91fc341c086b665bac8397a46', 
idsiguiente = 'xlaboral.c006310d74804346bb7269d0d6acabe6' -- CAMBIAR 
where IDCONTENIDO = 'laboral' and  id = 'xlaboral.f92ce62c0c9e49f1a81d5f0195a5b48f';



update contenidoparrafo set 
idanterior = 'xlaboral.c4f8bd7ce02f493c801f2cb415db3e43', -- CAMBIAR
idsiguiente = 'xlaboral.054a6a74294c4658a236b51372095d69' 
where IDCONTENIDO = 'laboral' and  id = 'xlaboral.2604fd0ae47547faa91a96e15f8ab153';







-- AJUSTAR

UPDATE CONTENIDOCODIGOINTERNO SET VALOR0 =5206, VALOR1= 5211 WHERE IDCONTENIDO  = 'laboral' and id='4e54079fa135014ce0630a010182d18e'; 


DELETE FROM   CONTENIDOCODIGOINTERNO  WHERE IDCONTENIDO  = 'financie' AND ID IN  ( '5517ac39519b01e2e0630a0101827af9'); 
UPDATE  CONTENIDOCODIGOINTERNO  SET IDANTERIOR = '62151274ad87455bbc1fecd5b054e1cb' WHERE IDCONTENIDO  = 'financie' AND ID IN ( 'bc1961879e33011ee0530a010182fd43'); 
UPDATE  CONTENIDOCODIGOINTERNO  SET IDsiguiente  = 'bc1961879e33011ee0530a010182fd43' WHERE IDCONTENIDO  = 'financie' AND ID IN ( '62151274ad87455bbc1fecd5b054e1cb'); 

begin
SPCUSER.SPRECODIFICAROBRA('JEP'); 
end;