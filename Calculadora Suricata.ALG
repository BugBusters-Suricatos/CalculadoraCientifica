Algoritmo "Calculadora Suricata"

Var
   a, b, c, opcao, opcao2: Caracter
   X, FLAG: LOGICO
   novonumero: inteiro
   num1, num2, result: real
   valorFat, fatorialValor, iFat: inteiro
   periodo, montante: real

funcao potencia(base: real; expoente: inteiro): real
var
   resultado: real
   i: inteiro
Inicio
   resultado <- 1
   para i de 1 ate expoente faca
      resultado <- resultado * base
   fimpara
   retorne resultado
fimfuncao

funcao FatorialPositivoOuNegativo(n: inteiro): inteiro
var
   tempFat: inteiro
   resultado: inteiro
Inicio
   tempFat <- n
   iFat <- n - 1
   enquanto iFat > 1 faca
      tempFat <- tempFat * iFat
      iFat <- iFat - 1
   fimenquanto
   resultado <- tempFat
   retorne resultado
fimfuncao

funcao fatorialContinuacao(n: inteiro): inteiro
var
   resultado: inteiro
Inicio
   se (n = 0) entao
      resultado <- 1
   senao
      se (n > 0) entao
         resultado <- FatorialPositivoOuNegativo(n)
      senao
         resultado <- 1 / FatorialPositivoOuNegativo(-n)
      fimse
   fimse
   retorne resultado
fimfuncao

Procedimento jurosSimples
Inicio
   limpatela
   Escreval("Juros Simples")
   Escreva("Digite o valor principal (quanto você tem agora): ")
   Leia(num1)
   Escreva("Digite a taxa de juros (Ex: 5% = 0.05): ")
   Leia(num2)
   Escreva("Digite o período (em anos): ")
   Leia(periodo)
   result := num1 * num2 * periodo
   Escreval("O total de juros é: ", result)
   continuacao
FimProcedimento

Procedimento jurosCompostos
Inicio
   limpatela
   Escreval("Juros Compostos")
   Escreva("Digite o valor principal (quanto você tem agora): ")
   Leia(num1)
   Escreva("Digite a taxa de juros (Ex: 5% = 0.05): ")
   Leia(num2)
   Escreva("Digite o período (em anos): ")
   Leia(periodo)
   montante := num1 * potencia(1 + num2, periodo)
   result := montante - num1
   Escreval("O total de juros é: ", result)
   Escreval("Montante total: ", montante)
   continuacao
FimProcedimento

Procedimento continuaconcat
Inicio
   Escreval(" ")
   Escreval("Opções:")
   Escreval("1 - Continuar operação")
   Escreval("2 - Menu principal")
   Escreval("3 - Finalizar o programa")
   LEIA(opcao2)
   Escreval("  ")
   Escolha(opcao2)
      Caso "1"
      escreva ("Escreva a próxima string: ")
      leia (b)
      c := (a + b)
      escreva("O resultado é: ", c)
      Escreval("  ")
      a := c
      continuaconcat
   Caso "2"
      menuprincipal
   Caso "3"
      Fimalgoritmo
   Fimescolha
FimProcedimento

Procedimento continuacao
Inicio
   Escreval("  ")
   Escreval("Opções:")
   Escreval("1 - Continuar operação")
   Escreval("2 - Menu principal")
   Escreval("3 - Finalizar o programa")
   LEIA(opcao2)
   Escreval("  ")
   Escolha(opcao2)
      Caso "1"
         Escreval("Continuando a operação:")
         Escreval("1 - Adição")
         Escreval("2 - Subtração")
         Escreval("3 - Multiplicação")
         Escreval("4 - Divisão ")
         Escreval("5 - Juros Simples")
         Escreval("6 - Juros Compostos")
         Escreva("Digite a opção:")
         leia(opcao)
         num1 := result
         Escolha(opcao)
            Caso "1"
                  Escreva("Digite outro número para a operação:")
               leia(num2)
               result := num1 + num2
               Escreval(num1, " + ", num2, " = ", result)
               continuacao
            Caso "2"
                   Escreva("Digite outro número para a operação:")
               leia(num2)
               result := num1 - num2
               Escreval(num1, " - ", num2, " = ", result)
               continuacao
            Caso "3"
                 Escreva("Digite outro número para a operação:")
               leia(num2)
               result := num1 * num2
               Escreval(num1, " x ", num2, " = ", result)
               continuacao
            Caso "4"
                  Escreva("Digite outro número para a operação:")
               leia(num2)
               se num2 = 0 então
                  Escreval("Não existe divisão por zero!")
                  Escreval("Digite [Enter]")
                  leia(X)
                  menuprincipal
               senao
                  result := num1 / num2
                  Escreval(num1, " / ", num2, " = ", result)
                  continuacao
               fimse
            Caso "5"
               Escreva("Digite a taxa de juros (Ex: 5% = 0.05): ")
   Leia(num2)
   Escreva("Digite o período (em anos): ")
   Leia(periodo)
   result := num1 * num2 * periodo
   Escreval("O total de juros é: ", result)
   continuacao
            Caso "6"
               Escreva("Digite a taxa de juros (Ex: 5% = 0.05): ")
   Leia(num2)
   Escreva("Digite o período (em anos): ")
   Leia(periodo)
   montante := num1 * potencia(1 + num2, periodo)
   result := montante - num1
   Escreval("O total de juros é: ", result)
   Escreval("Montante total: ", montante)
   continuacao
         Fimescolha
      Caso "2"
         menuprincipal
      Caso "3"
         Fimalgoritmo
   Fimescolha
FimProcedimento

Procedimento adicao
Inicio
   limpatela
   Escreval("Adição")
   Escreva("Digite o primeiro número:")
   LEIA(num1)
   Escreva("Digite o segundo número:")
   LEIA(num2)
   result := num1 + num2
   Escreval(num1, " + ", num2, " = ", result)
   continuacao
FimProcedimento

Procedimento subtracao
Inicio
   limpatela
   Escreval("Subtração")
   Escreva("Digite o primeiro número:")
   LEIA(num1)
   Escreva("Digite o segundo número:")
   LEIA(num2)
   result := num1 - num2
   Escreval(num1, " - ", num2, " = ", result)
   continuacao
FimProcedimento

Procedimento multiplicacao
Inicio
   limpatela
   Escreval("Multiplicação")
   Escreva("Digite o primeiro número:")
   LEIA(num1)
   Escreva("Digite o segundo número:")
   LEIA(num2)
   result := num1 * num2
   Escreval(num1, " x ", num2, " = ", result)
   continuacao
FimProcedimento

Procedimento divisao
Inicio
   limpatela
   Escreval("Divisão")
   Escreva("Digite o primeiro número:")
   LEIA(num1)
   Escreva("Digite o segundo número:")
   LEIA(num2)
   se num2 = 0 então
      Escreval("Não existe divisão por ZERO")
      Escreval("Tecle <enter>")
      LEIA(X)
      menuprincipal
   senao
      result := num1 / num2
      Escreval(num1, " / ", num2, " = ", result)
      continuacao
   fimse
FimProcedimento

Procedimento fatorial
Inicio
   limpatela
   fatorialValor <- 0
   Escreval("Fatorial")
   Escreval("Digite o número:")
   Leia(valorFat)
   se (valorFat = 0) entao
      valorFat <- 1
   senao
      se (valorFat > 0) entao
         num1 <- FatorialPositivoOuNegativo(valorFat)
      senao
         num1 <- (1 / FatorialPositivoOuNegativo(-valorFat))
      fimse
   fimse
   result := num1
   Escreval("O Fatorial de ", valorFat, " é ", num1)
   continuacao
FimProcedimento

procedimento concatenacao
inicio
   limpatela
   escreva ("Escreva a primeira string: ")
   leia (a)
   escreva ("Escreva a segunda string: ")
   leia (b)
   c := a+b
   escreva("O resultado é: ", c)
   a := c
   Escreval("  ")
   continuaconcat
FimProcedimento

Procedimento menuprincipal
Inicio
   X := VERDADEIRO
   limpatela
   Escreval("*** Menu ***")
   Escreval("1 - Adição")
   Escreval("2 - Subtração")
   Escreval("3 - Multiplicação")
   Escreval("4 - Divisão ")
   Escreval("5 - Fatorial ")
   Escreval("6 - Juros Simples")
   Escreval("7 - Juros Compostos")
   Escreval("8 - Concatenação de String")
   Escreval("9 - Finalizar")
   Escreval("  ")
   Escreva("Digite a opção:")
   Leia(opcao)
   Escolha opcao
      Caso "1"
         adicao
      Caso "2"
         subtracao
      Caso "3"
         multiplicacao
      Caso "4"
         divisao
      Caso "5"
         fatorial
      Caso "6"
         jurosSimples
      Caso "7"
         jurosCompostos
      Caso "8"
         concatenacao
      Caso "9"
         FLAG := FALSO
      OutroCaso
         Escreval("Opção inválida")
         Escreva("tecle <enter>")
         LEIA(X)
   Fimescolha
FimProcedimento

Inicio
   FLAG := verdadeiro
   enquanto FLAG faca
      menuprincipal
   fimenquanto
Fimalgoritmo
