use stanging_area;

select * from dataset;

use mmd;

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


