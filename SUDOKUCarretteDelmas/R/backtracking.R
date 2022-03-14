#'Algorithme de résolution de la grille incomplete
#'
#'@param grilleincomplete une grille 9x9 incomplete
#'@author Camille Carrette Jean Charles Delmas
#'
#'@examples
#'m<-gengrillecomplete(m)
#'mc2<-genGrilleIncomplete(m,1)
#'backtracking(m2)
#'@export

backtracking <- function(grilleincomplete){

  absentSurLigne<-function(k,grille,i){
    absent <- TRUE
    for(j in 1:9){
      if(grille[i,j] == k ){
        absent <- FALSE
      }
    }
    absent
  }

  absentSurColonne<-function(k,grille,j){
    absent <- TRUE
    for(i in 1:9){
      if(grille[i,j] == k ){
        absent <- FALSE
      }
    }
    absent
  }



}
