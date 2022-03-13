library(shiny)
library(shinyMatrix)

#' Coté server de l'app shiny sudoku
#'@author Camille Carrette Jean Charles Delmas
#'@export

server <- function(input,output){

  observeEvent(input$genGrille, { #clic du bouton de génération de la grille
    grillecomplete <- genGrilleComplete() #création d'un grille complete
    if(input$Choixgrille == "complete"){ #si on choisi d'afficher la grille compete
      m = reactive({grillecomplete})
      output$displayGrid <- renderUI({
        div(matrixInput(
          inputId = "newGrid",
          value = m(),
          rows = list(names = FALSE),
          cols = list(names = FALSE)
          ),)
      })

    }else{ #choix de l'affichage incomplet
      if(input$level == 'facile'){ #ajustement de la difficulté
        diff <- 1
      }else{
        diff <- 2
      }

      grilleIncomplete <- genGrilleIncomplete(grillecomplete,diff) #on cache certaines valeurs
      m = reactive({grilleIncomplete})
      output$displayGrid <- renderUI({
        div(
          matrixInput(
            inputId = "newGrid",
            value = m(),
            class = numeric(),
            rows = list(names = FALSE),
            cols = list(names = FALSE),

          ),
          actionButton('submit','test de la solution'), #affichage du bouton de soumission de la réponse
          actionButton('solve','Afficher le résultats')
            )
      })
      observeEvent(input$submit, {
        victory <- CompareMatrix(grillecomplete,input$newGrid) #booléen vrai si les input sont justes
        print(grillecomplete)
        print(grilleIncomplete)
        output$Resultat <- renderText({
          if(victory){
            "Bravo ! Vous avez réussi !"
          }else{
            "essaie encore"
          }
        })
      })
      observeEvent(input$solve, {
        m = reactive({grillecomplete}) #algo de backtracking TODO
        output$displaySolve <- renderUI({
          div(
            matrixInput(
              inputId = "newGrid",
              value = m(),
              class = numeric(),
              rows = list(names = FALSE),
              cols = list(names = FALSE),

            )
          )
        })
      })
    }
  })
}
