algoritmo "Exercicio_20"
funcao fibonacci(n: inteiro): inteiro
inicio
   se n = 0 entao
      retorne 0
   senao
      se n = 1 entao
         retorne 1
      senao
         retorne fibonacci(n - 1) + fibonacci(n - 2)
      fimse
   fimse
fimfuncao

var
   n: inteiro
inicio
   escreva("Digite n (considerando F(0)=0 e F(1)=1): ")
   leia(n)

   se n < 0 entao
      escreval("Informe um valor maior ou igual a zero.")
   senao
      escreval("F(", n, ") = ", fibonacci(n))
   fimse
fimalgoritmo
