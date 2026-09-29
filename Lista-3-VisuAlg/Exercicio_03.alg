algoritmo "Exercicio_03"
var
   v: vetor[1..8] de inteiro
   i, maior, menor: inteiro
inicio
   para i de 1 ate 8 faca
      escreva("Digite o ", i, "o numero: ")
      leia(v[i])
   fimpara

   maior <- v[1]
   menor <- v[1]

   para i de 2 ate 8 faca
      se v[i] > maior entao
         maior <- v[i]
      fimse
      se v[i] < menor entao
         menor <- v[i]
      fimse
   fimpara

   escreval("Maior numero: ", maior)
   escreval("Menor numero: ", menor)
fimalgoritmo
