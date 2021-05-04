# flr
A functional implementation of linear regression.

## Equipe
- João Paulo (jpgf)
- Nara Souza (nsa2)
- Thiago Casa Nova (tcnl)

## Requisitos
- GHC/GHCI
- QuickCheck

## Como usar
Definir no arquivo `/flr/Main.hs` todos os parâmetros (lr, maxiter, porcentagem dataset, w, b) e o dataset.
```
~ ghci
~ Prelude> :l /flr/Main.hs
~ Prelude> main
```

## Limitações e TODO
* Normalização do dataset podem causar valores NaN no resultado final.
* Valores altos no dataset causam NaN no resultado final.
* O ideal seria ler um dataset de um arquivo `.csv` e converter para `[[Floating]]`,
  mas devido curto tempo de entrega não conseguimos implementar essa funcionalidade.
* Outra funcionalidade seria para ler os parâmetros (lr, maxiter, porcentagem do dataset)
  da linha de comando usando um parsing.
* Plotar o hiperplano aprendido junto com o conjunto de dados.
