
use stanging_area;

select * from dataset;

use mmd;

SET SQL_SAFE_UPDATES = 0;

SET @counter := 0;

UPDATE dataset
SET id_cliente = @counter := @counter + 1
WHERE id_cliente IS NULL;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE dataset
MODIFY COLUMN id_cliente INT AUTO_INCREMENT PRIMARY KEY;

SET SQL_SAFE_UPDATES = 0;

SET @counter := 0;

UPDATE dataset
SET id_produto = @counter := @counter + 1
WHERE id_produto IS NULL;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE dataset
MODIFY COLUMN id_produto INT AUTO_INCREMENT PRIMARY KEY;

use stanging_area;

select * from dataset;

use mmd;

INSERT IGNORE INTO mmd.dimcliente (id_cliente)
SELECT id_cliente FROM stanging_area.dataset;

INSERT INTO mmd.dimcliente (id_cliente)
SELECT id_cliente FROM stanging_area.dataset
ON DUPLICATE KEY UPDATE id_cliente = dataset.id_cliente;

select * from dimcliente;

INSERT IGNORE INTO mmd.dimproduto (id_produto)
SELECT id_produto FROM stanging_area.dataset;

INSERT INTO mmd.dimproduto (id_produto)
SELECT id_produto FROM stanging_area.dataset
ON DUPLICATE KEY UPDATE id_produto = dataset.id_produto;

select*from dimproduto;


