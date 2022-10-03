"""mostra o total de urnas apuradas por estado (eleição federal 2022)"""

import urllib.request, json 
from time import sleep

def progress(percent=0, width=80):
    left = width * percent // 100
    right = width - left
    
    tags = "=" * left
    spaces = " " * right
    percents = f"{percent:.0f}%"
    
    return f"[{tags}{spaces}] {percents}"

estados = ['ac', 'al', 'ap', 'am', 'ba', 'ce', 'df', 'es', 'go', 'ma', 'mt', 'ms', 'mg', 'pa', 'pb', 'pr', 'pe', 'pi', 'rj', 'rn', 'rs', 'ro', 'rr', 'sc', 'sp', 'se', 'to']

# https: //resultados.tse.jus.br/oficial/ele2022/544/dados-simplificados/es/es-c0001-e000544-r.json
urls = [f"https://resultados.tse.jus.br/oficial/ele2022/544/dados-simplificados/{estado}/{estado}-c0001-e000544-r.json" for estado in estados ]

estados_urls = zip(estados, urls)

print("Total de urnas apuradas ")

for x in estados_urls:
  sleep(1.5)
  try:
    with urllib.request.urlopen(x[1]) as url:
      porcentagem_de_urnas = json.load(url)["pst"]
      print(f"{x[0].upper()} -> { progress( int(float(porcentagem_de_urnas.replace(',','.')))) }")
  except Exception as e: 
    print(f"{x[0].upper()} errored. {e}")

