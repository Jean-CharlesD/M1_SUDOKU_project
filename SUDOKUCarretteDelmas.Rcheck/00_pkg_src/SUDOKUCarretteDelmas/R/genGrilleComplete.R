#'@title Génère une matrice 9x9
#'
#'@return grille complete de sudoku
#'@author Camille Carrette Jean Charles Delmas
#'@examples
#'m<-genGrilleComplete()
#'@export

genGrilleComplete<-function(){
  grille<-matrix(0,ncol=9,nrow=9) #intialisation à 0

  grille[1,]<-sample(9)#première ligne

  #remplissage des lignes 2 et 3
  for(i in 2:9){
    for(j in 1:9){
      if(i<=3){
        if(j>3){
          grille[i,j]<-grille[i-1,j-3]
        }else{
          grille[i,j]<-grille[i-1,j+6]
        }
      }
    }
  }
  #remplissage du reste
  for(i in 2:9){
    for(j in 1:9){
      if(i > 3){
        if(j == 1 || j == 4 || j == 7){
          grille[i,j]<-grille[i-3,j+2]
        }else{
          grille[i,j]<-grille[i-3,j-1];
        }
      }
    }
  }


  grille
}
