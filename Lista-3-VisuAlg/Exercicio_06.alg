algoritmo "Exercicio_06"
var
   m: vetor[1..2,1..2] de inteiro
   i, j, soma: inteiro
inicio
   soma <- 0

   para i de 1 ate 2 faca
      para j de 1 ate 2 faca
         escreva("Digite o elemento [", i, ",", j, "]: ")
         leia(m[i,j])
         soma <- soma + m[i,j]
      fimpara
   fimpara

   escreval("Soma de todos os elementos: ", soma)
fimalgoritmo
