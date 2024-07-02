use stanging_area;

select * from dataset;

use mmd;


INSERT IGNORE INTO mmd.dimpais (id_pais)
SELECT id_pais FROM stanging_area.dataset;

INSERT INTO mmd.dimpais (id_pais)
SELECT id_pais FROM stanging_area.dataset
ON DUPLICATE KEY UPDATE id_pais = dataset.id_pais;

select * from dimpais;

INSERT IGNORE INTO mmd.dimcategoria (id_categoria)
SELECT categoria FROM stanging_area.dataset;

INSERT INTO mmd.dimcategoria (id_categoria)
SELECT categoria FROM stanging_area.dataset
ON DUPLICATE KEY UPDATE id_categoria = dataset.categoria;

select*from dimcategoria

INSERT IGNORE INTO mmd.dimsubcategoria (id_subcategoria)
SELECT subcategoria FROM stanging_area.dataset;

INSERT INTO mmd.dimsubcategoria (id_subcategoria)
SELECT subcategoria FROM stanging_area.dataset
ON DUPLICATE KEY UPDATE id_subcategoria = dataset.subcategoria;

select * from dimsubcategoria;

INSERT IGNORE INTO mmd.dimsegmento (id_segmento)
SELECT segmento FROM stanging_area.dataset;

INSERT INTO mmd.dimsegmento (id_segmento)
SELECT segmento FROM stanging_area.dataset
ON DUPLICATE KEY UPDATE id_segmento = dataset.segmento;

select*from dimsegmento

INSERT IGNORE INTO mmd.dimprioridade (id_prioridade)
SELECT prioridade FROM stanging_area.dataset;

INSERT INTO mmd.dimprioridade (id_prioridade)
SELECT prioridade FROM stanging_area.dataset
ON DUPLICATE KEY UPDATE id_prioridade = dataset.prioridade;

select*from dimprioridade

INSERT IGNORE INTO mmd.dimregiao (id_regiao)
SELECT id_regiao FROM stanging_area.dataset;

INSERT INTO mmd.dimregiao (id_regiao)
SELECT id_regiao FROM stanging_area.dataset
ON DUPLICATE KEY UPDATE id_regiao = dataset.id_regiao;

select * from dimregiao;