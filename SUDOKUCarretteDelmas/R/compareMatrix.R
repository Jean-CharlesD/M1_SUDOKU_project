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