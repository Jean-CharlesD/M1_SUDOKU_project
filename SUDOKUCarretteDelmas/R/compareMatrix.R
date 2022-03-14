#'@title Comparaison de matrice 9x9
#'
#'@param grille1 une grille 9x9
#'@param grille2 une grille 9x9
#'@return booléen TRUE si grille1 est similaire à grille2
#'@author Camille Carrette Jean Charles Delmas
#'@examples
#'m<-matrix(1:9,nrow=9,ncol=9)
#'CompareMatrix(m,m)
#'@export

CompareMatrix <- function(grille1,grille2){
  result <- TRUE
  for(i in 1:9){
    for( j in 1:9){
      if(grille1[i,j] != grille2[i,j]){
        result <- FALSE
      }
    }
  }
  result
}
