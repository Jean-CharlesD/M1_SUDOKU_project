---
author: "Jean-Charles DELMAS & Camille CARRETTE"
date: "14/03/2022"
ue: HAX815X R avancé
depedences : shiny, shinyMatrix
---

#PROJET SUDOKU  

###Lancement de l'application sudoku

```{r}
shinyApp(ui = ui, server=server)
```

###Fonction de Génération d'une grille complete (9x9, entier de 1 à 9, remplissage pour sudoku)

```{r}
genGrilleComplete()
```

###Fonction de Génération d'une grille incomplete à partir d'une grille de genGrilleComplete()
###choix d'une dificulté (1 ou 2)

```{r}
genGrilleIncomplete(grille,difficulté)
```

###Fonction de comparaison de matrices

```{r}
CompareMatrix(grille1,grille2)
```


