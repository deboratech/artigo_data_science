use mmd
use stanging_area

ALTER TABLE `dataset`
ADD COLUMN `id_venda` INT;

ALTER TABLE `dataset`
ADD COLUMN `id_tempo` INT;

-- Verificando se as dimensões estão com carga
select * from dimcategoria;
select * from dimsubcategoria;
select * from dimpais;
select * from dimprioridade;
select * from dimproduto;
select * from dimregiao;
select * from dimsegmento;
select * from dimtempo;

-- Carga na tabela FatoVenda

INSERT IGNORE INTO mmd.fatovenda (`id_venda`, `id_segmento`, `id_tempo`, `id_cliente`, `id_produto`, `id_categoria`, `id_regiao`, `id_pais`, `id_prioridade`, `id_subcategoria`, `total_venda`, `quantidade_vendida`, `lucro`, `desconto`) 
SELECT 
    (ROW_NUMBER() OVER ()) AS id_venda, 
    `dataset`.`segmento`, 
    `dataset`.`id_tempo`, 
    `dataset`.`id_cliente`, 
    `dataset`.`id_produto`, 
    `dataset`.`categoria`, 
    `dataset`.`id_regiao`, 
    `dataset`.`id_pais`, 
    `dataset`.`prioridade`, 
    `dataset`.`subcategoria`, 
    `dataset`.`total_vendas`, 
    `dataset`.`quantidade`, 
    `dataset`.`lucro`, 
    `dataset`.`desconto` 
FROM `stanging_area`.`dataset`;

select * from fatovenda;




