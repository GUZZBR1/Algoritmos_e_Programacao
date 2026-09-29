algoritmo "Exercicio_17"
var
   v: vetor[1..8] de inteiro
   i, j, aux: inteiro
inicio
   para i de 1 ate 8 faca
      escreva("Digite o ", i, "o numero: ")
      leia(v[i])
   fimpara

   para i de 1 ate 7 faca
      para j de 1 ate 8-i faca
         se v[j] < v[j+1] entao
            aux <- v[j]
            v[j] <- v[j+1]
            v[j+1] <- aux
         fimse
      fimpara
   fimpara

   escreval("Vetor em ordem decrescente:")
   para i de 1 ate 8 faca
      escreval(v[i])
   fimpara
fimalgoritmo
