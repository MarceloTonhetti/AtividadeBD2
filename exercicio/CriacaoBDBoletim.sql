--DROP DATABASE excControleNotas; GO
CREATE DATABASE  excControleNotas;
GO
USE excControleNotas;
GO

CREATE TABLE Curso
(
	codCurso CHAR(4) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	CONSTRAINT pk_curso PRIMARY KEY (codCurso),
	CONSTRAINT nome_unico UNIQUE (nome)
);
GO

CREATE TABLE Ano_Letivo
(
	codAno CHAR(4) NOT NULL,
	CONSTRAINT pk_ano_letivo PRIMARY KEY (codAno),
);
GO

CREATE TABLE Ano_Letivo_Curso
(
	codCurso CHAR(4) NOT NULL,
	codAno CHAR(4) NOT NULL,
	CONSTRAINT pk_ano_letivo_curso PRIMARY KEY (codCurso, codAno),
	CONSTRAINT fk_ano_letivo_curso_curso FOREIGN KEY (codCurso) REFERENCES Curso(codCurso),
	CONSTRAINT fk_ano_letivo_curso_ano FOREIGN KEY (codAno) REFERENCES Ano_Letivo(codAno)
);
GO

CREATE TABLE Semestre
(
	codSemestre INT IDENTITY(1,1) NOT NULL,
	numero INT NOT NULL,
	semestreAno INT NOT NULL,
	codAno CHAR(4) NOT NULL,
	CONSTRAINT pk_semestre PRIMARY KEY (codSemestre),
	CONSTRAINT fk_semestre_ano_letivo FOREIGN KEY (codAno) REFERENCES Ano_Letivo(codAno)
);
GO

CREATE TABLE Disciplina
(
	sigla VARCHAR(6) NOT NULL,
	nome VARCHAR(30) NOT NULL,
	cargaHoraria INT NOT NULL,
	codSemestre INT NOT NULL,
	CONSTRAINT pk_disciplina PRIMARY KEY (sigla),
	CONSTRAINT fk_disciplina_semestre FOREIGN KEY (codSemestre) REFERENCES Semestre(codSemestre)
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
	CONSTRAINT pk_aluno PRIMARY KEY (ra),
	CONSTRAINT fk_aluno_endereco FOREIGN KEY (codEndereco) REFERENCES Endereco(codEndereco)
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

CREATE TABLE Matricula_Disciplina
(
	siglaDisc VARCHAR(6) NOT NULL,
	raAluno VARCHAR(13) NOT NULL,
	presenca INT,
	mediaB1 NUMERIC (4,2),
	mediaB2 NUMERIC (4,2),
	notaSub NUMERIC (4,2),
	CONSTRAINT pk_matricula_disciplina PRIMARY KEY (siglaDisc, raAluno),
	CONSTRAINT fk_matricula_disciplina_disciplina FOREIGN KEY (siglaDisc) REFERENCES Disciplina(sigla),
	CONSTRAINT fk_matricula_disciplina_aluno FOREIGN KEY (raAluno) REFERENCES Aluno(ra)
);
GO

CREATE TABLE Disciplina_Media_Final
(
	siglaDisc VARCHAR(6) NOT NULL,
	raAluno VARCHAR(13) NOT NULL,
	mediaFinal NUMERIC (4,2),
	CONSTRAINT pk_disciplina_media_final PRIMARY KEY (siglaDisc, raAluno),
	CONSTRAINT fk_disciplina_media_final_disciplina FOREIGN KEY (siglaDisc) REFERENCES Disciplina(sigla),
	CONSTRAINT fk_disciplina_media_final_aluno FOREIGN KEY (raAluno) REFERENCES Aluno(ra)
);

--================ TRIGGERS
GO
CREATE OR ALTER TRIGGER calculaMediaInsert
ON Matricula_Disciplina
AFTER INSERT
AS
BEGIN
	DECLARE
	@SIGLA VARCHAR(6),
	@RA VARCHAR(13),
	@MEDIAB1 NUMERIC (4,2),
	@MEDIAB2 NUMERIC (4,2),
	@NOTASUB NUMERIC (4,2),
	@MEDIA NUMERIC (4,2);
	
	SET @MEDIA = NULL;

	SELECT @MEDIAB1 = mediaB1, @MEDIAB2 = mediaB2, @NOTASUB = notaSub, @SIGLA = siglaDisc, @RA = raAluno  FROM INSERTED;

	IF ((@MEDIAB1 IS NOT NULL) AND (@MEDIAB2 IS NOT NULL))
	BEGIN
		SET @MEDIA = (@MEDIAB1 + @MEDIAB2) / 2;		

		IF ((@MEDIA < 6) AND (@NOTASUB IS NOT NULL))
			IF (@MEDIAB1 < @MEDIAB2)
				SET @MEDIA = (@NOTASUB + @MEDIAB2) / 2;
			ELSE IF (@MEDIAB1 >= @MEDIAB2)
				SET @MEDIA = (@MEDIAB1 + @NOTASUB) / 2;
	END

	INSERT INTO Disciplina_Media_Final (raAluno, siglaDisc, mediaFinal)
	VALUES (@RA, @SIGLA, @MEDIA);
END;
GO

CREATE OR ALTER TRIGGER calculaMediaUpdate
ON Matricula_Disciplina
AFTER UPDATE
AS
BEGIN
	DECLARE
	@SIGLA VARCHAR(6),
	@RA VARCHAR(13),
	@MEDIAB1 NUMERIC (4,2),
	@MEDIAB2 NUMERIC (4,2),
	@NOTASUB NUMERIC (4,2),
	@MEDIA NUMERIC (4,2);
	
	SET @MEDIA = NULL;

	SELECT @MEDIAB1 = mediaB1, @MEDIAB2 = mediaB2, @NOTASUB = notaSub, @SIGLA = siglaDisc, @RA = raAluno  FROM INSERTED;

	IF ((@MEDIAB1 IS NOT NULL) AND (@MEDIAB2 IS NOT NULL))
	BEGIN
		SET @MEDIA = (@MEDIAB1 + @MEDIAB2) / 2;		

		IF ((@MEDIA < 6) AND (@NOTASUB IS NOT NULL))
			IF (@MEDIAB1 < @MEDIAB2)
				SET @MEDIA = (@NOTASUB + @MEDIAB2) / 2;
			ELSE IF (@MEDIAB1 >= @MEDIAB2)
				SET @MEDIA = (@MEDIAB1 + @NOTASUB) / 2;
	END

	UPDATE Disciplina_Media_Final
	SET mediaFinal = @MEDIA
	WHERE raAluno = @RA AND siglaDisc = @SIGLA	

END;
GO