#!/usr/bin/env python3

'''
Exemplo de exercícios para iniciantes. 

O exercício pede que o script leia números inteiros, e para os números lidos
guarde (a) qual é o maior e (b) quantas vezes ele apareceu.
'''

maiorNumero = -1
contagem    = -1
inputNumero = -1

print("Entre um número inteiro maior ou igual a zero")
print("ou -1 (menos um) para encerrar o programa.")

while True:
    print("digite um número -> ", end="")
    inputNumero = int(input())

    print(f" (digitado {inputNumero})")

    if inputNumero == -1:
        break

    if inputNumero == maiorNumero:
        contagem = contagem + 1

    if inputNumero > maiorNumero:
        maiorNumero = inputNumero
        contagem = 1

print("\n -- programa encerrado -- \n")
print(f"Maior número digitago {maiorNumero}.")
print(f"Foi digitado {contagem} vezes.")

