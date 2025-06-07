
# Dashboard de Imóveis em Leilão na Caixa 

Os dados vem do arquivo imoveis.csv, disponível para download 
no site de Imóveis da Caixa Econômica Federal 
https://venda-imoveis.caixa.gov.br/sistema/download-lista.asp 

## build 
podman build -t dash-app .

## run 
podman run --rm -it -p 8050:8050 -v $(pwd):/app:Z --userns=keep-id dash-app
