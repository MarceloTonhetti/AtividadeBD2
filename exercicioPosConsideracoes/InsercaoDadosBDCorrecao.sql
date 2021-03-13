USE excControleNotasCorrecao;
GO

--INSERÇÕES
--CURSO
INSERT INTO Curso (codCurso, sigla, nome)
VALUES ('2101', 'CPIA0I','C# - Para o infinito e além');
INSERT INTO Curso (codCurso, sigla, nome)
VALUES ('2102', 'JIAO0M','Java - O inimigo agora é outro');


--DISCIPLINA
INSERT INTO Disciplina (sigla, nome, codCurso, cargaHoraria)
VALUES ('IED001', 'Estruturas de Dados', '2101', 100);
INSERT INTO Disciplina (sigla, nome, codCurso, cargaHoraria)
VALUES ('IED002', 'Estruturas de Dados', '2102', 100);
INSERT INTO Disciplina (sigla, nome, codCurso, cargaHoraria)
VALUES ('MCA002', 'Cálculo', '2101', 80);
INSERT INTO Disciplina (sigla, nome, codCurso, cargaHoraria)
VALUES ('ILP502', 'Programação de Scripts', '2101', 60);
INSERT INTO Disciplina (sigla, nome, codCurso, cargaHoraria)
VALUES ('AAG001', 'Administração Geral', '2101', 80);
INSERT INTO Disciplina (sigla, nome, codCurso, cargaHoraria)
VALUES ('CCG001', 'Contabilidade', '2101', 80);
INSERT INTO Disciplina (sigla, nome, codCurso, cargaHoraria)
VALUES ('IES100', 'Engenharia de Software I', '2101', 80);
INSERT INTO Disciplina (sigla, nome, codCurso, cargaHoraria)
VALUES ('IBD002', 'Banco de Dados', '2101', 80);
INSERT INTO Disciplina (sigla, nome, codCurso, cargaHoraria)
VALUES ('IHW100', 'Laboratório de Hardware', '2101', 80);
INSERT INTO Disciplina (sigla, nome, codCurso, cargaHoraria)
VALUES ('AGO014', 'Gerência e Projetos', '2101', 80);

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
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, compEndereco, codCurso)
VALUES ('0220471235462', 'Felipe', 'De Souza', '1996/02/29', 'M', 1, '1213A', 'Em frente o banco da caixa', '2102');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, codCurso)
VALUES ('0220471235463', 'Augusto', 'Melo', '1999/01/10', 'M',2, '29', '2101');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, codCurso)
VALUES ('0220471235464', 'Whelinto', 'Duo', '2000/02/29', 'M',3, '1213A', '2101');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, codCurso)
VALUES ('0220471235465', 'Amanda', 'De Silva', '2001/08/17', 'F',4, '525', '2101');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, codCurso)
VALUES ('0220471235466', 'Joana', 'Freitas', '2000/09/15', 'F', 5, '504', '2101');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, codCurso)
VALUES ('0220471235467', 'Julia', 'Dantas', '2001/11/16', 'F', 6, '8459', '2102');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, codCurso)
VALUES ('0220471235468', 'Judite', 'Silva', '1995/10/22', 'F', 7, '954', '2101');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, codCurso)
VALUES ('0220471234561', 'Matheus', 'Souza', '1999/05/25', 'M',4 , '525', '2101');
INSERT INTO Aluno (ra, nome, sobrenome, dataNasc, sexo, codEndereco, numEndereco, compEndereco, codCurso)
VALUES ('0220471235469', 'Mariana', 'De Souza', '2000/07/09', 'F', 1, '1213A', 'Em frente o banco da caixa', '2101');

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
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano)
VALUES ('IED002', '0220471235462', 2, '2019');
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2)
VALUES ('MCA002', '0220471235462', 2, '2019', 60, 8, 9);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2)
VALUES ('ILP502', '0220471235462', 2, '2019', 57, 6.5, 7.5);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2, notaSub)
VALUES ('IHW100', '0220471235462', 2, '2019', 75, 6, 3, 8);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2)
VALUES ('AAG001', '0220471235469', 2, '2019', 79, 8, 9);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2, notaSub)
VALUES ('AGO014', '0220471235469', 2, '2020', 79, 4, 3, 6);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2, notaSub)
VALUES ('CCG001', '0220471235469', 1, '2020', 76, 5, 2, 4);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2)
VALUES ('IES100', '0220471235469', 2, '2019', 43, 8, 7);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2, notaSub)
VALUES ('ILP502', '0220471235465', 2, '2019', 48, 5, 2, 4);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1)
VALUES ('AAG001', '0220471235465', 1, '2021', 32, 3);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2, notaSub)
VALUES ('IED001', '0220471235465', 1, '2020', 77, 5, 3, 8);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2, notaSub)
VALUES ('IES100', '0220471235465', 2, '2020', 76, 4.25, 2, 6);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2)
VALUES ('IED001', '0220471235464', 2, '2019', 73, 6.5, 9);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2, notaSub)
VALUES ('ILP502', '0220471235464', 2, '2019', 53, 7, 3, 8);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2)
VALUES ('AAG001', '0220471234561', 2, '2019', 69, 7, 9);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2, notaSub)
VALUES ('AGO014', '0220471234561', 2, '2020', 80, 3, 4, 6);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2, notaSub)
VALUES ('CCG001', '0220471234561', 1, '2020', 74, 7.5, 2.25, 3);
INSERT INTO Disciplina_Aluno (siglaDisc, raAluno, semestre, ano, presenca, mediaB1, mediaB2)
VALUES ('IES100', '0220471234561', 2, '2019', 79, 8, 7);


DELETE FROM Media_Final_Disciplina_Aluno
DELETE FROM Disciplina_Aluno







