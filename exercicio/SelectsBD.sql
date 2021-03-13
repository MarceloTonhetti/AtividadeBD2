USE excControleNotasCorrecao;
GO

--A
SELECT da.ano AS Ano, d.nome AS Disciplina, a.nome AS Alunos 
FROM Aluno AS a
JOIN Disciplina_Aluno AS da ON da.raAluno = a.ra
JOIN Disciplina AS d ON da.siglaDisc = d.sigla
WHERE d.nome = 'Gerência e Projetos' AND da.ano = '2020';


--B Quais são as notas de um aluno em todas as disciplinas por ele cursadas no 2º. Semestre de 2019. Você definirá o aluno.
SELECT  d.nome AS Disciplina, a.nome AS Aluno,  da.mediaB1 AS MediaB1, da.mediaB2 AS MediaB2,
	da.notaSub AS NotaSub, mf.mediaFinal AS MediaFinal, da.presenca AS Presença, da.situacao AS Situacao
FROM Disciplina_Aluno AS da
JOIN Aluno AS a ON a.ra =  da.raAluno
JOIN Disciplina AS d ON da.siglaDisc = d.sigla
JOIN Media_Final_Disciplina_Aluno AS mf ON mf.raAluno = da.raAluno AND mf.siglaDisc = da.siglaDisc AND mf.semestre = da.semestre AND mf.ano = da.ano
WHERE da.semestre = 2 AND da.ano = '2019' AND a.ra = '0220471235464';


--C Quais são os alunos reprovados por nota (média inferior a cinco) no ano de 2020 e, o nome das disciplinas e as médias. Você definirá o curso.
SELECT c.nome AS Curso, da.ano AS Ano, d.nome AS Disciplina, a.nome AS Aluno,  da.mediaB1 AS MediaB1, da.mediaB2 AS MediaB2, da.notaSub AS NotaSub, mf.mediaFinal AS MediaFinal, da.presenca AS Presença
FROM Disciplina_Aluno AS da
JOIN Aluno AS a ON a.ra =  da.raAluno
JOIN Disciplina AS d ON da.siglaDisc = d.sigla
JOIN Curso AS c ON d.codCurso = c.codCurso
JOIN Media_Final_Disciplina_Aluno AS mf ON mf.raAluno = da.raAluno AND mf.siglaDisc = da.siglaDisc AND mf.semestre = da.semestre AND mf.ano = da.ano
WHERE (mf.mediaFinal < 6) AND c.nome = 'C# - Para o infinito e além' AND da.ano = '2020';


--D : trazer todos os alunos e a disciplinas que foram aprovados de certo curto. Você definirá o curso
SELECT c.nome AS Curso, da.ano AS Ano, d.nome AS Disciplina, a.nome AS Aluno,  da.mediaB1 AS MediaB1, da.mediaB2 AS MediaB2, da.notaSub AS NotaSub, mf.mediaFinal AS MediaFinal, da.presenca AS Presença, da.situacao
FROM Disciplina_Aluno AS da
JOIN Aluno AS a ON a.ra =  da.raAluno
JOIN Disciplina AS d ON da.siglaDisc = d.sigla
JOIN Curso AS c ON d.codCurso = c.codCurso
JOIN Media_Final_Disciplina_Aluno AS mf ON mf.raAluno = da.raAluno AND mf.siglaDisc = da.siglaDisc AND mf.semestre = da.semestre AND mf.ano = da.ano
WHERE (da.situacao = 'APROVADO') AND c.nome = 'C# - Para o infinito e além';