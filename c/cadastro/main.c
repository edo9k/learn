#include <stdio.h>
#include <string.h>

#define TAMANHO_CODIGO    10
#define TAMANHO_NOME      100
#define TAMANHO_ENDERECO  255
#define TAMANHO_TELEFONE  25

typedef struct Pessoa {
  char codigo   [ TAMANHO_CODIGO   ];
  char nome     [ TAMANHO_NOME     ];
  char endereco [ TAMANHO_ENDERECO ];
  char telefone [ TAMANHO_TELEFONE ];
} Pessoa;

void imprime_pessoa(Pessoa* p) {
  printf("Código:   %s", p->codigo);
  printf("Nome:     %s", p->nome);
  printf("Endereço: %s", p->endereco);
  printf("Telefone: %s", p->telefone);
}

/* TODO 
 * filtar input, não aceitar input vazio;
 * checar se o código já foi cadastrado, notificar o usuário;
 */
void le_pessoa(Pessoa* p) {

  printf("Código: ");
  fgets(p->codigo, TAMANHO_CODIGO, stdin);

  printf("Nome:   ");
  fgets(p->nome, TAMANHO_NOME, stdin);
  
  printf("Endereço: ");
  fgets(p->endereco, TAMANHO_ENDERECO, stdin);

  printf("Telefone: ");
  fgets(p->telefone, TAMANHO_TELEFONE, stdin);
}


int main () {
  Pessoa pessoas[10];     // essa lista guarda as pessoas cadastradas
  int indice_pessoa = 0;  // marca em que posição a lista estamos 

  char continuar = 's';

  while (continuar != 'n') {

    le_pessoa(&pessoas[indice_pessoa]);
    indice_pessoa++;

    printf("\nCadastrar outra pessoa? [S/n]\n");
    continuar = getchar();
  }

  printf("-----------------------------\n");
  imprime_pessoa(&pessoas[0]);

  return 0;
}

