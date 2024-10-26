Algoritmo "Calculadora Suricata"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Antonio Carlos Nicolodi 

Var
   string1, string2, stringfinal, opcao, opcao2, numero, resultadoHex, resultadoBinario: Caracter
   X, FLAG: LOGICO
   novonumero, selecao, n1, resto, i, decimal, potenciac, k,j, grupo, tamanho: inteiro
   num1, num2, result, quo: real
   valorFat, fatorialValor, iFat: inteiro
   periodo, montante: real
   array, octal, hex: vetor[1..1000] de inteiro
   h: vetor[1..1000] de caracter

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

Procedimento conversoes
Inicio
   limpatela
   escreval("Selecione a conversão")
   escreval("1 - Decimal para binário")
   escreval("2 - Binário para decimal")
   escreval("3 - Binário para octal")
   escreval("4 - Octal para binário")
   escreval("5 - Binário para hexadecimal")
   escreval("6 - Hexadecimal para binário")
   escreval("7 - Menu Principal")
   escreval("8 - Finalizar o programa")
   leia(selecao)
   Escolha(selecao)
   caso 1
            repita
            escreval("Digite um número inteiro e positivo que deseja converter:")
            leia(n1)

            se n1 < 0 entao
               escreval("Número inválido!")
               leia() // Aguarda ENTER para continuar
            fimse
         ate n1 >= 0
         
         // Conversão do número para binário
         quo := n1
         i := 1

         repita
          resto:= quo%2
          array[i] <- resto
          quo := quo/2
          i := i + 1
         até quo < 1

         escreval("O valor binário é: ")
         para i de i - 1 ate 1 passo -1 faca
            escreva(array[i])
         fimpara
         Escreval(" ")
         Escreval("tecle <enter>")
         LEIA(X)

         caso 2
              repita
               escreval("Informe a quantidade de dígitos binários (até 100):")
               leia(n1)

               se (n1 < 1) ou (n1 > 100) entao
                  escreval("Quantidade inválida! tente novamente.")
                  leia()
               fimse
            ate (n1 >= 1) e (n1 <= 100)

            para i de 1 ate n1 faca
               repita
                  escreva("Digite o dígito binário (0 ou 1): ")
                  leia(array[i])

                  se (array[i] <> 0) e (array[i] <> 1) entao
                     escreval("Dígito inválido! .")
                     leia()
                  fimse
               ate (array[i] = 0) ou (array[i] = 1)
            fimpara

            decimal <- 0
            potenciac <- n1 - 1

            para i de 1 ate n1 faca
               decimal := decimal + array[i] * int(2 ^ potenciac)
               potenciac := potenciac - 1
            fimpara

            escreval("O valor decimal é: ", decimal)
            Escreval(" ")
            Escreval("tecle <enter>")
            LEIA(X)
            
            caso 3
             // Laço para garantir que o número de dígitos é válido
         repita
            escreval("Informe a quantidade de dígitos que o número possui (0 a 100):")
            leia(n1)

            se (n1 < 0) ou (n1 > 100) então
               escreval("O número deve estar entre 0 e 100. Tente novamente.")
            fimse
         até (n1 >= 0) e (n1 <= 100)

         // Laço para garantir que cada dígito binário é válido
         para i de 1 ate n1 faca
            repita
               escreva("Digite o dígito binário (0 ou 1): ")
               leia(array[i])

               se (array[i] <> 0) e (array[i] <> 1) então
                  escreval("Dígito inválido! Digite 0 ou 1.")
               fimse
            até (array[i] = 0) ou (array[i] = 1)
         fimpara

         k <- 1
         grupo <- 0

         // Conversão de binário para octal
         para i de n1 ate 1 passo -1 faca
            grupo <- grupo + array[i] * int(2 ^ ((n1 - i) % 3))
            se ((n1 - i) % 3 = 2) ou (i = 1) então
               Octal[k] <- grupo
               k <- k + 1
               grupo <- 0
            fimse
         fimpara

         // Exibição do resultado
         escreval("O valor octal é: ")
         para i de k - 1 ate 1 passo -1 faca
            escreva(Octal[i])
         fimpara
         Escreval(" ")
         Escreval("tecle <enter>")
         LEIA(X)

      caso 4
           // Laço para garantir que o número de dígitos é válido
         repita
            escreval("Informe a quantidade de dígitos que o número possui (0 a 100):")
            leia(n1)

            se (n1 < 0) ou (n1 > 100) então
               escreval("O número deve estar entre 0 e 100. Tente novamente.")
            fimse
         até (n1 >= 0) e (n1 <= 100)

         // Laço para garantir que cada dígito octal é válido
         para i de 1 ate n1 faca
            repita
               escreva("Digite o dígito octal (0 a 7): ")
               leia(Octal[i])

               se (Octal[i] < 0) ou (Octal[i] > 7) então
                  escreval("Dígito inválido! Digite um número entre 0 e 7.")
               fimse
            até (Octal[i] >= 0) e (Octal[i] <= 7)
         fimpara

         j <- 1
         // Conversão de octal para binário
         para i de 1 ate n1 faca
            escolha Octal[i]
               caso 0
                  array[j] <- 0
                  array[j+1] <- 0
                  array[j+2] <- 0
               caso 1
                  array[j] <- 0
                  array[j+1] <- 0
                  array[j+2] <- 1
               caso 2
                  array[j] <- 0
                  array[j+1] <- 1
                  array[j+2] <- 0
               caso 3
                  array[j] <- 0
                  array[j+1] <- 1
                  array[j+2] <- 1
               caso 4
                  array[j] <- 1
                  array[j+1] <- 0
                  array[j+2] <- 0
               caso 5
                  array[j] <- 1
                  array[j+1] <- 0
                  array[j+2] <- 1
               caso 6
                  array[j] <- 1
                  array[j+1] <- 1
                  array[j+2] <- 0
               caso 7
                  array[j] <- 1
                  array[j+1] <- 1
                  array[j+2] <- 1
            fimescolha
            j <- j + 3
         fimpara

         // Exibição do resultado
         escreval("O valor binário é: ")
         para i de 1 ate j - 1 faca
            escreva(array[i])
         fimpara
         Escreval(" ")
         Escreval("tecle <enter>")
         LEIA(X)

      caso 5
        repita
            escreval("Digite a quantidade de dígitos binários que deseja converter (0 a 100):")
            leia(n1)

            se (n1 < 0) ou (n1 > 100) então
               escreval("A quantidade deve estar entre 0 e 100. Tente novamente.")
            fimse
         até (n1 >= 0) e (n1 <= 100)

         // Laço para garantir que cada dígito binário é válido
         para i de 1 ate n1 faca
            repita
               escreva("Digite o dígito binário (0 ou 1): ")
               leia(array[i])

               se (array[i] <> 0) e (array[i] <> 1) então
                  escreval("Dígito inválido! Digite 0 ou 1.")
               fimse
            até (array[i] = 0) ou (array[i] = 1)
         fimpara

         j <- 1
         tamanho <- n1

         // Conversão de binário para hexadecimal
         para i de tamanho ate 1 passo -4 faca
            se i - 3 > 0 então
               hex[j] <- array[i] * 1 + array[i-1] * 2 + array[i-2] * 4 + array[i-3] * 8
            senao
               se i - 2 > 0 então
                  hex[j] <- array[i] * 1 + array[i-1] * 2 + array[i-2] * 4
               senao
                  se i - 1 > 0 então
                     hex[j] <- array[i] * 1 + array[i-1] * 2
                  senao
                     hex[j] <- array[i]
                  fimse
               fimse
            fimse
            j <- j + 1
         fimpara

         resultadoHex <- ""
         // Conversão de decimal para hexadecimal
         para i de j - 1 ate 1 passo -1 faca
            escolha hex[i]
               caso 0
                  resultadoHex <- resultadoHex + "0"
               caso 1
                  resultadoHex <- resultadoHex + "1"
               caso 2
                  resultadoHex <- resultadoHex + "2"
               caso 3
                  resultadoHex <- resultadoHex + "3"
               caso 4
                  resultadoHex <- resultadoHex + "4"
               caso 5
                  resultadoHex <- resultadoHex + "5"
               caso 6
                  resultadoHex <- resultadoHex + "6"
               caso 7
                  resultadoHex <- resultadoHex + "7"
               caso 8
                  resultadoHex <- resultadoHex + "8"
               caso 9
                  resultadoHex <- resultadoHex + "9"
               caso 10
                  resultadoHex <- resultadoHex + "A"
               caso 11
                  resultadoHex <- resultadoHex + "B"
               caso 12
                  resultadoHex <- resultadoHex + "C"
               caso 13
                  resultadoHex <- resultadoHex + "D"
               caso 14
                  resultadoHex <- resultadoHex + "E"
               caso 15
                  resultadoHex <- resultadoHex + "F"
               outrocaso
                  resultadoHex <- resultadoHex + carac(hex[i])
            fimescolha
         fimpara

         // Exibição do resultado
         escreval("O valor hexadecimal é: ", resultadoHex)
         Escreval(" ")
         Escreval("tecle <enter>")
         LEIA(X)

      caso 6
       // Laço para garantir que o número de dígitos é válido
   repita
      escreval("Informe a quantidade de dígitos que o número possui (1 a 100):")
      leia(n1)

      se (n1 < 1) ou (n1 > 100) então
         escreval("A quantidade deve estar entre 1 e 100. Tente novamente.")
      fimse
   até (n1 >= 1) e (n1 <= 100)

   // Laço para garantir que cada dígito hexadecimal é válido
   para i de 1 ate n1 faca
      repita
         escreva("Digite o dígito hexadecimal (0-9, A-F): ")
         leia(h[i])
         h[i] <- maiusc(h[i]) // Converte para maiúsculas

         se (h[i] < "0") ou (h[i] > "9") e (h[i] < "A") ou (h[i] > "F") então
            escreval("Dígito inválido! Digite um dígito hexadecimal válido (0-9, A-F).")
         fimse
      até ((h[i] >= "0") e (h[i] <= "9")) ou ((h[i] >= "A") e (h[i] <= "F"))
   fimpara

   resultadoBinario <- ""

   // Conversão de hexadecimal para binário
   para i de 1 ate n1 faca
      escolha h[i]
         caso "0"
            resultadoBinario <- resultadoBinario + "0000"
         caso "1"
            resultadoBinario <- resultadoBinario + "0001"
         caso "2"
            resultadoBinario <- resultadoBinario + "0010"
         caso "3"
            resultadoBinario <- resultadoBinario + "0011"
         caso "4"
            resultadoBinario <- resultadoBinario + "0100"
         caso "5"
            resultadoBinario <- resultadoBinario + "0101"
         caso "6"
            resultadoBinario <- resultadoBinario + "0110"
         caso "7"
            resultadoBinario <- resultadoBinario + "0111"
         caso "8"
            resultadoBinario <- resultadoBinario + "1000"
         caso "9"
            resultadoBinario <- resultadoBinario + "1001"
         caso "A"
            resultadoBinario <- resultadoBinario + "1010"
         caso "B"
            resultadoBinario <- resultadoBinario + "1011"
         caso "C"
            resultadoBinario <- resultadoBinario + "1100"
         caso "D"
            resultadoBinario <- resultadoBinario + "1101"
         caso "E"
            resultadoBinario <- resultadoBinario + "1110"
         caso "F"
            resultadoBinario <- resultadoBinario + "1111"
      fimescolha
   fimpara

   // Exibição do resultado
   escreval("O valor binário é: ", resultadoBinario)
         Escreval(" ")
         Escreval("tecle <enter>")
         LEIA(X)
         
         Caso 7
         menuprincipal
         
         Caso 8
         fimalgoritmo
            
         OutroCaso
            Escreval("Opção inválida")
            Escreva("tecle <enter>")
            LEIA(X)
            conversoes
   Fimescolha
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
      leia (string2)
      stringfinal := (string1 + string2)
      escreva("O resultado é: ", stringfinal)
      Escreval("  ")
      string1 := stringfinal
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
   leia (string1)
   escreva ("Escreva a segunda string: ")
   leia (string2)
   stringfinal := string1+string2
   escreva("O resultado é: ", stringfinal)
   string1 := stringfinal
   Escreval("  ")
   continuaconcat
FimProcedimento

Procedimento equacaoSegundo
var
   a, b, c, delta, x1, x2: real
Inicio
    limpatela
    escreval(" ")
    escreval("Considere a = x², b = x, c = -15. Exemplo: (x² + 2x -15 = 0)")
    escreval(" ")

    escreval("Digite o valor de a: ")
    leia(a)

    escreval("Digite o valor de b: ")
    leia(b)

    escreval("Digite o valor de c: ")
    leia(c)

    se (a = 0) entao
        escreval(" ")
        escreval("Não é uma equação do segundo grau.")
    senao
        delta := (b^2) - 4 * a * c

      se (delta < 0) entao
        escreval(" ")
        escreval("A equação não possui raízes reais.")
      senao
         x1 := (-b + raizq(delta)) / (2 * a)
         x2 := (-b - raizq(delta)) / (2 * a)

        escreval(" ")
        escreval("As raízes da equação são: x1 = ", x1, " e x2 = ", x2)
        escreval(" ")
      fimse
    fimse

    escreval(" ")
    escreval("Deseja realizar outra operação?")
    escreval("1 - Sim")
    escreval("2 - Não. Retornar ao Menu Principal")
    leia(opcao)

    Escolha opcao
        Caso "1"
           equacaoSegundo
        Caso "2"
           menuprincipal
    Fimescolha

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
   Escreval("9 - Conversões (Decimal/Binário/Octal/Hexadecimal)")
   Escreval("10 - Equação de Segundo Grau")
   Escreval("0 - Finalizar")
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
         conversoes
      Caso "10"
         equacaoSegundo
      Caso "0"
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

