algoritmo "MedControl"
// Reune os dados usados para identificar e acompanhar cada paciente.
tipo
   Paciente = registro
      codigo: inteiro
      nome: caractere
      idade: inteiro
      sexo: caractere
      prioridade: inteiro
      pressaoSistolica: real
      pressaoDiastolica: real
      temperatura: real
      status: inteiro
      ordemCadastro: inteiro
   fimregistro

var
   // Os codigos de prioridade e status sao definidos no inicio, ja que o VisuAlg nao oferece constantes.
   // Como vetores e matrizes nao podem ser passados como parametros, as sub-rotinas acessam essas estruturas diretamente.
   // Se MAX_PACIENTES mudar, ajuste tambem os limites dos vetores.
   MAX_PACIENTES, EMERGENCIA, MUITO_URGENTE, URGENTE, POUCO_URGENTE: inteiro
   AGUARDANDO, ATENDIDO: inteiro
   COL_CADASTRADOS, COL_AGUARDANDO, COL_ATENDIDOS, COL_SOMA_IDADES: inteiro
   pacientes: vetor[1..30] de Paciente
   fila: vetor[1..30] de Paciente
   // As linhas representam prioridades; as colunas guardam totais e a soma das idades.
   estatisticas: vetor[1..4,1..4] de real
   quantidadePacientes: inteiro
   quantidadeFila: inteiro
   opcao: inteiro
// Procura o codigo do paciente, verificando uma posicao a cada chamada.
funcao localizarPacienteRecursivo(codigoProcurado, posicaoAtual, quantidade: inteiro): inteiro
inicio
   // A busca termina quando todas as posicoes cadastradas ja foram verificadas.
   se posicaoAtual > quantidade entao
      retorne -1
   senao
      // Se o codigo estiver nesta posicao, devolve o indice encontrado.
      se pacientes[posicaoAtual].codigo = codigoProcurado entao
         retorne posicaoAtual
      senao
         // Caso contrario, continua a busca na proxima posicao.
         retorne localizarPacienteRecursivo(codigoProcurado, posicaoAtual + 1, quantidade)
      fimse
   fimse
fimfuncao
// Conta quantos pacientes ainda aguardam atendimento usando recursao.
funcao quantidadeAguardandoRecursivo(posicaoAtual, quantidade: inteiro): inteiro
inicio
   // A contagem termina quando todas as posicoes cadastradas forem verificadas.
   se posicaoAtual > quantidade entao
      retorne 0
   senao
      se pacientes[posicaoAtual].status = AGUARDANDO entao
         retorne 1 + quantidadeAguardandoRecursivo(posicaoAtual + 1, quantidade)
      senao
         retorne quantidadeAguardandoRecursivo(posicaoAtual + 1, quantidade)
      fimse
   fimse
fimfuncao
// Procura um codigo percorrendo os pacientes cadastrados em sequencia.
funcao localizarPaciente(codigoProcurado, quantidade: inteiro): inteiro
var
   i: inteiro
inicio
   para i de 1 ate quantidade faca
      se pacientes[i].codigo = codigoProcurado entao
         retorne i
      fimse
   fimpara
   retorne -1
fimfuncao
// Exibe os dados do paciente encontrado.
procedimento mostrarPaciente(posicao: inteiro)
inicio
   escreval("Codigo: ", pacientes[posicao].codigo)
   escreval("Nome: ", pacientes[posicao].nome)
   escreval("Idade: ", pacientes[posicao].idade)
   escreval("Sexo: ", pacientes[posicao].sexo)
   escreval("Prioridade: ", pacientes[posicao].prioridade)
   escreval("Pressao sistolica: ", pacientes[posicao].pressaoSistolica)
   escreval("Pressao diastolica: ", pacientes[posicao].pressaoDiastolica)
   escreval("Temperatura: ", pacientes[posicao].temperatura)
   se pacientes[posicao].status = AGUARDANDO entao
      escreval("Status: Aguardando atendimento")
   senao
      escreval("Status: Atendido")
   fimse
fimprocedimento
// Atualiza as estatisticas com base nos pacientes cadastrados.
procedimento atualizarEstatisticas(quantidade: inteiro)
var
   i, prioridade: inteiro
inicio
   para i de 1 ate 4 faca
      estatisticas[i,COL_CADASTRADOS] <- 0
      estatisticas[i,COL_AGUARDANDO] <- 0
      estatisticas[i,COL_ATENDIDOS] <- 0
      estatisticas[i,COL_SOMA_IDADES] <- 0
   fimpara

   para i de 1 ate quantidade faca
      prioridade <- pacientes[i].prioridade
      estatisticas[prioridade,COL_CADASTRADOS] <- estatisticas[prioridade,COL_CADASTRADOS] + 1
      estatisticas[prioridade,COL_SOMA_IDADES] <- estatisticas[prioridade,COL_SOMA_IDADES] + pacientes[i].idade
      se pacientes[i].status = AGUARDANDO entao
         estatisticas[prioridade,COL_AGUARDANDO] <- estatisticas[prioridade,COL_AGUARDANDO] + 1
      senao
         estatisticas[prioridade,COL_ATENDIDOS] <- estatisticas[prioridade,COL_ATENDIDOS] + 1
      fimse
   fimpara
fimprocedimento
// Cadastra um paciente depois de conferir se os dados informados sao validos.
procedimento cadastrarPaciente
var
   codigoInformado, posicaoNova: inteiro
   sexoInformado: caractere
inicio
   escreval("----------------------------------------")
   escreval("CADASTRO DE PACIENTE")
   escreval("----------------------------------------")
   se quantidadePacientes >= MAX_PACIENTES entao
      escreval("A capacidade maxima de pacientes foi atingida.")
   senao
      escreva("Codigo positivo do paciente: ")
      leia(codigoInformado)
      enquanto codigoInformado <= 0 faca
         escreval("O codigo precisa ser maior que zero.")
         escreva("Informe outro codigo: ")
         leia(codigoInformado)
      fimenquanto

      enquanto localizarPaciente(codigoInformado, quantidadePacientes) <> -1 faca
         escreval("Esse codigo ja esta cadastrado.")
         escreva("Informe um codigo diferente: ")
         leia(codigoInformado)
         enquanto codigoInformado <= 0 faca
            escreval("O codigo precisa ser maior que zero.")
            escreva("Informe outro codigo: ")
            leia(codigoInformado)
         fimenquanto
      fimenquanto

      posicaoNova <- quantidadePacientes + 1
      pacientes[posicaoNova].codigo <- codigoInformado
      escreva("Nome do paciente: ")
      leia(pacientes[posicaoNova].nome)

      escreva("Idade (zero ou maior): ")
      leia(pacientes[posicaoNova].idade)
      enquanto pacientes[posicaoNova].idade < 0 faca
         escreval("A idade nao pode ser negativa.")
         escreva("Informe novamente: ")
         leia(pacientes[posicaoNova].idade)
      fimenquanto

      escreva("Sexo (M, F ou O): ")
      leia(sexoInformado)
      enquanto (sexoInformado <> "M") e (sexoInformado <> "F") e (sexoInformado <> "O") faca
         escreval("Use M, F ou O.")
         escreva("Informe novamente: ")
         leia(sexoInformado)
      fimenquanto
      pacientes[posicaoNova].sexo <- sexoInformado
      escreva("Prioridade (1 Emergencia, 2 Muito urgente, 3 Urgente, 4 Pouco urgente): ")
      leia(pacientes[posicaoNova].prioridade)
      enquanto (pacientes[posicaoNova].prioridade < EMERGENCIA) ou (pacientes[posicaoNova].prioridade > POUCO_URGENTE) faca
         escreval("Prioridade invalida. Escolha um valor de 1 a 4.")
         escreva("Informe novamente: ")
         leia(pacientes[posicaoNova].prioridade)
      fimenquanto

      escreva("Pressao sistolica (valor maior que zero): ")
      leia(pacientes[posicaoNova].pressaoSistolica)
      enquanto pacientes[posicaoNova].pressaoSistolica <= 0 faca
         escreval("A pressao sistolica deve ser maior que zero.")
         escreva("Informe novamente: ")
         leia(pacientes[posicaoNova].pressaoSistolica)
      fimenquanto

      escreva("Pressao diastolica (valor maior que zero): ")
      leia(pacientes[posicaoNova].pressaoDiastolica)
      enquanto pacientes[posicaoNova].pressaoDiastolica <= 0 faca
         escreval("A pressao diastolica deve ser maior que zero.")
         escreva("Informe novamente: ")
         leia(pacientes[posicaoNova].pressaoDiastolica)
      fimenquanto

      escreva("Temperatura corporal (valor maior que zero): ")
      leia(pacientes[posicaoNova].temperatura)
      enquanto pacientes[posicaoNova].temperatura <= 0 faca
         escreval("A temperatura deve ser maior que zero.")
         escreva("Informe novamente: ")
         leia(pacientes[posicaoNova].temperatura)
      fimenquanto

      pacientes[posicaoNova].status <- AGUARDANDO
      pacientes[posicaoNova].ordemCadastro <- posicaoNova
      quantidadePacientes <- quantidadePacientes + 1
      atualizarEstatisticas(quantidadePacientes)
      escreval("Paciente cadastrado e aguardando atendimento.")
   fimse
fimprocedimento
// Exibe todos os pacientes na ordem em que foram cadastrados.
procedimento listarPacientes(quantidade: inteiro)
var
   i: inteiro
inicio
   escreval("----------------------------------------")
   escreval("PACIENTES CADASTRADOS")
   escreval("----------------------------------------")
   se quantidade = 0 entao
      escreval("Ainda nao ha pacientes cadastrados.")
   senao
      para i de 1 ate quantidade faca
         escreval("Posicao no cadastro: ", i)
         mostrarPaciente(i)
         escreval("----------------------------------------")
      fimpara
   fimse
fimprocedimento
// Procura e exibe um paciente pelo codigo.
procedimento consultarPaciente(quantidade: inteiro)
var
   codigoBusca, posicao: inteiro
inicio
   se quantidade = 0 entao
      escreval("Nao ha pacientes para consultar.")
   senao
      escreva("Informe o codigo do paciente: ")
      leia(codigoBusca)
      posicao <- localizarPaciente(codigoBusca, quantidade)
      se posicao = -1 entao
         escreval("Codigo nao encontrado.")
      senao
         escreval("Paciente encontrado na posicao ", posicao, ":")
         mostrarPaciente(posicao)
      fimse
   fimse
fimprocedimento
// Copia para a fila os pacientes que ainda aguardam atendimento.
procedimento copiarAguardando(quantidade: inteiro; var totalFila: inteiro)
var
   i: inteiro
inicio
   totalFila <- 0
   para i de 1 ate quantidade faca
      se pacientes[i].status = AGUARDANDO entao
         totalFila <- totalFila + 1
         // Copia todos os dados para manter o registro completo na fila.
         fila[totalFila].codigo <- pacientes[i].codigo
         fila[totalFila].nome <- pacientes[i].nome
         fila[totalFila].idade <- pacientes[i].idade
         fila[totalFila].sexo <- pacientes[i].sexo
         fila[totalFila].prioridade <- pacientes[i].prioridade
         fila[totalFila].pressaoSistolica <- pacientes[i].pressaoSistolica
         fila[totalFila].pressaoDiastolica <- pacientes[i].pressaoDiastolica
         fila[totalFila].temperatura <- pacientes[i].temperatura
         fila[totalFila].status <- pacientes[i].status
         fila[totalFila].ordemCadastro <- pacientes[i].ordemCadastro
      fimse
   fimpara
fimprocedimento
// Organiza a fila por prioridade, idade e ordem de cadastro.
procedimento ordenarFila(totalFila: inteiro)
var
   i, j, limite: inteiro
   trocar: logico
   auxiliar: Paciente
inicio
   se totalFila > 1 entao
      limite <- totalFila - 1
      para i de 1 ate limite faca
         para j de 1 ate limite - i + 1 faca
            trocar <- falso

            // O menor numero indica a maior prioridade.
            se fila[j].prioridade > fila[j + 1].prioridade entao
               trocar <- verdadeiro
            senao
               se fila[j].prioridade = fila[j + 1].prioridade entao
                  // Na mesma prioridade, o paciente mais velho vem primeiro.
                  se fila[j].idade < fila[j + 1].idade entao
                     trocar <- verdadeiro
                  senao
                     // Se a idade tambem empatar, vale a ordem de cadastro.
                     se (fila[j].idade = fila[j + 1].idade) e (fila[j].ordemCadastro > fila[j + 1].ordemCadastro) entao
                        trocar <- verdadeiro
                     fimse
                  fimse
               fimse
            fimse

            se trocar entao
               // Troca todos os dados para manter os registros completos.
               auxiliar.codigo <- fila[j].codigo
               auxiliar.nome <- fila[j].nome
               auxiliar.idade <- fila[j].idade
               auxiliar.sexo <- fila[j].sexo
               auxiliar.prioridade <- fila[j].prioridade
               auxiliar.pressaoSistolica <- fila[j].pressaoSistolica
               auxiliar.pressaoDiastolica <- fila[j].pressaoDiastolica
               auxiliar.temperatura <- fila[j].temperatura
               auxiliar.status <- fila[j].status
               auxiliar.ordemCadastro <- fila[j].ordemCadastro

               fila[j].codigo <- fila[j + 1].codigo
               fila[j].nome <- fila[j + 1].nome
               fila[j].idade <- fila[j + 1].idade
               fila[j].sexo <- fila[j + 1].sexo
               fila[j].prioridade <- fila[j + 1].prioridade
               fila[j].pressaoSistolica <- fila[j + 1].pressaoSistolica
               fila[j].pressaoDiastolica <- fila[j + 1].pressaoDiastolica
               fila[j].temperatura <- fila[j + 1].temperatura
               fila[j].status <- fila[j + 1].status
               fila[j].ordemCadastro <- fila[j + 1].ordemCadastro

               fila[j + 1].codigo <- auxiliar.codigo
               fila[j + 1].nome <- auxiliar.nome
               fila[j + 1].idade <- auxiliar.idade
               fila[j + 1].sexo <- auxiliar.sexo
               fila[j + 1].prioridade <- auxiliar.prioridade
               fila[j + 1].pressaoSistolica <- auxiliar.pressaoSistolica
               fila[j + 1].pressaoDiastolica <- auxiliar.pressaoDiastolica
               fila[j + 1].temperatura <- auxiliar.temperatura
               fila[j + 1].status <- auxiliar.status
               fila[j + 1].ordemCadastro <- auxiliar.ordemCadastro
            fimse
         fimpara
      fimpara
   fimse
fimprocedimento
// Monta e organiza a fila antes de exibi-la.
procedimento exibirFila(quantidade: inteiro)
var
   i: inteiro
inicio
   copiarAguardando(quantidade, quantidadeFila)
   escreval("----------------------------------------")
   escreval("FILA DE ATENDIMENTO")
   escreval("----------------------------------------")
   se quantidadeFila = 0 entao
      escreval("Nao ha pacientes aguardando atendimento.")
   senao
      ordenarFila(quantidadeFila)
      para i de 1 ate quantidadeFila faca
         escreval(i, " - Codigo: ", fila[i].codigo, " | Nome: ", fila[i].nome)
         escreval("    Idade: ", fila[i].idade, " | Prioridade: ", fila[i].prioridade)
      fimpara
   fimse
fimprocedimento
// Realiza o atendimento do primeiro paciente da fila organizada.
procedimento realizarAtendimento(quantidade: inteiro)
var
   codigoProximo, posicaoPaciente: inteiro
inicio
   copiarAguardando(quantidade, quantidadeFila)
   se quantidadeFila = 0 entao
      escreval("Nao ha pacientes aguardando atendimento.")
   senao
      ordenarFila(quantidadeFila)
      codigoProximo <- fila[1].codigo
      posicaoPaciente <- localizarPaciente(codigoProximo, quantidade)
      se posicaoPaciente > 0 entao
         se pacientes[posicaoPaciente].status = AGUARDANDO entao
            pacientes[posicaoPaciente].status <- ATENDIDO
            atualizarEstatisticas(quantidade)
            escreval("Atendimento realizado para:")
            mostrarPaciente(posicaoPaciente)
         senao
            escreval("O proximo paciente nao esta mais aguardando.")
         fimse
      senao
         escreval("Nao foi possivel localizar o proximo paciente.")
      fimse
   fimse
fimprocedimento
// Exibe somente os pacientes que ja foram atendidos.
procedimento exibirAtendidos(quantidade: inteiro)
var
   i, encontrados: inteiro
inicio
   encontrados <- 0
   escreval("----------------------------------------")
   escreval("PACIENTES ATENDIDOS")
   escreval("----------------------------------------")
   para i de 1 ate quantidade faca
      se pacientes[i].status = ATENDIDO entao
         encontrados <- encontrados + 1
         mostrarPaciente(i)
         escreval("----------------------------------------")
      fimse
   fimpara
   se encontrados = 0 entao
      escreval("Ainda nao houve atendimentos.")
   fimse
fimprocedimento
// Mostra totais, medias, idades minima e maxima e percentuais.
procedimento exibirEstatisticas(quantidade: inteiro)
var
   i: inteiro
   totalAguardando, totalAtendidos, prioridadeAlta: inteiro
   somaIdades, somaTemperaturas: real
   mediaIdade, mediaTemperatura: real
   maiorIdade, menorIdade: inteiro
   percentualAtendidos, percentualAguardando: real
inicio
   atualizarEstatisticas(quantidade)
   totalAguardando <- 0
   totalAtendidos <- 0
   prioridadeAlta <- 0
   somaIdades <- 0
   somaTemperaturas <- 0

   para i de 1 ate quantidade faca
      somaIdades <- somaIdades + pacientes[i].idade
      somaTemperaturas <- somaTemperaturas + pacientes[i].temperatura
      se pacientes[i].status = AGUARDANDO entao
         totalAguardando <- totalAguardando + 1
      senao
         totalAtendidos <- totalAtendidos + 1
      fimse
      se (pacientes[i].prioridade = EMERGENCIA) ou (pacientes[i].prioridade = MUITO_URGENTE) entao
         prioridadeAlta <- prioridadeAlta + 1
      fimse
   fimpara

   escreval("----------------------------------------")
   escreval("ESTATISTICAS DO SISTEMA")
   escreval("----------------------------------------")
   escreval("Total de pacientes: ", quantidade)
   escreval("Aguardando: ", totalAguardando)
   escreval("Atendidos: ", totalAtendidos)
   escreval("Pacientes com prioridade 1 ou 2: ", prioridadeAlta)

   escreval("Por prioridade:")
   escreval("Emergencia - cadastrados: ", estatisticas[EMERGENCIA,COL_CADASTRADOS], " | aguardando: ", estatisticas[EMERGENCIA,COL_AGUARDANDO], " | atendidos: ", estatisticas[EMERGENCIA,COL_ATENDIDOS])
   escreval("Muito urgente - cadastrados: ", estatisticas[MUITO_URGENTE,COL_CADASTRADOS], " | aguardando: ", estatisticas[MUITO_URGENTE,COL_AGUARDANDO], " | atendidos: ", estatisticas[MUITO_URGENTE,COL_ATENDIDOS])
   escreval("Urgente - cadastrados: ", estatisticas[URGENTE,COL_CADASTRADOS], " | aguardando: ", estatisticas[URGENTE,COL_AGUARDANDO], " | atendidos: ", estatisticas[URGENTE,COL_ATENDIDOS])
   escreval("Pouco urgente - cadastrados: ", estatisticas[POUCO_URGENTE,COL_CADASTRADOS], " | aguardando: ", estatisticas[POUCO_URGENTE,COL_AGUARDANDO], " | atendidos: ", estatisticas[POUCO_URGENTE,COL_ATENDIDOS])
   escreval("Soma das idades da prioridade 3: ", estatisticas[URGENTE,COL_SOMA_IDADES])

   se quantidade > 0 entao
      mediaIdade <- somaIdades / quantidade
      mediaTemperatura <- somaTemperaturas / quantidade
      maiorIdade <- pacientes[1].idade
      menorIdade <- pacientes[1].idade
      para i de 2 ate quantidade faca
         se pacientes[i].idade > maiorIdade entao
            maiorIdade <- pacientes[i].idade
         fimse
         se pacientes[i].idade < menorIdade entao
            menorIdade <- pacientes[i].idade
         fimse
      fimpara
      percentualAtendidos <- totalAtendidos * 100 / quantidade
      percentualAguardando <- totalAguardando * 100 / quantidade
      escreval("Media de idade: ", mediaIdade)
      escreval("Media de temperatura: ", mediaTemperatura)
      escreval("Maior idade: ", maiorIdade)
      escreval("Menor idade: ", menorIdade)
      escreval("Percentual atendido: ", percentualAtendidos, "%")
      escreval("Percentual aguardando: ", percentualAguardando, "%")
   senao
      escreval("As medias e os percentuais ainda nao podem ser calculados.")
      escreval("Maior idade: nao disponivel")
      escreval("Menor idade: nao disponivel")
   fimse
fimprocedimento
// Procura um paciente e conta, por recursao, quantos ainda aguardam.
procedimento executarConsultaRecursiva(quantidade: inteiro)
var
   codigoBusca, posicaoEncontrada, aguardando: inteiro
inicio
   se quantidade = 0 entao
      escreval("Nao ha pacientes para pesquisar.")
   senao
      escreva("Codigo para busca recursiva: ")
      leia(codigoBusca)
      posicaoEncontrada <- localizarPacienteRecursivo(codigoBusca, 1, quantidade)
      se nao (posicaoEncontrada = -1) entao
         escreval("Paciente encontrado na posicao ", posicaoEncontrada, ":")
         mostrarPaciente(posicaoEncontrada)
      senao
         escreval("A busca recursiva nao encontrou esse codigo.")
      fimse
      aguardando <- quantidadeAguardandoRecursivo(1, quantidade)
      escreval("Quantidade aguardando, calculada recursivamente: ", aguardando)
   fimse
fimprocedimento
// Apresenta as opcoes e repete o menu ate o usuario encerrar o sistema.
inicio
   MAX_PACIENTES <- 30
   EMERGENCIA <- 1
   MUITO_URGENTE <- 2
   URGENTE <- 3
   POUCO_URGENTE <- 4
   AGUARDANDO <- 0
   ATENDIDO <- 1
   COL_CADASTRADOS <- 1
   COL_AGUARDANDO <- 2
   COL_ATENDIDOS <- 3
   COL_SOMA_IDADES <- 4
   quantidadePacientes <- 0
   quantidadeFila <- 0
   opcao <- 0
   atualizarEstatisticas(quantidadePacientes)

   enquanto opcao <> 9 faca
      escreval("")
      escreval("========================================")
      escreval("MEDCONTROL - GERENCIAMENTO DE ATENDIMENTOS")
      escreval("========================================")
      escreval("1. Cadastrar paciente")
      escreval("2. Listar pacientes")
      escreval("3. Consultar paciente")
      escreval("4. Exibir fila de atendimento")
      escreval("5. Realizar atendimento")
      escreval("6. Exibir pacientes atendidos")
      escreval("7. Exibir estatisticas")
      escreval("8. Executar consulta recursiva")
      escreval("9. Encerrar sistema")
      escreva("Escolha uma opcao: ")
      leia(opcao)

      escolha opcao
         caso 1
            cadastrarPaciente
         caso 2
            listarPacientes(quantidadePacientes)
         caso 3
            consultarPaciente(quantidadePacientes)
         caso 4
            exibirFila(quantidadePacientes)
         caso 5
            realizarAtendimento(quantidadePacientes)
         caso 6
            exibirAtendidos(quantidadePacientes)
         caso 7
            exibirEstatisticas(quantidadePacientes)
         caso 8
            executarConsultaRecursiva(quantidadePacientes)
         caso 9
            escreval("Sistema encerrado.")
         outrocaso
            escreval("Opcao inexistente. Escolha um valor de 1 a 9.")
      fimescolha
   fimenquanto
fimalgoritmo

