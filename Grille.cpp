#include <iostream>
#include <string>
#include <map> //pour les tableaux associatifs
#include <ctime>

using namespace std;

int main(){
    int grille[9][9];
    int tmp = 1;


    //remplissage grille
    for(int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++){
            grille[i][j]=0;
        }
    }

    //première ligne
    srand((unsigned int)time(0));
    int val;
    for(int i = 1 ; i < 9 ; i++){
        val =rand() % 9 +1;
        grille[0][val]=i;
    }

    for(int i = 1; i < 9; i++){
        for(int j = 0; j < 9; j++){
            if(i<3){
                if(j >= 3){
                    grille[i][j]=grille[i-1][j-3];
                }else{
                    grille[i][j]=grille[i-1][j+6];
                }
                }else{
                //grille[i][j]=0;
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