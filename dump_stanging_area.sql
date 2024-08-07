create database stanging_area
use stanging_area

select*from dataset;

-- Desativando o modo de atualização seguro
SET SQL_SAFE_UPDATES = 0;

-- Realizando os primeiros 'updates'
UPDATE dataset
SET segmento = '1'
WHERE segmento = 'Consumidor';

UPDATE dataset
SET segmento = '2'
WHERE segmento = 'Corporativo';

UPDATE dataset
SET segmento = '3'
WHERE segmento = 'Home Office';

UPDATE dataset
SET categoria = '1'
WHERE categoria = 'Tecnologia';

UPDATE dataset
SET categoria = '2'
WHERE categoria = 'Moveis';

UPDATE dataset
SET categoria = '3'
WHERE categoria = 'Suprimentos';

UPDATE dataset
set subcategoria ='1'
where subcategoria ='Accessories';

UPDATE dataset
set subcategoria = '2'
where subcategoria = 'Phones';

UPDATE dataset
set subcategoria = '3'
where subcategoria = 'Tables';

UPDATE dataset
set subcategoria = '4'
where subcategoria = 'Appliances';

UPDATE dataset
set subcategoria = '5'
where subcategoria = 'Art';

UPDATE dataset
set subcategoria = '6'
where subcategoria = 'Binders';

UPDATE dataset
set subcategoria = '7'
where subcategoria = 'Bookcases';

UPDATE dataset
set subcategoria = '8'
where subcategoria = 'Chairs';

UPDATE dataset
set subcategoria = '9'
where subcategoria = 'Copiers';

UPDATE dataset
set subcategoria = '10'
where subcategoria = 'Envelopes';

UPDATE dataset
set subcategoria = '11'
where subcategoria = 'Fasteners';

UPDATE dataset
set subcategoria = '12'
where subcategoria = 'Furnishings';

UPDATE dataset
set subcategoria = '13'
where subcategoria = 'Labels';

UPDATE dataset
set subcategoria = '14'
where subcategoria = 'Machines';

UPDATE dataset
set subcategoria = '15'
where subcategoria = 'Paper';

UPDATE dataset
set subcategoria = '16'
where subcategoria = 'Storage';

UPDATE dataset
set subcategoria = '17'
where subcategoria = 'Supplies';

UPDATE dataset 
set prioridade = '1'
where prioridade = 'Alto';

UPDATE dataset
set prioridade = '2'
where prioridade = 'Baixo';

UPDATE dataset
set prioridade = '3'
where prioridade = 'Medio';

UPDATE dataset
set prioridade = '4'
where prioridade = 'Critico';

select * from dataset;

-- Desativando o modo de atualização seguro
SET SQL_SAFE_UPDATES = 0;

-- Atualizando as colunas "id_pais" e "id_regiao" com base nos dados das colunas "pais" e "regiao"
UPDATE dataset AS d
JOIN (
    SELECT pais, ROW_NUMBER() OVER (ORDER BY pais) AS id_pais
    FROM (SELECT DISTINCT pais FROM dataset) AS temp_pais
) AS pais ON d.pais = pais.pais
JOIN (
    SELECT regiao, ROW_NUMBER() OVER (ORDER BY regiao) AS id_regiao
    FROM (SELECT DISTINCT regiao FROM dataset) AS temp_regiao
) AS regiao ON d.regiao = regiao.regiao
SET d.id_pais = pais.id_pais,
    d.id_regiao = regiao.id_regiao;

select * from dataset;
select id_regiao from dataset where id_regiao= 313;

-- Tratando as data para foramto ano/mês/dia

UPDATE dataset
SET data_pedido = STR_TO_DATE(data_pedido, '%d-%m-%Y');










