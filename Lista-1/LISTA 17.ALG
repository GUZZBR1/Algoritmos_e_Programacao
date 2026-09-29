Algoritmo "LISTA 17"

Var
   numero, rodada, pares, impares : inteiro

Inicio
   pares <- 0
   impares <- 0

   para rodada de 1 ate 10 faca
      escreva("Digite o ", rodada, "º número: ")
      leia(numero)

      se numero mod 2 = 0 entao
         pares <- pares + 1
      senao
         impares <- impares + 1
      fimse
   fimpara

   escreval("")
   escreval("--- RESULTADO FINAL ---")
   escreval("Quantidade de números PARES: ", pares)
   escreval("Quantidade de números ÍMPARES: ", impares)

Fimalgoritmo
