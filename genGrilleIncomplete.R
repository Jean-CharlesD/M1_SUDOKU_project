#générer une grille incomplete à partir d'une grille complete (matrice) et d'une difficulté (entier)
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