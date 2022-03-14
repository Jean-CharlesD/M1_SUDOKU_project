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

  absentSurBloc<-function(k,grille,i,j){
    if(i<=3){
      i2<-1
    }else if(i>3 & i <=6){
      i2<-4
    }else{
      i2<-7
    }

    if(j<=3){
      j2<-1
    }else if(j>3 & j <=6){
      j2<-4
    }else{
      j2<-7
    }

    absent <- TRUE
    for(i in i2:(i2+2)){
      for(j in j2:(j2+2)){
        if(grille[i,j]==k){
          absent <- FALSE
        }
      }
    }
    absent
  }

  estValide<-function(grille,position){

    if(position == 9*9){ #si fin de grille on sors
      return(TRUE)
    }


    #décomposiion de la position (en x et en y)
    i <- position%/%9
    j <- position%%9

    i<-i+1
    j<-j+1

    if(grille[i,j] != ""){ #parcours des postion déjà remplies
      return(estValide(grille,position+1))
    }

    for(k in 1:9){
      if(absentSurLigne(k,grille,i) & absentSurColonne(k,grille,j) & absentSurBloc(k,grille,i,j)){
        print(paste("ajout de ",k," à la pos ",i, " : ",j ))
        grille[i,j]<-k


        if (estValide(grille,position+1)){
          return(TRUE)
        }
      }
    }
    grille[i,j]<-""

    return(FALSE)
  }

  estValide(grilleincomplete,0)
  grilleincomplete
}
