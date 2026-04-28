select distinct a1.nome, a2.nome, ac1.nome, ac2.nome, l.vencedor
from luta l 
inner join atleta a1 on a1.id = l.idatleta1
join atleta a2 on a2.id = l.idatleta2
join academia_atleta aca1 on aca1.atletaid = a1.id
join academia ac1 ON ac1.id = aca1.academiaid
join academia_atleta aca2 ON aca2.atletaid = a2.id
join academia ac2 ON ac2.id = aca2.academiaid;

select (
	select count(*) 
    from atleta a_sub
		join sexo_atleta sa_sub ON sa_sub.atletaid = a_sub.id
        INNER JOIN sexo s_sub ON s_sub.id = sa_sub.sexoid
        WHERE s_sub.id = 2
) as total_atleta,
a.nome, a.id, s.sexo
from atleta a 
inner join sexo_atleta sa on sa.atletaid = a.id
inner join sexo s on s.id = sa.sexoid
where sa.id is not null and s.id = 2
group by a.id, a.nome, s.sexo;

-- create view atleta_mestre as 
select a.nome, m.matricula
from atleta a 
join mestre m on m.idatleta = a.id
where m.idatleta = a.id;