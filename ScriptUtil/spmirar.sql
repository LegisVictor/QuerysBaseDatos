SELECT 
    p.name,
    m.definition
FROM sys.procedures p
JOIN sys.sql_modules m 
    ON p.object_id = m.object_id
WHERE p.name = 'InsertaActualizaDetallePagosOnline';


SELECT *
FROM sys.objects
WHERE name = 'InsertaActualizaDetallePagosOnline';


SELECT 
    p.name AS parametro,
    t.name AS tipo,
    p.max_length,
    p.is_output
FROM sys.parameters p
JOIN sys.types t 
    ON p.user_type_id = t.user_type_id
WHERE p.object_id = OBJECT_ID('InsertaActualizaDetallePagosOnline');


InsertaActualizaDetallePagosOnline(CO, 2, 1, 65, 6466171, 1, Regimen Laboral Bimedial Hojas  Internet,

1, Francis Liliana Rincon Guevara, 

762000, 856000) 