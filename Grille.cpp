#include <iostream>
#include <string>
#include <map> //pour les tableaux associatifs
#include <ctime>

using namespace std;

void RandPermut(int *ent, int n) { 
        for (int r, i=n; i>0;) {
            int e=ent[r=rand()%i]; 
            ent[r]=ent[--i]; 
            ent[i]=e;}
    }

void genGrille(){
    int grille[9][9];

    //remplissage grille
    for(int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++){
            grille[i][j]=0;
        }
    }

    //première ligne
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

    //remplplissage des colones
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
    //affchage grille
    for(int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++){
            cout<<grille[i][j]<<"  ";
        }
        cout<<endl;
    }
}


int main(){

    genGrille();

}