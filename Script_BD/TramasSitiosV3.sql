--**************************************************************
--*** BASE DE DATOS PRO_tramaSilenioV3 --10.250.6.78
--**************************************************************
USE TramassitiosV3

-- CONSULTAR TABLAS 
select * from  sys.tables order by 1 

-- CONSULTAS VARIAS 
SELECT top 10 *  FROM [dbo].[TramaProcesada] order by 1 desc 
SELECT top 10 *  FROM [dbo].[TramaEntrada] order by 1 desc 
SELECT top 10 *  FROM [dbo].[TramaSalida] order by 1 desc 
SELECT top 100 * from TramaProcesada tp where fechatramaentrada between  '2024-07-18 00:26:36.000' and '2024-09-15 21:26:36.000'   and 
--resultadoproceso not in ('El proceso se ejecuto Exitosamente.', 'Proceso ejecutado exitosamente.') and 
tramaprocesada like '%999999914%' order by FechaTramaClasificada desc



select * from [TramaSalida]

SELECT * FROM DefinicionXSD

-- CONSULTAR TRAMAS PROCESADAS 
select   * from tramaprocesada 
where fechatramaentrada between  '2024-07-20 00:26:36.000' and '2024-09-10 21:26:36.000'   
and tramaprocesada like '%<RANGO%<%' order by 1 desc 
--and tramaprocesada like '%VE<%' order by 1 desc 

select top 100  * from tramaprocesada 
where fechatramaentrada between  '2024-04-08 00:26:36.000' and '2024-09-04 21:26:36.000'   
and tramaprocesada like '%32620954%' order by 1 desc 

