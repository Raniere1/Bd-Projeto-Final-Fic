DELIMITER //

CREATE PROCEDURE promover_atleta (
    IN p_idatleta INT, 
    IN p_nova_graduacao_id INT 
)
BEGIN
    -- Variável para a data de encerramento do registro antigo
    DECLARE p_data_fim DATETIME DEFAULT NOW(); 
    
    -- 1. ENCERRA O REGISTRO DE GRADUAÇÃO ATUAL
    -- Atualiza a data/hora de fim (dthrfim) para a graduação que está ativa (dthrfim IS NULL)
    UPDATE graduacao_atleta
    SET dthrfim = p_data_fim
    WHERE idatleta = p_idatleta
      AND dthrfim IS NULL;
      
    -- Verifica se algum registro foi encerrado (opcional: checagem de erro)
    
    -- 2. INSERE O NOVO REGISTRO DE GRADUAÇÃO ATIVA
    INSERT INTO graduacao_atleta (
        idatleta, 
        graduacao_id, 
        dtiniicio, 
        dthrfim
    )
    VALUES (
        p_idatleta, 
        p_nova_graduacao_id, 
        p_data_fim, -- A nova faixa começa na mesma hora que a antiga terminou
        NULL        -- NULL indica que esta é a faixa ATIVA atualmente
    );

END //

DELIMITER ;