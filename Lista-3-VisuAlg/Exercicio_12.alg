algoritmo "Exercicio_12"
tipo
   TFuncionario = registro
      nome: caractere
      cargo: caractere
      salario: real
   fimregistro
var
   funcionarios: vetor[1..3] de TFuncionario
   i, posMaior: inteiro
inicio
   para i de 1 ate 3 faca
      escreva("Nome do funcionario ", i, ": ")
      leia(funcionarios[i].nome)
      escreva("Cargo: ")
      leia(funcionarios[i].cargo)
      escreva("Salario: ")
      leia(funcionarios[i].salario)
   fimpara

   posMaior <- 1
   para i de 2 ate 3 faca
      se funcionarios[i].salario > funcionarios[posMaior].salario entao
         posMaior <- i
      fimse
   fimpara

   escreval("Funcionario com maior salario: ", funcionarios[posMaior].nome)
   escreval("Salario: ", funcionarios[posMaior].salario:0:2)
fimalgoritmo
