DElIMITER //
create trigger tgr_antes_insert_luta
before insert on luta
for each row 

BEGIN

	DECLARE sexo_original_1 int; 
	DECLARE sexo_original_2 int;
    
	-- consulta o primeiro registro do sexo do atleta 1
	select sa.sexoid into sexo_original_1
    from sexo_atleta sa
    where sa.idatleta = new.idatleta1
    order by sa.dthrinicio asc limit 1;

	-- consulta o primeiro registro do sexo do atleta 2
	select sa.sexoid into sexo_original_2
    from sexo_atleta sa
    where sa.idatleta = new.idatleta2
    order by sa.dthrinicio asc limit 1;

	IF sexo_original_1 is null or sexo_original_2 is null then
		signal SQLSTATE '50001' set message_text = 'ERRO: Não foi possivel determinar o sexo de registro original para um dos atletas, verifique se há registro dos dois atletas.';
    
		ELSEIF sexo_original_1 <> sexo_original_2 then
				signal SQLSTATE '50002' set message_text = 'ERRO: A luta deve ocorrer entre atletas com o mesmo sexo de registro inicial.';
	END IF;


END//
DELIMITER ;