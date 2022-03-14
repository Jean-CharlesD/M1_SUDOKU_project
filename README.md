---
projet: Génération aléatoire de grilles de Sudoku
author: "Jean-Charles DELMAS & Camille CARRETTE"
date: "14/03/2022"
ue: HAX815X R avancé
depedences : shiny, shinyMatrix
---

# PROJET SUDOKU  

***

Lancement de l'application sudoku

```{r}
shiny::shinyApp(ui = ui, server=server)

```
***

Backtracking

```{r}
backtracking()
```
!!!En développement, la version actuel ne fait que des print des ajouts nécessaire à la solution (elle n'est pas integrée à l'app pour le moment)

***

Fonction de Génération d'une grille complete (9x9, entier de 1 à 9, remplissage pour sudoku)

```{r}
genGrilleComplete()

```

***

Fonction de Génération d'une grille incomplete 
A partir d'une grille de genGrilleComplete() choix d'une dificulté (1 ou 2)

```{r}
genGrilleIncomplete(grille,difficulté)

```

***

Fonction de comparaison de matrices

```{r}
CompareMatrix(grille1,grille2)

```

***

Projet effectué dans le cadre de l'ue HAX815X R avancé durant le master Bioinformatique.
