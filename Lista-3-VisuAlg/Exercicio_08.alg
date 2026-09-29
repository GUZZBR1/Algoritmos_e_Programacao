algoritmo "Exercicio_08"
var
   m: vetor[1..3,1..3] de inteiro
   i, j, soma: inteiro
inicio
   para i de 1 ate 3 faca
      para j de 1 ate 3 faca
         escreva("Digite o elemento [", i, ",", j, "]: ")
         leia(m[i,j])
      fimpara
   fimpara

   soma <- 0
   para i de 1 ate 3 faca
      soma <- soma + m[i,4-i]
   fimpara

   escreval("Soma da diagonal secundaria: ", soma)
fimalgoritmo
