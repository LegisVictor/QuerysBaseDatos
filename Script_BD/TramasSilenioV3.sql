--**************************************************************
--*** BASE DE DATOS PRO_tramaSilenioV3 --10.250.6.78
--**************************************************************
USE TramasSilenioV3

-- CONSULTAR TABLAS 
select * from  sys.procedures order by 1 

-- CONSULTAS VARIAS 
SELECT top 10 *  FROM [dbo].[TramaProcesada] order by 1 desc 
SELECT top 10 *  FROM [dbo].[TramaEntrada] order by 1 desc 
SELECT top 10 *  FROM [dbo].[TramaSalida] order by 1 desc 
SELECT top 100 * from TramaProcesada tp order by FechaTramaClasificada desc



SELECT * FROM DefinicionXSD

-- CONSULTAR TRAMAS PROCESADAS 
select TOP 100 fechatramaentrada, tramaprocesada, resultadoproceso, * from tramaprocesada 
--where fecharegistro between  '2025-03-21 00:26:36.000' and '2025-04-25 23:26:36.000'  
where fecharegistro between  '2026-06-29 00:26:36.000' and '2027-04-25 23:26:36.000'  
and tramaprocesada like '%>2349<%' 
--and resultadoproceso <> 'El proceso se ejecuto exitosamente.'
order by 1 desc 


-- CONSULTAR TRAMAS PROCESADAS 
select TOP 200 fechatramaentrada, tramaprocesada, resultadoproceso, * from tramaprocesada 
where fecharegistro between  '2026-09-21 00:26:36.000' and '2026-12-18 23:26:36.000'  
and tramaprocesada like '%>VE<%' 

order by 1 desc 


2460139


ProcesadorRenovacionOnLine --> InsertaActualizaCupon --> EjecutaComandoEscalar --> EjecucionGeneral -->
Column name or number of supplied values does not match table definition. | Project: ProcesadorPagosEnLineaV3.CDatosPagosEnLinea 
- Setpoint: 2. EJECUTA COMANDO - Call Method:  InsertaActualizaDetallePagosOnline(CO, 2, 1, 65, 6171185, 1, Ámbito Jurídico Maestro Abogados, 1,
Facturas Y Negocios Sas ., 659000, 677000) - Method generates an error: System.Object EjecutaComandoEscalar
(System.String, System.String, System.Data.CommandType, System.Collections.Generic.List`1[System.Data.Common.DbParameter]) |  | Project: ProcesadorPagosEnLineaV3.CProcesadorPagosEnLineaV3 - Setpoint: 1. OBTIENE NOMBRE DEL NODO PRINCIPAL - Call Method:  ProcesarTrama(<DETPAGOSONLINE><ORDEN>125136495</ORDEN><FILIAL>CO</FILIAL><EMPRESA>2</EMPRESA><REGIONAL>1</REGIONAL><TIPODOC>65</TIPODOC><NUMDOCUMENTO>6171185</NUMDOCUMENTO><NUMDETALLE>1</NUMDETALLE><CODPRODUCTO>4457</CODPRODUCTO><NOMPRODUCTO>Ámbito Jurídico Maestro Abogados</NOMPRODUCTO><CANTIDAD>1</CANTIDAD><NUMATENCION>1</NUMATENCION><USUARIO>Facturas Y Negocios Sas . </USUARIO><VALOR>659000</VALOR><PRECIOLISTA>677000</PRECIOLISTA><TIPOTRAMA>INS</TIPOTRAMA><FECHATRAMA>23/04/2025</FECHATRAMA></DETPAGOSONLINE>) - Method generates an error: Int32 InsertaActualizaDetallePagosOnline(System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.Decimal, System.Decimal) | 

<DETPAGOSONLINE><ORDEN>123092120</ORDEN><FILIAL>CO</FILIAL><EMPRESA>2</EMPRESA><REGIONAL>1</REGIONAL><TIPODOC>65</TIPODOC><NUMDOCUMENTO>2505147</NUMDOCUMENTO>
<NUMDETALLE>2</NUMDETALLE><CODPRODUCTO>3</CODPRODUCTO><NOMPRODUCTO>Regimen Del Impuesto A La Renta En Hojas Sustituibles</NOMPRODUCTO>
<CANTIDAD>1</CANTIDAD><NUMATENCION>1</NUMATENCION><USUARIO>Gerente    Francisco River  </USUARIO><VALOR>398000</VALOR>
<PRECIOLISTA>473000</PRECIOLISTA><TIPOTRAMA>INS</TIPOTRAMA><FECHATRAMA>19/03/20</FECHATRAMA></DETPAGOSONLINE>


ProcesadorRenovacionOnLine --> InsertaActualizaCupon --> EjecutaComandoEscalar --> EjecucionGeneral -->
Column name or number of supplied values does not match table definition. | Project: ProcesadorPagosEnLineaV3.CDatosPagosEnLinea .
- Setpoint: 2. EJECUTA COMANDO - 
Call Method:  
InsertaActualizaDetallePagosOnline(CO, 2, 1, 65, 6466171, 1, Regimen Laboral Bimedial Hojas  Internet, 1, Francis Liliana Rincon Guevara, 762000, 856000) 
- Method generates an error: System.Object EjecutaComandoEscalar(System.String, System.String, System.Data.CommandType, 
System.Collections.Generic.List`1[System.Data.Common.DbParameter]) |  |
Project: ProcesadorPagosEnLineaV3.CProcesadorPagosEnLineaV3 - Setpoint: 1. OBTIENE NOMBRE DEL NODO PRINCIPAL -
Call Method: 
ProcesarTrama(<DETPAGOSONLINE><ORDEN>125499913</ORDEN><FILIAL>CO</FILIAL><EMPRESA>2</EMPRESA><REGIONAL>1</REGIONAL>
<TIPODOC>65</TIPODOC><NUMDOCUMENTO>6466171</NUMDOCUMENTO><NUMDETALLE>1</NUMDETALLE><CODPRODUCTO>1392</CODPRODUCTO><NOMPRODUCTO>Regimen Laboral Bimedial Hojas 
Internet</NOMPRODUCTO><CANTIDAD>1</CANTIDAD><NUMATENCION>1</NUMATENCION><USUARIO>Francis Liliana Rincon Guevara</USUARIO><VALOR>762000</VALOR><PRECIOLISTA>856000
</PRECIOLISTA><TIPOTRAMA>INS</TIPOTRAMA><FECHATRAMA>19/03/26</FECHATRAMA></DETPAGOSONLINE>) - Method generates an error: Int32 InsertaActualizaDetallePagosOnline(System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.Decimal, System.Decimal) | 



<DETPAGOSONLINE><ORDEN>123092126</ORDEN><FILIAL>CO</FILIAL><EMPRESA>2</EMPRESA><REGIONAL>1</REGIONAL><TIPODOC>65</TIPODOC><NUMDOCUMENTO>2505188</NUMDOCUMENTO><NUMDETALLE>2</NUMDETALLE><CODPRODUCTO>5125</CODPRODUCTO><NOMPRODUCTO>Coleccion Jurisprudencia Col. Internet</NOMPRODUCTO><CANTIDAD>1</CANTIDAD><NUMATENCION>1</NUMATENCION><USUARIO>Gerencia   Dra. Adriana Muños  </USUARIO><VALOR>329000</VALOR><PRECIOLISTA>391000</PRECIOLISTA><TIPOTRAMA>INS</TIPOTRAMA><FECHATRAMA>19/03/20</FECHATRAMA></DETPAGOSONLINE>

<DETPAGOSONLINE><ORDEN>125499913</ORDEN><FILIAL>CO</FILIAL><EMPRESA>2</EMPRESA><REGIONAL>1</REGIONAL><TIPODOC>65</TIPODOC><NUMDOCUMENTO>6466171</NUMDOCUMENTO><NUMDETALLE>1</NUMDETALLE><CODPRODUCTO>1392</CODPRODUCTO><NOMPRODUCTO>Regimen Laboral Bimedial Hojas  Internet</NOMPRODUCTO><CANTIDAD>1</CANTIDAD><NUMATENCION>1</NUMATENCION><USUARIO>Francis Liliana Rincon Guevara</USUARIO><VALOR>762000</VALOR><PRECIOLISTA>856000</PRECIOLISTA><TIPOTRAMA>INS</TIPOTRAMA><FECHATRAMA>19/03/26</FECHATRAMA></DETPAGOSONLINE>


ProcesadorRenovacionOnLine --> InsertaActualizaCupon --> EjecutaComandoEscalar --> EjecucionGeneral --> 
Column name or number of supplied values does not match table definition. | Project: ProcesadorPagosEnLineaV3.CDatosPagosEnLinea -
Setpoint: 2. EJECUTA COMANDO - Call Method:  
InsertaActualizaDetallePagosOnline(CO, 2, 1, 65, 6466171, 1, Regimen Laboral Bimedial Hojas + Internet, 1, Francis Liliana Rincon Guevara, 762000, 856000) - Method generates an error: System.Object EjecutaComandoEscalar(System.String, System.String, System.Data.CommandType, System.Collections.Generic.List`1[System.Data.Common.DbParameter]) |  | Project: ProcesadorPagosEnLineaV3.CProcesadorPagosEnLineaV3 - Setpoint: 1. OBTIENE NOMBRE DEL NODO PRINCIPAL - Call Method:  ProcesarTrama(<DETPAGOSONLINE><ORDEN>125499913</ORDEN><FILIAL>CO</FILIAL><EMPRESA>2</EMPRESA><REGIONAL>1</REGIONAL><TIPODOC>65</TIPODOC><NUMDOCUMENTO>6466171</NUMDOCUMENTO><NUMDETALLE>1</NUMDETALLE><CODPRODUCTO>1392</CODPRODUCTO><NOMPRODUCTO>Regimen Laboral Bimedial Hojas + Internet</NOMPRODUCTO><CANTIDAD>1</CANTIDAD><NUMATENCION>1</NUMATENCION><USUARIO>Francis Liliana Rincon Guevara</USUARIO><VALOR>762000</VALOR><PRECIOLISTA>856000</PRECIOLISTA><TIPOTRAMA>INS</TIPOTRAMA><FECHATRAMA>19/03/26</FECHATRAMA></DETPAGOSONLINE>) - Method generates an error: Int32 InsertaActualizaDetallePagosOnline(System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.Decimal, System.Decimal) | 



