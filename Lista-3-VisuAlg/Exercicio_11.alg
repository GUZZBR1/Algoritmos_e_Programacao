algoritmo "Exercicio_11"
tipo
   TAluno = registro
      nome: caractere
      idade: inteiro
      notaFinal: real
   fimregistro
var
   alunos: vetor[1..5] de TAluno
   i: inteiro
inicio
   para i de 1 ate 5 faca
      escreva("Nome do aluno ", i, ": ")
      leia(alunos[i].nome)
      escreva("Idade: ")
      leia(alunos[i].idade)
      escreva("Nota final: ")
      leia(alunos[i].notaFinal)
   fimpara

   escreval("Alunos aprovados:")
   para i de 1 ate 5 faca
      se alunos[i].notaFinal >= 6 entao
         escreval(alunos[i].nome)
      fimse
   fimpara
fimalgoritmo
