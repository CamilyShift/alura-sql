--1) Buscar o nome do professor e a turma que ele é orientador
SELECT nome_professor, nome_turma
FROM Professores P 
JOIN Turmas T ON P.ID_Professor = T.ID_Professor_Orientador;

--2) Retornar o nome e a nota do aluno que possui a melhor nota na disciplina de Matemática. 
SELECT nome_aluno, MAX(nota)
FROM Alunos A 
JOIN Notas N ON A.ID_Aluno = N.ID_Aluno
JOIN Disciplinas D on D.ID_Disciplina = N.ID_Disciplina
WHERE D.Nome_Disciplina = 'Matemática';

--3) Identificar o total de alunos por turma. 
SELECT nome_turma, COUNT(TA.ID_Turma)
FROM Turmas T 
JOIN Turma_Alunos TA ON T.ID_Turma = TA.ID_Turma
GROUP BY nome_turma;

--4) Listar os Alunos e as disciplinas em que estão matriculados. 
SELECT A.nome_aluno, D.nome_disciplina
FROM Alunos A 
JOIN Turma_Alunos TA ON A.ID_Aluno = TA.ID_Aluno
JOIN Turma_Disciplinas TD ON TA.ID_Turma = TD.ID_Turma
JOIN Disciplinas D ON TD.ID_Disciplina = D.ID_Disciplina;

--5) Criar uma view que apresenta o nome, a disciplina e a nota dos alunos.
CREATE VIEW NomeDisciplinaNota
AS
SELECT nome_aluno, nome_disciplina, nota
FROM Alunos A
JOIN Notas N ON A.ID_Aluno = N.ID_Aluno
JOIN Disciplinas D ON N.ID_Disciplina = D.ID_Disciplina;

SELECT * FROM NomeDisciplinaNota;