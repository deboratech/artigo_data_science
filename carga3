use mmd

-- DROP TABLE IF EXISTS DimTempo;

CREATE TABLE DimTempo (
        id_tempo            INTEGER PRIMARY KEY,  -- year*10000+month*100+day
        data                DATE NOT NULL,
        ano                 INTEGER NOT NULL,
        mes                 INTEGER NOT NULL, -- 1 to 12
        dia                 INTEGER NOT NULL, -- 1 to 31
        FinaldeSemana       CHAR(1) DEFAULT 'F' CHECK (finaldesemana in ('T', 'F'))
) Engine=InnoDB;

DELIMITER $$

CREATE PROCEDURE carga_dimensao_tempo(IN startdate DATE, IN stopdate DATE)
BEGIN
    DECLARE currentdate DATE;
    
    -- Inicializa a variável currentdate com o valor de startdate
    SET currentdate = startdate;
    
    -- Loop para inserir dados na tabela enquanto currentdate estiver entre startdate e stopdate
    WHILE currentdate <= stopdate DO
        INSERT INTO dimensao_tempo (data, dia, mes, ano)
        VALUES (
            currentdate,
            DAY(currentdate),
            MONTH(currentdate),
            YEAR(currentdate)
        );
        
        -- Incrementa a variável currentdate em um dia
        SET currentdate = DATE_ADD(currentdate, INTERVAL 1 DAY);
    END WHILE;
END$$

DELIMITER ;

select*from DimTempo;
