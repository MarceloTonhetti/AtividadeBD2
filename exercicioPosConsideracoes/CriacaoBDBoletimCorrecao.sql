--DROP DATABASE excControleNotasCorrecao; GO
CREATE DATABASE  excControleNotasCorrecao;
GO
USE excControleNotasCorrecao;
GO

CREATE TABLE Curso
(
	codCurso CHAR(4) NOT NULL,
	sigla CHAR(6) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	CONSTRAINT pk_curso PRIMARY KEY (codCurso),
	CONSTRAINT nome_unico_curso UNIQUE (nome),
	CONSTRAINT sigla_unico_curso UNIQUE (sigla)
);
GO

CREATE TABLE Disciplina
(
	sigla VARCHAR(6) NOT NULL,
	nome VARCHAR(30) NOT NULL,
	codCurso CHAR(4) NOT NULL,
	cargaHoraria INT NOT NULL,
	CONSTRAINT pk_disciplina PRIMARY KEY (sigla),
	CONSTRAINT nome_codCruso_unico_disciplina UNIQUE (nome, codCurso),
	CONSTRAINT fk_disciplina_codCurso FOREIGN KEY (codCurso) REFERENCES Curso(codCurso)
);
GO

CREATE TABLE Endereco
(
	codEndereco INT IDENTITY(1,1) NOT NULL,
	logradouro VARCHAR(50) NOT NULL,
	localidade VARCHAR(40) NOT NULL,
	bairro VARCHAR(40) NOT NULL,
	uf CHAR(2) NOT NULL,
	cep CHAR(8) NOT NULL,
	CONSTRAINT pk_endereco PRIMARY KEY (codEndereco)
);
GO


CREATE TABLE Aluno
(
	ra VARCHAR(13) NOT NULL,
	nome VARCHAR(20) NOT NULL,
	sobrenome VARCHAR(30) NOT NULL,
	dataNasc DATE NOT NULL,
	sexo CHAR(1),
	codEndereco INT NOT NULL,
	numEndereco VARCHAR(5) NOT NULL,
	compEndereco VARCHAR(30),
	codCurso CHAR(4) NOT NULL,
	CONSTRAINT pk_aluno PRIMARY KEY (ra),
	CONSTRAINT fk_aluno_endereco FOREIGN KEY (codEndereco) REFERENCES Endereco(codEndereco),
	CONSTRAINT fk_aluno_codCurso FOREIGN KEY (codCurso) REFERENCES Curso(codCurso)
);
GO

CREATE TABLE Telefone_Aluno
(
	ra VARCHAR(13) NOT NULL,
	numero CHAR(9) NOT NULL,
	ddd CHAR(2) NOT NULL,
	tipo VARCHAR (20) NOT NULL,
	CONSTRAINT pk_telefone_aluno PRIMARY KEY (ra, numero),
	CONSTRAINT fk_telefone_aluno_aluno FOREIGN KEY (ra) REFERENCES Aluno(ra)
);
GO

CREATE TABLE Disciplina_Aluno
(
	siglaDisc VARCHAR(6) NOT NULL,
	raAluno VARCHAR(13) NOT NULL,
	semestre INT NOT NULL,
	ano CHAR (4) NOT NULL,
	presenca INT,
	mediaB1 NUMERIC (4,2),
	mediaB2 NUMERIC (4,2),
	notaSub NUMERIC (4,2),
	situacao VARCHAR(20),
	CONSTRAINT pk_disciplina_aluno PRIMARY KEY (siglaDisc, raAluno, semestre, ano),
	CONSTRAINT fk_disciplina_aluno_disciplina FOREIGN KEY (siglaDisc) REFERENCES Disciplina(sigla),
	CONSTRAINT fk_disciplina_aluno_aluno FOREIGN KEY (raAluno) REFERENCES Aluno(ra)
);
GO

CREATE TABLE Media_Final_Disciplina_Aluno
(
	siglaDisc VARCHAR(6) NOT NULL,
	raAluno VARCHAR(13) NOT NULL,
	semestre INT NOT NULL,
	ano CHAR (4) NOT NULL,
	mediaFinal NUMERIC (4,2),
	CONSTRAINT pk_disciplina_media_final PRIMARY KEY (siglaDisc, raAluno, semestre, ano),
	CONSTRAINT fk_disciplina_media_final_disciplina_matricula FOREIGN KEY (siglaDisc, raAluno, semestre, ano) REFERENCES Disciplina_Aluno(siglaDisc, raAluno, semestre, ano)
);

--================ TRIGGERS
GO
CREATE OR ALTER TRIGGER insercaoDisciplinaMatricula
ON Disciplina_Aluno
AFTER INSERT
AS
BEGIN
	DECLARE
	@SIGLA VARCHAR(6),
	@RA VARCHAR(13),
	@SEMESTRE INT,
	@SEMESTREAUX INT,
	@ANO CHAR (4),
	@PRESENCA NUMERIC(5,2),
	@MEDIAB1 NUMERIC (4,2),
	@MEDIAB2 NUMERIC (4,2),
	@NOTASUB NUMERIC (4,2),
	@MEDIA NUMERIC (4,2),
	@CARGAHORARIA NUMERIC(5,2),
	@FREQUENCIA NUMERIC(5,2),
	@SITUACAO VARCHAR(20),
	@LIMITEFREQUENCIA NUMERIC(5,2);

	SET @LIMITEFREQUENCIA = 75;
	
	SET @MEDIA = NULL;

	SELECT @MEDIAB1 = mediaB1, @MEDIAB2 = mediaB2, @NOTASUB = notaSub, @SIGLA = siglaDisc,
		   @RA = raAluno, @SEMESTRE = semestre, @ANO = ano, @PRESENCA = presenca  FROM INSERTED;

	SELECT @CARGAHORARIA = cargaHoraria FROM Disciplina WHERE sigla = @SIGLA;

	IF ((@MEDIAB1 IS NOT NULL) AND (@MEDIAB2 IS NOT NULL))
	BEGIN
		SET @MEDIA = (@MEDIAB1 + @MEDIAB2) / 2;		

		IF ((@MEDIA < 6) AND (@NOTASUB IS NOT NULL))
			IF (@MEDIAB1 < @MEDIAB2)
				SET @MEDIA = (@NOTASUB + @MEDIAB2) / 2;
			ELSE IF (@MEDIAB1 >= @MEDIAB2)
				SET @MEDIA = (@MEDIAB1 + @NOTASUB) / 2;
	END


	SET @FREQUENCIA = (@PRESENCA/@CARGAHORARIA)* 100;


	IF(@FREQUENCIA < @LIMITEFREQUENCIA) 
		SET @SITUACAO = 'REPROVADO POR FALTA';
	ELSE IF (@MEDIA < 6)
		SET @SITUACAO = 'REPROVADO POR NOTA';
	ELSE IF ((@MEDIA IS NOT NULL) AND (@PRESENCA IS NOT NULL))
		SET @SITUACAO = 'APROVADO';
	ELSE
		SET @SITUACAO = 'CURSANDO';

	UPDATE Disciplina_Aluno
	SET situacao = @SITUACAO
	WHERE siglaDisc = @SIGLA AND raAluno = @RA AND semestre = @SEMESTRE AND ano = @ANO

	SET @SEMESTREAUX = NULL;

	SELECT @SEMESTREAUX = semestre FROM Media_Final_Disciplina_Aluno WHERE siglaDisc = @SIGLA AND raAluno = @RA AND semestre = @SEMESTRE AND ano = @ANO

	IF (@SEMESTREAUX IS NULL)
	BEGIN
		INSERT INTO Media_Final_Disciplina_Aluno (raAluno, siglaDisc, semestre, ano, mediaFinal)
		VALUES (@RA, @SIGLA, @SEMESTRE, @ANO, @MEDIA);
	END
	ELSE
	BEGIN
		UPDATE Media_Final_Disciplina_Aluno
		SET mediaFinal = @MEDIA
		WHERE siglaDisc = @SIGLA AND raAluno = @RA AND semestre = @SEMESTRE AND ano = @ANO
	END
END;
GO