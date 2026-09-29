algoritmo "Exercicio_15"
tipo
   TLivro = registro
      titulo: caractere
      autor: caractere
      ano: inteiro
   fimregistro
var
   livros: vetor[1..5] de TLivro
   i: inteiro
inicio
   para i de 1 ate 5 faca
      escreva("Titulo do livro ", i, ": ")
      leia(livros[i].titulo)
      escreva("Autor: ")
      leia(livros[i].autor)
      escreva("Ano de publicacao: ")
      leia(livros[i].ano)
   fimpara

   escreval("Livros publicados apos o ano 2000:")
   para i de 1 ate 5 faca
      se livros[i].ano > 2000 entao
         escreval(livros[i].titulo, " - ", livros[i].autor, " (", livros[i].ano, ")")
      fimse
   fimpara
fimalgoritmo
