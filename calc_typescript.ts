// Importa a biblioteca prompt-sync
const prompt = require('prompt-sync')();

// Declaração de variáveis e funções principais
var ultimoResultado = null; // Variável para armazenar o último resultado
var FLAG = true;

// Função de potência
function potencia(base, expoente) {
    var resultado = 1;
    for (var i = 1; i <= expoente; i++) {
        resultado *= base;
    }
    return resultado;
}

// Procedimento de Continuação
function continuacao(retornarConversoes = false) {
    console.log("\nOpções:");
    console.log("1 - Continuar operação");
    console.log("2 - Menu principal");
    console.log("3 - Finalizar o programa");
    const opcao = prompt("Escolha uma opção: ") || "2";
    switch (opcao) {
        case "1":
            if (retornarConversoes) {
                conversoes(); // Retorna ao menu de conversões
            } else {
                menuPrincipal(true); // Permite usar o último resultado
            }
            break;
        case "2":
            menuPrincipal();
            break;
        case "3":
            FLAG = false;
            break;
        default:
            console.log("Opção inválida");
            continuacao(retornarConversoes);
    }
}

// Menu principal
function menuPrincipal(usandoUltimoResultado = false) {
    console.clear();
    if (ultimoResultado !== null) {
        console.log(`Último resultado armazenado: ${ultimoResultado}`);
    }
    console.log("\n*** Menu ***");
    console.log("1 - Adição");
    console.log("2 - Subtração");
    console.log("3 - Multiplicação");
    console.log("4 - Divisão");
    console.log("5 - Fatorial");
    console.log("6 - Juros Simples");
    console.log("7 - Juros Compostos");
    console.log("8 - Concatenação de String");
    console.log("9 - Conversões (Decimal/Binário/Octal/Hexadecimal)");
    console.log("10 - Equação de Segundo Grau");
    console.log("0 - Finalizar");
    const opcao = prompt("Digite a opção: ") || "0";
    switch (opcao) {
        case "1":
            adicao(usandoUltimoResultado);
            break;
        case "2":
            subtracao(usandoUltimoResultado);
            break;
        case "3":
            multiplicacao(usandoUltimoResultado);
            break;
        case "4":
            divisao(usandoUltimoResultado);
            break;
        case "5":
            fatorial();
            break;
        case "6":
            jurosSimples();
            break;
        case "7":
            jurosCompostos();
            break;
        case "8":
            concatenacao();
            break;
        case "9":
            conversoes();
            break;
        case "10":
            equacaoSegundoGrau();
            break;
        case "0":
            FLAG = false;
            break;
        default:
            console.log("Opção inválida");
            menuPrincipal();
    }
}

// Funções Matemáticas
function obterNumero(ultimoResultado) {
    if (ultimoResultado !== null) {
        const usarUltimo = prompt(`Deseja usar o último resultado (${ultimoResultado}) como um dos números? (s/n): `).toLowerCase();
        if (usarUltimo === "s") {
            return ultimoResultado;
        }
    }
    return parseFloat(prompt("Digite o número: ") || "0");
}

function adicao(usandoUltimoResultado) {
    const num1 = usandoUltimoResultado ? obterNumero(ultimoResultado) : parseFloat(prompt("Digite o primeiro número: ") || "0");
    const num2 = parseFloat(prompt("Digite o segundo número: ") || "0");
    ultimoResultado = num1 + num2;
    console.log(`${num1} + ${num2} = ${ultimoResultado}`);
    continuacao();
}

function subtracao(usandoUltimoResultado) {
    const num1 = usandoUltimoResultado ? obterNumero(ultimoResultado) : parseFloat(prompt("Digite o primeiro número: ") || "0");
    const num2 = parseFloat(prompt("Digite o segundo número: ") || "0");
    ultimoResultado = num1 - num2;
    console.log(`${num1} - ${num2} = ${ultimoResultado}`);
    continuacao();
}

function multiplicacao(usandoUltimoResultado) {
    const num1 = usandoUltimoResultado ? obterNumero(ultimoResultado) : parseFloat(prompt("Digite o primeiro número: ") || "0");
    const num2 = parseFloat(prompt("Digite o segundo número: ") || "0");
    ultimoResultado = num1 * num2;
    console.log(`${num1} x ${num2} = ${ultimoResultado}`);
    continuacao();
}

function divisao(usandoUltimoResultado) {
    const num1 = usandoUltimoResultado ? obterNumero(ultimoResultado) : parseFloat(prompt("Digite o primeiro número: ") || "0");
    const num2 = parseFloat(prompt("Digite o segundo número: ") || "0");
    if (num2 === 0) {
        console.log("Não existe divisão por ZERO");
    } else {
        ultimoResultado = num1 / num2;
        console.log(`${num1} / ${num2} = ${ultimoResultado}`);
    }
    continuacao();
}

// Função de Fatorial
function fatorial() {
    const valor = parseInt(prompt("Digite o número para o fatorial: ") || "0");
    if (valor < 0) {
        console.log("Fatorial não é definido para números negativos.");
        continuacao();
        return;
    }
    ultimoResultado = 1;
    for (let i = 1; i <= valor; i++) {
        ultimoResultado *= i;
    }
    console.log(`O fatorial de ${valor} é ${ultimoResultado}`);
    continuacao();
}

// Função de Juros Simples
function jurosSimples() {
    const principal = parseFloat(prompt("Digite o valor principal: ") || "0");
    const taxa = parseFloat(prompt("Digite a taxa de juros (ex: 0.05 para 5%): ") || "0");
    const periodo = parseFloat(prompt("Digite o período (em anos): ") || "0");
    ultimoResultado = principal * taxa * periodo;
    console.log(`O total de juros simples é: ${ultimoResultado}`);
    continuacao();
}

// Função de Juros Compostos
function jurosCompostos() {
    const principal = parseFloat(prompt("Digite o valor principal: ") || "0");
    const taxa = parseFloat(prompt("Digite a taxa de juros (ex: 0.05 para 5%): ") || "0");
    const periodo = parseFloat(prompt("Digite o período (em anos): ") || "0");
    ultimoResultado = principal * Math.pow(1 + taxa, periodo);
    console.log(`O montante total com juros compostos é: ${ultimoResultado}`);
    continuacao();
}

// Função de Concatenação de Strings
function concatenacao() {
    const string1 = prompt("Digite a primeira string: ") || "";
    const string2 = prompt("Digite a segunda string: ") || "";
    ultimoResultado = string1 + string2;
    console.log(`O resultado da concatenação é: ${ultimoResultado}`);
    continuacao();
}

// Função de Equação de Segundo Grau
function equacaoSegundoGrau() {
    const a = parseFloat(prompt("Digite o valor de a: ") || "0");
    const b = parseFloat(prompt("Digite o valor de b: ") || "0");
    const c = parseFloat(prompt("Digite o valor de c: ") || "0");

    if (a === 0) {
        console.log("Não é uma equação do segundo grau.");
        continuacao();
        return;
    }

    const delta = Math.pow(b, 2) - 4 * a * c;

    if (delta < 0) {
        console.log("A equação não possui raízes reais.");
    } else {
        const x1 = (-b + Math.sqrt(delta)) / (2 * a);
        const x2 = (-b - Math.sqrt(delta)) / (2 * a);
        console.log(`As raízes da equação são: x1 = ${x1}, x2 = ${x2}`);
        ultimoResultado = { x1, x2 };
    }
    continuacao();
}

// Funções de Conversão
function conversoes() {
    console.clear();
    console.log("Selecione a conversão:");
    console.log("1 - Decimal para binário");
    console.log("2 - Binário para decimal");
    console.log("3 - Binário para octal");
    console.log("4 - Octal para binário");
    console.log("5 - Binário para hexadecimal");
    console.log("6 - Hexadecimal para binário");
    console.log("7 - Voltar ao Menu Principal");
    const selecao = parseInt(prompt("Digite a opção de conversão: ") || "0");
    switch (selecao) {
        case 1:
            decimalParaBinario();
            break;
        case 2:
            binarioParaDecimal();
            break;
        case 3:
            binarioParaOctal();
            break;
        case 4:
            octalParaBinario();
            break;
        case 5:
            binarioParaHexadecimal();
            break;
        case 6:
            hexadecimalParaBinario();
            break;
        case 7:
            menuPrincipal();
            break;
        default:
            console.log("Opção inválida");
            continuacao(true);
    }
}

// Funções de Conversão de Bases
function decimalParaBinario() {
    const decimal = parseInt(prompt("Digite o número decimal: ") || "0");
    const resultado = decimal.toString(2);
    console.log(`O valor binário é: ${resultado}`);
    continuacao(true);
}

function binarioParaDecimal() {
    const binario = prompt("Digite o número binário: ") || "0";
    const resultado = parseInt(binario, 2);
    console.log(`O valor decimal é: ${resultado}`);
    continuacao(true);
}

function binarioParaOctal() {
    const binario = prompt("Digite o número binário: ") || "0";
    const decimal = parseInt(binario, 2);
    if (isNaN(decimal)) {
        console.log("Número binário inválido.");
    } else {
        const resultado = decimal.toString(8);
        console.log(`O valor octal é: ${resultado}`);
    }
    continuacao(true);
}

function octalParaBinario() {
    const octal = prompt("Digite o número octal: ") || "0";
    const decimal = parseInt(octal, 8);
    if (isNaN(decimal)) {
        console.log("Número octal inválido.");
    } else {
        const resultado = decimal.toString(2);
        console.log(`O valor binário é: ${resultado}`);
    }
    continuacao(true);
}

function binarioParaHexadecimal() {
    const binario = prompt("Digite o número binário: ") || "0";
    const decimal = parseInt(binario, 2);
    if (isNaN(decimal)) {
        console.log("Número binário inválido.");
    } else {
        const resultado = decimal.toString(16).toUpperCase();
        console.log(`O valor hexadecimal é: ${resultado}`);
    }
    continuacao(true);
}

function hexadecimalParaBinario() {
    const hexadecimal = prompt("Digite o número hexadecimal: ") || "0";
    const decimal = parseInt(hexadecimal, 16);
    if (isNaN(decimal)) {
        console.log("Número hexadecimal inválido.");
    } else {
        const resultado = decimal.toString(2);
        console.log(`O valor binário é: ${resultado}`);
    }
    continuacao(true);
}


// Início do programa
function main() {
    while (FLAG) {
        menuPrincipal();
    }
}
main();
