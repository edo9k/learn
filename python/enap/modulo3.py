#!/usr/bin/python3

# this section deals with basic data structures
# list syntax seems to be the same of Javascript, mosly.

lista_com_sintaxe_igual_js = []

jeito_menos_legal_e_mais_verboso = list()

# intialize and populate
palavras = ["Hello", "Oi", "Hola", "Hallo", "Salut", "Konichwa"]

# lists can have mixed types, like in JS
lista_mista = ["Anthing goes", 'X', 666, False, .69123, []] 

# printing all lists
print(palavras, 
        lista_mista, 
        lista_com_sintaxe_igual_js, 
        jeito_menos_legal_e_mais_verboso)
print("-"*20)

# lists are zero indexed, as it should be.
print("First element of some list: {}".format(palavras[0]))
print("Second element of some list: {}".format(lista_mista[1]))

print("\nList before manitpulation {}".format(palavras))
print("Using list.remove('Hello')")
palavras.remove("Hello")
print(palavras)
print("Adding an item with list.append('Tiao')")
palavras.append("Tiao")
print(palavras)

# Python also has biltin tuples, sets and dictionaries.
# I'm not gonna copy the examples because they're all too dumb.

