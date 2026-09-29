algoritmo "Exercicio_16"
var
   v: vetor[1..6] de inteiro
   i, j, aux: inteiro
inicio
   para i de 1 ate 6 faca
      escreva("Digite o ", i, "o numero: ")
      leia(v[i])
   fimpara

   para i de 1 ate 5 faca
      para j de 1 ate 6-i faca
         se v[j] > v[j+1] entao
            aux <- v[j]
            v[j] <- v[j+1]
            v[j+1] <- aux
         fimse
      fimpara
   fimpara

   escreval("Vetor em ordem crescente:")
   para i de 1 ate 6 faca
      escreval(v[i])
   fimpara
fimalgoritmo
