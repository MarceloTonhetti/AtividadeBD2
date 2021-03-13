USE excControleNotas;
GO

--INSERÇÕES
--CURSO
INSERT INTO Curso (codCurso, nome)
VALUES ('2101','C# - Para o infinito e além');
INSERT INTO Curso (codCurso, nome)
VALUES ('2102','Java - O inimigo agora é outro');

--ANO LETIVO
INSERT INTO Ano_Letivo (codAno)
VALUES ('2019');
INSERT INTO Ano_Letivo (codAno)
VALUES ('2020');
INSERT INTO Ano_Letivo (codAno)
VALUES ('2021');


--ANO LETIVO CURSO
INSERT INTO Ano_Letivo_Curso (codCurso,codAno)
VALUES ('2101','2019');
INSERT INTO Ano_Letivo_Curso (codCurso,codAno)
VALUES ('2101','2020');
INSERT INTO Ano_Letivo_Curso (codCurso,codAno)
VALUES ('2101','2021');

--SEMESTRE
INSERT INTO Semestre (numero,codAno, semestreAno) --1
VALUES (1,'2020', 1);
INSERT INTO Semestre (numero,codAno, semestreAno) --2
VALUES (2,'2020', 1);
INSERT INTO Semestre (numero,codAno, semestreAno) --3
VALUES (3,'2020', 2);
INSERT INTO Semestre (numero,codAno, semestreAno) --4
VALUES (1,'2019', 2);
INSERT INTO Semestre (numero,codAno, semestreAno) --5
VALUES (2,'2019', 2);
INSERT INTO Semestre (numero,codAno, semestreAno) --6
VALUES (3,'2019', 2);
INSERT INTO Semestre (numero,codAno, semestreAno) --7
VALUES (4,'2019', 2);
INSERT INTO Semestre (numero,codAno, semestreAno) --8
VALUES (4,'2020', 2);
INSERT INTO Semestre (numero,codAno, semestreAno) --9
VALUES (1,'2021', 1);

--DISCIPLINA
INSERT INTO Disciplina (sigla, nome, cargaHoraria, codSemestre)
VALUES ('IED001', 'Estruturas de Dados', 100, 6);
INSERT INTO Disciplina (sigla, nome, cargaHoraria, codSemestre)
VALUES ('MCA002', 'Cálculo', 100, 5);
INSERT INTO Disciplina (sigla, nome, cargaHoraria, codSemestre)
VALUES ('ILP502', 'Programação de Scripts', 60, 5);
INSERT INTO Disciplina (sigla, nome, cargaHoraria, codSemestre)
VALUES ('AAG001', 'Administração Geral', 80, 9);
INSERT INTO Disciplina (sigla, nome, cargaHoraria, codSemestre)
VALUES ('CCG001', 'Contabilidade', 80, 2);
INSERT INTO Disciplina (sigla, nome, cargaHoraria, codSemestre)
VALUES ('IES100', 'Engenharia de Software I', 80, 2);
INSERT INTO Disciplina (sigla, nome, cargaHoraria, codSemestre)
VALUES ('IBD002', 'Banco de Dados', 80, 6);
INSERT INTO Disciplina (sigla, nome, cargaHoraria, codSemestre)
VALUES ('IHW100', 'Laboratório de Hardware', 80, 7);
INSERT INTO Disciplina (sigla, nome, cargaHoraria, codSemestre)
VALUES ('AGO014', 'Gerência e Projetos', 80, 8);

--ENDERECO
INSERT INTO Endereco (logradouro, localidade, bairro, uf, cep)
VALUES ('R. Domingos Zanin', 'Araraquara', 'Jardim Artico', 'SP', '14800250');
INSERT INTO Endereco (logradouro, localidade, bairro, uf, cep)
VALUES ('Rua Cap. José Sabino Sampaio', 'Araraquara', 'Centro', 'SP', '14800846');
INSERT INTO Endereco (logradouro, localidade, bairro, uf, cep)
VALUES ('Av. XV de Novembro', 'Matão', 'Jardim centro', 'SP', '15990964');
INSERT INTO Endereco (logradouro, localidade, bairro, uf, cep)
VALUES ('Professor Octácilio Ribeiro', 'Matão', 'Jardim Esperença', 'SP', '15995278');
INSERT INTO Endereco (logradouro, localidade, bairro, uf, cep)
VALUES ('Av. São Paulo', 'Matão', 'Jardim Balista', 'SP', '15990278');
INSERT INTO Endereco (logradouro, localidade, bairro, uf, cep)
VALUES ('Av. Sinharinha Frota', 'Matão', 'Jardim do bosque', 'SP', '15990275');
INSERT INTO Endereco (logradouro, localidade, bairro, uf, cep)
VALUES ('R. Rodolfo Viesi', 'Taquaritinga', 'Parque residencial Laranjeiras 1', 'SP', '15904094');


--ALUNO
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, compEndereco)
VALUES ('0220471235462', 'Felipe', 'De Souza', '1996/02/29', 'M', 1, '1213A', 'Em frente o banco da caixa');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco)
VALUES ('0220471235463', 'Augusto', 'Melo', '1999/01/10', 'M',2, '29');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco)
VALUES ('0220471235464', 'Whelinto', 'Duo', '2000/02/29', 'M',3, '1213A');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco)
VALUES ('0220471235465', 'Amanda', 'De Silva', '2001/08/17', 'F',4, '525');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco)
VALUES ('0220471235466', 'Joana', 'Freitas', '2000/09/15', 'F', 5, '504');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco)
VALUES ('0220471235467', 'Julia', 'Dantas', '2001/11/16', 'F', 6, '8459');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco)
VALUES ('0220471235468', 'Judite', 'Silva', '1995/10/22', 'F', 7, '954');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco)
VALUES ('0220471234561', 'Matheus', 'Souza', '1999/05/25', 'M',4 , '525');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, compEndereco)
VALUES ('0220471235469', 'Mariana', 'De Souza', '2000/07/09', 'F', 1, '1213A', 'Em frente o banco da caixa');

--TELEFONE ALUNO
INSERT INTO Telefone_Aluno (ra, numero, ddd, tipo)
VALUES ('0220471235462', '992746453', '16', 'Celular');
INSERT INTO Telefone_Aluno (ra, numero, ddd, tipo)
VALUES ('0220471235469', '992746455', '16', 'Celular');
INSERT INTO Telefone_Aluno (ra, numero, ddd, tipo)
VALUES ('0220471235463', '33847692', '16', 'Fixo');
INSERT INTO Telefone_Aluno (ra, numero, ddd, tipo)
VALUES ('0220471235464', '33944836', '16', 'Fixo');
INSERT INTO Telefone_Aluno (ra, numero, ddd, tipo)
VALUES ('0220471235465', '993026116', '16', 'Celular');
INSERT INTO Telefone_Aluno (ra, numero, ddd, tipo)
VALUES ('0220471235466', '997779458', '16', 'Celular');
INSERT INTO Telefone_Aluno (ra, numero, ddd, tipo)
VALUES ('0220471235467', '33941859', '16', 'Fixo');
INSERT INTO Telefone_Aluno (ra, numero, ddd, tipo)
VALUES ('0220471235468', '33841333', '16', 'Fixo');
INSERT INTO Telefone_Aluno (ra, numero, ddd, tipo)
VALUES ('0220471234561', '999560454', '16', 'Celular');


--MATRICULA DISCIPLINA ALUNO
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno)
VALUES ('IED001', '0220471235462');
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2)
VALUES ('MCA002', '0220471235462', 60, 8, 9);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2)
VALUES ('ILP502', '0220471235462', 57, 6.5, 7.5);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2, notaSub)
VALUES ('IHW100', '0220471235462', 75, 6, 3, 8);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2)
VALUES ('AAG001', '0220471235469', 79, 8, 9);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2, notaSub)
VALUES ('AGO014', '0220471235469', 87, 4, 3, 6);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2, notaSub)
VALUES ('CCG001', '0220471235469', 76, 5, 2, 4);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2)
VALUES ('IES100', '0220471235469', 43, 8, 7);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2, notaSub)
VALUES ('ILP502', '0220471235465', 48, 5, 2, 4);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1)
VALUES ('AAG001', '0220471235465', 79, 3);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2, notaSub)
VALUES ('IED001', '0220471235465', 87, 5, 3, 8);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2, notaSub)
VALUES ('IES100', '0220471235465', 76, 4.25, 2, 6);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2)
VALUES ('IED001', '0220471235464', 87, 6.5, 9);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2, notaSub)
VALUES ('ILP502', '0220471235464', 53, 7, 3, 8);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2)
VALUES ('AAG001', '0220471234561', 69, 7, 9);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2, notaSub)
VALUES ('AGO014', '0220471234561', 80, 3, 4, 6);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2, notaSub)
VALUES ('CCG001', '0220471234561', 74, 7.5, 2.25, 3);
INSERT INTO Matricula_Disciplina (siglaDisc, raAluno, presenca, mediaB1, mediaB2)
VALUES ('IES100', '0220471234561', 79, 8, 7);





















