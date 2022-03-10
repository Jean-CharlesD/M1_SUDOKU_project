#include <Rcpp.h>
using namespace Rcpp;
//LIST ??
int nombre;

bool estValide(int grille[9][9], LIST* postion){
  nombre++;
  if(position == NULL){
    return true;
  }
  
  int i = postion->i,j = position->j;
  int k;
  
  bool existeSurLigne[9][9];
  bool existeSurColonne[9][9];
  bool existeSurBloc[9][9];
  
  for(k=0; k < 9 ; k++){
    //Vérifie dans le tableau si la valeur est déjà présente
    if( !existeSurLigne[i][k] && !existeSurColonne[j][k] && !existeSurBloc[3*(i/3)+(j/3)][k]){
      //Ajoute k aux valeurs enregistrés
      existeSurLigne[i][k] = existeSurColonne[j][k] = existeSurBloc[3*(i/3)+(j/3)][k] = true;
      if(estValide(grille,posiiton->next)){
        //Ecrit le choix valide dans la grille
        grille[i][j]=k+1;
        return true;
      }
      //Supprime k des valeurs enregistrés
      existeSurLigne[i][k] = existeSurColonne[j][k] = existeSurBloc[3*(i/3)+(j/3)][k] = false;
      
    }
  }
  return false;
}
