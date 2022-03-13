---
title: "SUDAUCUL_main"
author: "Jean-Charles DELMAS & Camille CARRETTE"
date: "24/02/2022"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

###Fonction de Génération de la grille complete

```{r}
genGrilleComplete()
```

###Fonction de Génération de la grille incomplete

```{r}
genGrilleIncomplete(grille,difficulté)
```

###Fonction de comparaison de matrice

```{r}
CompareMatrix(grille1,grille2)
```

###Lancement de l'application

```{r}
shinyApp(ui = ui, server=server)
```
