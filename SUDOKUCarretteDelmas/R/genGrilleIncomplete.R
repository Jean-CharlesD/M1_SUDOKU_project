#'@title Génère une matrice incomplete
#'
#'@param grille une grille complete pour sudoku
#'@param diff entier indiquant la difficulté du sudoku
#'@return la grille incomplete
#'@author Camille Carrette Jean Charles Delmas
#'@examples
#'m<-genGrilleComplete()
#'genGrilleIncomplete(m,2)
#'@export

genGrilleIncomplete <- function(grille,diff){

for(j in 1:9){

  cases<-sample(3,diff)
  cases<-c(cases,sample(4:6,diff))
  cases<-c(cases,sample(7:9,diff))
  cases

  for(i in cases){
    grille[j,i]<-""
  }
}

grille
}
