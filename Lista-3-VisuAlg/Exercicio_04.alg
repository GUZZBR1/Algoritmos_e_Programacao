algoritmo "Exercicio_04"
var
   v: vetor[1..10] de inteiro
   i: inteiro
inicio
   para i de 1 ate 10 faca
      escreva("Digite o ", i, "o numero: ")
      leia(v[i])
   fimpara

   escreval("Numeros pares armazenados:")
   para i de 1 ate 10 faca
      se v[i] mod 2 = 0 entao
         escreval(v[i])
      fimse
   fimpara
fimalgoritmo
