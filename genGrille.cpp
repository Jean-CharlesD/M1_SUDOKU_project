#include <Rcpp.h>
#include <iostream>
#include <string>
#include <map> //pour les tableaux associatifs
#include <ctime>

using namespace Rcpp;
using namespace std;

void RandPermut(int *ent, int n) { 
  for (int r, i=n; i>0;) {
    int e=ent[r=rand()%i]; 
    ent[r]=ent[--i]; 
    ent[i]=e;}
}

// [[Rcpp::export]]
NumericVector GenGrille(bool complete, int dificulty){ //génération d'une grille compète
  int grille[9][9];
  
  //remplissage grille
  for(int i = 0; i < 9; i++){
    for(int j = 0; j < 9; j++){
      grille[i][j]=0;
    }
  }
  
  //première ligne
  srand((unsigned int)time(0));
  for(int i = 0 ; i < 9 ; i++){
    grille[0][i]=i+1;
  }
  
  RandPermut(grille[0],9); //permutation aléatoire des entiers de la première ligne
  
  //remplissage des premières lignes
  for(int i = 1; i < 9; i++){
    for(int j = 0; j < 9; j++){
      if(i<3){
        if(j >= 3){
          grille[i][j]=grille[i-1][j-3];
        }else{
          grille[i][j]=grille[i-1][j+6];
        }
      }
    }
  }
  
  //remplplissage du reste
  for(int i = 1; i < 9; i++){
    for(int j = 0; j < 9; j++){
      if(i >= 3){
        if(j % 3 == 0){
          grille[i][j]=grille[i-3][j+2];
        }else{
          grille[i][j]=grille[i-3][j-1];
        } 
      }
    }
  }
  //affchage grille / création de la sortie
  NumericVector out(81); //vecteur qui va contenir les valeurs de la grille
  int cpt = 0;
  for(int i = 0; i < 9; i++){
    for(int j = 0; j < 9; j++){
      //cout<<grille[i][j]<<"  ";
      if(complete){
        out[cpt]=grille[j][i]; //remplisage du vecteur 
      }else{ //on met des valeurs à 0
        if(dificulty == 1){//remplissage de 0 au niveau de difficulté 1 
          if(!((i+j)%3==0)){
            out[cpt]=grille[j][i];
          }
        }else if(dificulty == 2){//remplissage de 0 au niveau de difficulté 2
          
        }else{//remplissage de 0 au niveau de difficulté 3
          if((i+j)%3==0){
            out[cpt]=grille[j][i];
          }
        }
      }
      cpt++;
    }
    //cout<<endl;
  }
  return out;
}
