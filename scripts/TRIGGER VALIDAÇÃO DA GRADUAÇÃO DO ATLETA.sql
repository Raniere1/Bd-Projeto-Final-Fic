DELIMITER //

CREATE TRIGGER tgr_validar_categoria_luta
BEFORE INSERT ON luta
FOR EACH ROW
BEGIN
    -- 1. DECLARAÇÃO DE VARIÁVEIS LOCAIS (TERMINAR COM ;)
    DECLARE grupo_atleta_1 INT;
    DECLARE grupo_atleta_2 INT;
    
    -- 2. DETERMINAÇÃO DO GRUPO PARA O ATLETA 1
    SELECT
        CASE g.graduacao
            -- GRUPO 1: Branca / Amarela
            WHEN 'Branca' THEN 1
            WHEN 'Amarela' THEN 1
            -- GRUPO 2: Verde / Azul / Roxa
            WHEN 'Verde' THEN 2
            WHEN 'Azul' THEN 2
            WHEN 'Roxa' THEN 2
            -- GRUPO 3: Marrom / Preta
            WHEN 'Marrom' THEN 3
            WHEN 'Preta' THEN 3
            -- GRUPO 4: Gruas Superiores
            WHEN 'Gruas Dan 1° preta com listras vermelhas' THEN 4
            WHEN '9° vermelha e branca' THEN 4
            WHEN '10° vermelha e branca' THEN 4
            ELSE 0 
        END
    INTO grupo_atleta_1
    FROM graduacao_atleta ga
    JOIN graduacao g ON g.id = ga.graduacao_id
    WHERE ga.idatleta = NEW.idatleta1
      AND ga.dthrfim IS NULL; -- Busca apenas a graduação ativa
    
    -- 3. DETERMINAÇÃO DO GRUPO PARA O ATLETA 2 (Oponente)
    SELECT
        CASE g.graduacao
            WHEN 'Branca' THEN 1 WHEN 'Amarela' THEN 1
            WHEN 'Verde' THEN 2 WHEN 'Azul' THEN 2 WHEN 'Roxa' THEN 2
            WHEN 'Marrom' THEN 3 WHEN 'Preta' THEN 3
            WHEN 'Gruas Dan 1° preta com listras vermelhas' THEN 4
            WHEN '9° vermelha e branca' THEN 4 WHEN '10° vermelha e branca' THEN 4
            ELSE 0
        END
    INTO grupo_atleta_2
    FROM graduacao_atleta ga
    JOIN graduacao g ON g.id = ga.graduacao_id
    WHERE ga.idatleta = NEW.idatleta2
      AND ga.dthrfim IS NULL;
    
    -- 4. VERIFICAÇÃO FINAL
    -- 4.1. Verifica se houve falha ao obter a graduação
    IF grupo_atleta_1 IS NULL OR grupo_atleta_2 IS NULL THEN
        SIGNAL SQLSTATE '50003' 
        SET MESSAGE_TEXT = 'ERRO: Não foi possível determinar a graduação ativa para um dos atletas.';
        
    -- 4.2. Verifica se a graduação existe, mas não foi mapeada (Caso 0)
    ELSEIF grupo_atleta_1 = 0 OR grupo_atleta_2 = 0 THEN
        SIGNAL SQLSTATE '50004' 
        SET MESSAGE_TEXT = 'ERRO: A graduação ativa de um dos atletas não está mapeada na regra de grupos do sistema.';
        
    -- 4.3. Verifica se os grupos são diferentes
    ELSEIF grupo_atleta_1 <> grupo_atleta_2 THEN
        SIGNAL SQLSTATE '50005' 
        SET MESSAGE_TEXT = 'ERRO: A luta deve ocorrer entre atletas da mesma categoria de graduação.';
    END IF;
    
END//  -- IMPORTANTE: Fechar o bloco BEGIN/END com o delimitador personalizado

DELIMITER ;