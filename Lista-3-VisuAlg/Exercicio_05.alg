algoritmo "Exercicio_05"
var
   v: vetor[1..15] de inteiro
   i: inteiro
inicio
   para i de 1 ate 15 faca
      escreva("Digite o valor da posicao ", i, ": ")
      leia(v[i])
   fimpara

   escreval("Numeros nas posicoes pares:")
   para i de 2 ate 15 passo 2 faca
      escreval("Posicao ", i, ": ", v[i])
   fimpara
fimalgoritmo
