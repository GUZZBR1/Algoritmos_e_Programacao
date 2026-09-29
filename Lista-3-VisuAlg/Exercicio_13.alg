algoritmo "Exercicio_13"
tipo
   TProduto = registro
      nome: caractere
      preco: real
      quantidade: inteiro
   fimregistro
var
   produtos: vetor[1..4] de TProduto
   i: inteiro
   valorTotal: real
inicio
   valorTotal <- 0

   para i de 1 ate 4 faca
      escreva("Nome do produto ", i, ": ")
      leia(produtos[i].nome)
      escreva("Preco: ")
      leia(produtos[i].preco)
      escreva("Quantidade: ")
      leia(produtos[i].quantidade)

      valorTotal <- valorTotal + (produtos[i].preco * produtos[i].quantidade)
   fimpara

   escreval("Valor total em estoque: R$ ", valorTotal:0:2)
fimalgoritmo
