rem exemplo criado com yabasic 

input "Digite um número para inicializar... -> " numero
print

maior = numero
menor = numero

label ler_numero
input "Digite outro número para comparar, ou 0 (zero) para finalizar. -> " numero
print

if (numero = 0) goto finalizar

if (numero > maior) maior = numero
if (numero < menor) menor = numero

goto ler_numero

label finalizar
print "========"
print "O maior número inserido foi ", maior
print "O menor número inserido foi ", menor
print "========"

