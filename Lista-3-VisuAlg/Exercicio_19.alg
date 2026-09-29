algoritmo "Exercicio_19"
funcao fatorial(n: inteiro): inteiro
inicio
   se n <= 1 entao
      retorne 1
   senao
      retorne n * fatorial(n - 1)
   fimse
fimfuncao

var
   n: inteiro
inicio
   escreva("Digite um numero inteiro nao negativo: ")
   leia(n)

   se n < 0 entao
      escreval("Nao existe fatorial de numero negativo.")
   senao
      escreval("Fatorial de ", n, " = ", fatorial(n))
   fimse
fimalgoritmo
