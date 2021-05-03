# flr
A functional implementation of linear regression.

## Requisitos
- Linux
- GHC/GHCI
- QuickCheck

## Como usar
Definir no arquivo Main.hs todos os parâmetros manualmente incluindo o dataset.
```
~ ghci
~ :l /path/Main.hs
~ main
```

## Limitações e TODO
* Normalização do dataset causa valores NaN no resultado final.
* Valores altos no dataset causam NaN também no resultado final.
* O ideal seria ler um dataset de um arquivo csv e converter para [[Floating]],
  mas devido ao tempo não conseguimos implementar essa funcionalidade.
* Funcionalidade para ler os parâmetros (lr, maxiter, porcentagem do dataset)
  da linha de comando usando um parsing.
* Plotar o hiperplano aprendido junto com o conjunto de dados.
