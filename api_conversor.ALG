Algoritmo "semnome"


Var
selecao, n1, resto, i, decimal, potencia, k,j, grupo, tamanho: inteiro
array, octal, hex: vetor[1..1000] de inteiro
h: vetor[1..1000] de caracter
quo: real
numero, resultadoHex, resultadoBinario: caractere


Inicio

escreval("Selecione a conversão")
escreval("1-Decimal para binário")
escreval("2-Binário para decimal")
escreval("3-Binário para octal")
escreval("4-Octal para binário")
escreval("5-Binário para hexadecimal")
escreval("6-Hexadecimal para binário")
leia(selecao)

se (selecao > 6) ou (selecao < 1) então
escreval("Escreva um valor válido")
leia(selecao)

senão

   escolha selecao

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
         escreval("")

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
         potencia <- n1 - 1

         para i de 1 ate n1 faca
            decimal <- decimal + array[i] * int(2 ^ potencia)
            potencia <- potencia - 1
         fimpara

         escreval("O valor decimal é: ", decimal)
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

      fimescolha
fimse

fimescolha

Fimalgoritmo