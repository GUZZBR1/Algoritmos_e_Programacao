algoritmo "Exercicio_09"
var
   m: vetor[1..2,1..3] de inteiro
   i, j, maior: inteiro
inicio
   para i de 1 ate 2 faca
      para j de 1 ate 3 faca
         escreva("Digite o elemento [", i, ",", j, "]: ")
         leia(m[i,j])
      fimpara
   fimpara

   maior <- m[1,1]

   para i de 1 ate 2 faca
      para j de 1 ate 3 faca
         se m[i,j] > maior entao
            maior <- m[i,j]
         fimse
      fimpara
   fimpara

   escreval("Maior elemento da matriz: ", maior)
fimalgoritmo
