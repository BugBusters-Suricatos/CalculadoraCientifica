Algoritmo "Calculadora Suricata"

Var
opcao, opcao2 : Caracter   // Opção de escolha
X,FLAG: LOGICO     // variáveis de controle
novonumero: inteiro
num1, num2, result: real

Procedimento continuacao
Inicio
Escreval("Opções:")
Escreval("1 - Continuar operação")
Escreval("2 - Menu principal")
Escreval("3 - Finalizar o programa")
LEIA(opcao2)
Escolha(opcao2)
Caso "1"
num1 := result
Escreval("Continuando a operação:")
Escreval("1 - Adição")
Escreval("2 - Subtração")
Escreval("3 - Multiplicação")
Escreval("4 - Divisão ")
Escreva("Digite a opção:")
leia(opcao)
Escreva("Digite outro número para a operação:")
leia(num2)
Escolha(opcao)
Caso "1"
result := num1+num2
Escreval(num1," +",num2," =", result)
Caso "2"
result := num1-num2
Escreval(num1," -",num2," =", result)
Caso "3"
result := num1*num2
Escreval(num1," x",num2," =", result)
Caso "4"
se num2 = 0 então
result:=0
escreval("Não existe divisão por zero!")
escreval("Digite [Enter]")
leia(X)
menuprincipal
senao
result := num1/num2
Escreval(num1," /",num2," =", result)
continuacao
fimse
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
result := num1+num2
Escreval(num1," +",num2," =", result)
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
result := num1-num2
Escreval(num1," -",num2," =", result)
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
result := num1*num2
Escreval(num1," x",num2," =", result)
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
Escreval("tecle <enter>")
LEIA(X)
menuprincipal

senão
result := num1/num2
Escreval(num1," /",num2," =", result)
continuacao
fimse

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
Escreval("5 - Finalizar")
Escreval("  ")
Escreva("Digite a opção:")
Leia(opcao)
Escolha opcao
Caso "1"
adicao    // chama o procedimento
Caso "2"
subtracao    // chama o procedimento
Caso "3"
multiplicacao    // chama o procedimento
Caso "4"
divisao     // chama o procedimento
Caso "5"
FLAG := FALSO   // muda a variável do controle para encerrar o loop

OUTROCASO      // caso a variável tenha algum valor acima de 5 ou abaixo de 1
Escreval("Opção inválida")
Escreva("tecle <enter>")
LEIA(X)
Fimescolha

FimProcedimento

Inicio
FLAG := verdadeiro
ENQUANTO FLAG FAÇA
menuprincipal
FIMENQUANTO
Fimalgoritmo