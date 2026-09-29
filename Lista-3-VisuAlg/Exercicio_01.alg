algoritmo "Exercicio_01"
var
   v: vetor[1..10] de inteiro
   i: inteiro
inicio
   para i de 1 ate 10 faca
      escreva("Digite o ", i, "o numero: ")
      leia(v[i])
   fimpara

   escreval("Numeros na ordem inversa:")
   para i de 10 ate 1 passo -1 faca
      escreval(v[i])
   fimpara
fimalgoritmo
