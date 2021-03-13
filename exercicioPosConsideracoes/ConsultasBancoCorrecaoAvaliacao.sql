USE correcao_avaliacao;
GO

-- 6
--A Obter todas as linhas atendidas por uma determinada empresa, dado o nome dessa empresa.
SELECT e.nome AS EMPRESA, l.nome AS Nome_Linha, l.codLinha
FROM Linha AS l
JOIN Empresa_Linha AS le ON l.codLinha = le.codLinha
JOIN Empresa AS e ON le.cnpj = e.cnpj
WHERE e.nome = 'Viação Paraty'
--WHERE e.nome = 'Empresa Cruz'
ORDER BY l.nome	;

--B Obter o itinerário de uma determinada linha de ônibus, dado o Nome (Identificação) dessa linha. 
SELECT l.nome AS Linha, it.sentido, CONCAT(it.sequencia, ' - ', logr.nome) AS Paradas
FROM Linha_Logradouro AS it
JOIN Logradouro AS logr ON logr.codLogradouro = it.codLogradouro
JOIN Linha AS l ON l.codLinha = it.codLinha
WHERE l.nome = 'Atacadão / Centro'
--WHERE l.nome = 'Águas do Paiol / Terminal (TCI)'
ORDER BY it.sequencia;


--C Obter o quadro de horário de uma determinada linha, dado seu Nome.
SELECT l.nome AS Linha, h.diaSemana, FORMAT(CAST(h.horaSaida as time), N'hh\:mm') AS HoraSaida
FROM Horario AS h
JOIN Quadro_Horario AS qh ON h.codQuadroHr = qh.codQuadroHr
JOIN Linha AS l ON l.codQuadroHr = qh.codQuadroHr
WHERE l.nome = 'Águas do Paiol / Terminal (TCI)'
--WHERE l.nome = 'Atacadão / Centro'
GROUP BY h.horaSaida, h.diaSemana, l.nome
ORDER BY h.diaSemana,  h.horaSaida

--D Obter as linhas de ônibus/empresa que passam por um determinado logradouro, dado o nome desse logradouro.
SELECT DISTINCT l.nome As Linha, e.nome AS Empresa
FROM Linha AS l
JOIN Linha_Logradouro AS it ON it.codLinha = l.codLinha
JOIN Logradouro AS logr ON logr.codLogradouro = it.codLogradouro
JOIN Empresa_Linha AS le ON le.codLinha = l.codLinha
JOIN Empresa AS e ON e.cnpj = le.cnpj
WHERE logr.nome = 'Rua São Bento';