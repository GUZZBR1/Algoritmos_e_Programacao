Algoritmo "LISTA 18"

Var
   nome, nome_velho, nome_novo : caractere
   idade, rodada, maior_idade, menor_idade, soma_idades : inteiro
   media : real

Inicio
   soma_idades <- 0

   para rodada de 1 ate 5 faca
      escreval("--- ", rodada, "ª PESSOA ---")
      escreva("Nome: ")
      leia(nome)
      escreva("Idade: ")
      leia(idade)

      soma_idades <- soma_idades + idade

      se rodada = 1 entao
         maior_idade <- idade
         nome_velho  <- nome
         menor_idade <- idade
         nome_novo   <- nome
      senao

         se idade > maior_idade entao
            maior_idade <- idade
            nome_velho  <- nome
         fimse


         se idade < menor_idade entao
            menor_idade <- idade
            nome_novo   <- nome
         fimse
      fimse
      escreval("")
   fimpara

   media <- soma_idades / 5

   escreval("-----------------------------")
   escreval("Média das idades do grupo: ", media:1:1, " anos")
   escreval("Pessoa mais velha: ", nome_velho, " com ", maior_idade, " anos")
   escreval("Pessoa mais nova: ", nome_novo, " com ", menor_idade, " anos")

Fimalgoritmo
