algoritmo "Exercicio_14"
tipo
   TCliente = registro
      nome: caractere
      idade: inteiro
      cidade: caractere
   fimregistro
var
   clientes: vetor[1..3] de TCliente
   i: inteiro
   cidadeEscolhida: caractere
inicio
   para i de 1 ate 3 faca
      escreva("Nome do cliente ", i, ": ")
      leia(clientes[i].nome)
      escreva("Idade: ")
      leia(clientes[i].idade)
      escreva("Cidade: ")
      leia(clientes[i].cidade)
   fimpara

   escreva("Digite a cidade que deseja pesquisar: ")
   leia(cidadeEscolhida)

   escreval("Clientes que moram em ", cidadeEscolhida, ":")
   para i de 1 ate 3 faca
      se clientes[i].cidade = cidadeEscolhida entao
         escreval(clientes[i].nome)
      fimse
   fimpara
fimalgoritmo
