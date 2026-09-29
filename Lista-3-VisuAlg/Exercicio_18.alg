algoritmo "Exercicio_18"
var
   notas: vetor[1..5] de real
   i, j: inteiro
   aux: real
inicio
   para i de 1 ate 5 faca
      escreva("Digite a nota do aluno ", i, ": ")
      leia(notas[i])
   fimpara

   para i de 1 ate 4 faca
      para j de 1 ate 5-i faca
         se notas[j] > notas[j+1] entao
            aux <- notas[j]
            notas[j] <- notas[j+1]
            notas[j+1] <- aux
         fimse
      fimpara
   fimpara

   escreval("Notas em ordem crescente:")
   para i de 1 ate 5 faca
      escreval(notas[i]:0:2)
   fimpara
fimalgoritmo
